---
name: "Diagnosing Degenerate Regression After Feature Reduction"
memory_type: episodic
subtype: failure
domain: computer-science
subdomain: machine-learning
contributor: zhuofli
---
## Situation
You were building a regression pipeline using PCA-derived features (from statistical shape modeling) to predict growth-related targets. You applied feature filtering (variance threshold + correlation filtering), reducing feature counts (e.g., 68 → 43).

## Action
You trained regression models (linear, SVR) on the reduced feature sets and observed outputs collapsing toward the mean rather than capturing meaningful variation.

## Outcome
Model predictions became nearly constant, indicating loss of predictive signal despite 'cleaner' features.

## Implication
Aggressive feature filtering in already compressed representations (e.g., PCA scores) can destroy weak but meaningful signals, especially in low-sample regimes.

## Lesson
Feature reduction is not monotonic in benefit. When working with already low-dimensional, information-dense features, further filtering can cause rank deficiency or signal collapse, leading to trivial predictors.

## Retrieval Cues
When model predictions collapse to mean values
When feature count is aggressively reduced after PCA
When regression outputs show low variance regardless of model choice
When working with small datasets and high compression
