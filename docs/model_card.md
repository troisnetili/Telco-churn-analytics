# Model Card

**Task:** Binary classification of customer churn.

**Target:** `Churn_flag` (1 = churn, 0 = active).

**Models:** Logistic Regression and Random Forest.

**Validation:** Stratified 80/20 train/test split, random_state=42.

**Metrics:** Accuracy, precision, recall, F1 and ROC-AUC.

**Use:** Portfolio demonstration and retention prioritisation analysis.

**Limitations:** Static observational dataset, no time-based validation, no causal inference, and no production monitoring.
