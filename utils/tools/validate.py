#!/usr/bin/env python3
"""Validate ResearchSkills skill files against the schema defined in SKILL_SCHEMA.md."""

import sys
import re
from pathlib import Path

try:
    import yaml
except ImportError:
    print("ERROR: pyyaml not installed. Run: pip install pyyaml")
    sys.exit(1)

REQUIRED_FIELDS = {
    "name": str,
    "memory_type": str,
    "subtype": str,
    "domain": str,
    "subdomain": str,
    "contributor": str,
}

VALID_MEMORY_TYPES = {"procedural", "semantic", "episodic"}
VALID_SUBTYPES = {
    "procedural": {"tie", "no-change", "constraint-failure", "operator-fail"},
    "semantic": {"frontier", "non-public", "correction"},
    "episodic": {"failure", "adaptation", "anomalous"},
}

REQUIRED_SECTIONS = {
    "semantic": ["## Fact"],
    "episodic": ["## Situation", "## Action", "## Outcome"],
}

REPO_ROOT = Path(__file__).resolve().parent.parent.parent
SKILLS_DIR = REPO_ROOT / ".agents" / "skills"

# Derive valid domains from directory structure (single source of truth)
VALID_DOMAINS = {p.name for p in SKILLS_DIR.iterdir() if p.is_dir() and not p.name.startswith('.')} if SKILLS_DIR.is_dir() else set()


def slugify(value: str) -> str:
    """Normalize display names to the filename slug convention."""
    value = value.lower().replace("_", "-")
    value = re.sub(r"[^a-z0-9]+", "-", value)
    return value.strip("-")


def validate_path(path: Path) -> list[str]:
    """Validate that the skill file is in a correct .agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/ directory."""
    errors = []
    try:
        rel = path.resolve().relative_to(SKILLS_DIR)
    except ValueError:
        errors.append(f"File is not under .agents/skills/ directory")
        return errors

    parts = rel.parts  # e.g. ('physics', 'geophysics', 'jdoe', 'semantic', 'correction--x.md')
    if len(parts) < 5:
        errors.append(f"File must be in .agents/skills/<domain>/<subdomain>/<contributor>/<memory_type>/, got: .agents/skills/{'/'.join(parts)}")
        return errors

    domain, subdomain, contributor, memory_type = parts[0], parts[1], parts[2], parts[3]
    if domain not in VALID_DOMAINS:
        errors.append(f"Invalid domain folder '{domain}'. Must be one of: {sorted(VALID_DOMAINS)}")

    subdomain_dir = SKILLS_DIR / domain / subdomain
    if not subdomain_dir.is_dir():
        errors.append(f"Subdomain folder '.agents/skills/{domain}/{subdomain}/' does not exist")

    if not contributor:
        errors.append("Contributor folder must not be empty")

    if memory_type not in VALID_MEMORY_TYPES:
        errors.append(f"Invalid memory type folder '{memory_type}'. Must be one of: {sorted(VALID_MEMORY_TYPES)}")

    return errors


def validate_file(path: Path) -> list[str]:
    errors = []

    # Validate file path structure
    errors.extend(validate_path(path))

    text = path.read_text(encoding="utf-8")

    # Extract YAML frontmatter
    if not text.startswith("---"):
        errors.append("Missing YAML frontmatter (file must start with ---)")
        return errors

    parts = text.split("---", 2)
    if len(parts) < 3:
        errors.append("Malformed YAML frontmatter (no closing ---)")
        return errors

    try:
        front = yaml.safe_load(parts[1])
    except yaml.YAMLError as e:
        errors.append(f"YAML parse error: {e}")
        return errors

    if not isinstance(front, dict):
        errors.append("Frontmatter is not a YAML mapping")
        return errors

    # Check required fields
    for field, ftype in REQUIRED_FIELDS.items():
        if field not in front or front[field] is None:
            errors.append(f"Missing required field: '{field}'")
        elif not isinstance(front[field], (str, ftype)):
            errors.append(f"Field '{field}' must be a string")

    # Validate enum fields
    if front.get("domain") and front["domain"] not in VALID_DOMAINS:
        errors.append(f"Invalid domain '{front['domain']}'. Must be one of: {sorted(VALID_DOMAINS)}")

    memory_type = front.get("memory_type")
    subtype = front.get("subtype")
    if memory_type and memory_type not in VALID_MEMORY_TYPES:
        errors.append(f"Invalid memory_type '{memory_type}'. Must be one of: {sorted(VALID_MEMORY_TYPES)}")

    if memory_type in VALID_SUBTYPES and subtype and subtype not in VALID_SUBTYPES[memory_type]:
        errors.append(f"Invalid subtype '{subtype}' for memory_type '{memory_type}'. Must be one of: {sorted(VALID_SUBTYPES[memory_type])}")

    # Check name matches filename
    expected_name = path.stem.split("--", 1)[1] if "--" in path.stem else path.stem
    if front.get("name") and slugify(front["name"]) != expected_name:
        errors.append(f"'name' field '{front['name']}' does not match filename '{expected_name}'")

    # Check required sections in body
    body = parts[2]
    required_sections = REQUIRED_SECTIONS.get(memory_type, [])
    if memory_type == "procedural":
        has_decision_schema = ("## When" in body or "## When + Exclusions" in body) and "## Decision" in body
        has_procedure_schema = "## Situation" in body and "## Procedure" in body
        if not (has_decision_schema or has_procedure_schema):
            errors.append("Missing procedural structure: use either '## When' + '## Decision' or '## Situation' + '## Procedure'")
    for section in required_sections:
        if section not in body:
            errors.append(f"Missing required section: '{section}'")

    return errors


def main():
    paths = [Path(p) for p in sys.argv[1:] if p.endswith(".md")]
    if not paths:
        print("Usage: validate.py <skill1.md> [skill2.md ...]")
        sys.exit(1)

    all_ok = True
    for path in paths:
        if not path.exists():
            print(f"SKIP  {path} (file not found)")
            continue
        errors = validate_file(path)
        if errors:
            all_ok = False
            print(f"FAIL  {path}")
            for e in errors:
                print(f"      - {e}")
        else:
            print(f"OK    {path}")

    sys.exit(0 if all_ok else 1)


if __name__ == "__main__":
    main()
