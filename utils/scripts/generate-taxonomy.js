#!/usr/bin/env node
/**
 * generate-taxonomy.js
 *
 * Scan `.agents/skills/<domain>/<subdomain>/` directories and emit a JSON file
 * mapping domain → sorted list of subdomains. This is the single source of
 * truth for the arXiv-aligned taxonomy used by:
 *   - webserver review page (subdomain dropdown)
 *   - ResearchSkills meta skill workflows (domain mapping)
 *   - any future tooling that needs the list
 *
 * Usage (from repo root):
 *   node utils/scripts/generate-taxonomy.js
 *
 * Options:
 *   --skills <path>   directory to scan (default: ./.agents/skills)
 *   --out <path>      JSON output path (default: ./webserver/public/taxonomy.json)
 *   --pretty          pretty-print JSON (default: true)
 */
'use strict';

const fs = require('fs');
const path = require('path');

function parseArgs(argv) {
  const opts = {
    skills: path.join('.agents', 'skills'),
    out: path.join('webserver', 'public', 'taxonomy.json'),
    pretty: true,
  };
  for (let i = 2; i < argv.length; i++) {
    const a = argv[i];
    if (a === '--skills') opts.skills = argv[++i];
    else if (a === '--out') opts.out = argv[++i];
    else if (a === '--no-pretty') opts.pretty = false;
  }
  return opts;
}

function isDir(p) {
  try { return fs.statSync(p).isDirectory(); } catch { return false; }
}

function listDirs(parent) {
  return fs.readdirSync(parent, { withFileTypes: true })
    .filter((d) => d.isDirectory())
    .map((d) => d.name)
    .sort();
}

function main() {
  const opts = parseArgs(process.argv);
  const skillsDir = path.resolve(opts.skills);
  const outPath = path.resolve(opts.out);

  if (!isDir(skillsDir)) {
    console.error(`error: skill directory not found: ${skillsDir}`);
    process.exit(1);
  }

  const domains = listDirs(skillsDir);
  const taxonomy = {};
  let totalSubdomains = 0;

  for (const domain of domains) {
    const subdomains = listDirs(path.join(skillsDir, domain));
    taxonomy[domain] = subdomains;
    totalSubdomains += subdomains.length;
  }

  const payload = {
    generated_at: new Date().toISOString(),
    source: path.relative(process.cwd(), skillsDir),
    domain_count: domains.length,
    subdomain_count: totalSubdomains,
    taxonomy,
  };

  fs.mkdirSync(path.dirname(outPath), { recursive: true });
  fs.writeFileSync(outPath, JSON.stringify(payload, null, opts.pretty ? 2 : 0) + '\n');

  console.log(`✓ wrote ${path.relative(process.cwd(), outPath)}`);
  console.log(`  ${domains.length} domains, ${totalSubdomains} subdomains`);
  for (const d of domains) {
    console.log(`    ${d}: ${taxonomy[d].length}`);
  }
}

main();
