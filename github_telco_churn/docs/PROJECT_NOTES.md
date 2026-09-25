# Project Notes

## Business interpretation

The project is designed to demonstrate an analyst-to-data-science workflow rather than claim that machine learning alone solves churn. The model gives a probability estimate that can be combined with business rules and customer context.

## Why Logistic Regression is included

Logistic Regression provides a simple, interpretable baseline and produces probabilities that are easy to turn into a risk score.

## Why Random Forest is included

Random Forest provides a second model that can capture non-linear relationships. Comparing it with Logistic Regression demonstrates model evaluation rather than assuming that a more complex model is automatically better.

## Modelling caveat

The dataset is a static customer snapshot. The model is therefore a portfolio demonstration, not a production churn system. A production system should consider time leakage, model monitoring, calibration, fairness, intervention cost and changing customer behaviour.
