# ================================
# R Starter Script: Final Exam – Hospital Readmission Prediction
# ================================

# === Step 1: Load Required Libraries ===
library(dplyr)
library(ggplot2)
library(caret)
library(pROC)
library(e1071)

# === Step 2: Load Dataset ===
# Update this path if needed, or use relative path if downloaded from GitHub
df <- read.csv("C:\\Users\\Patil\\Downloads\\diabetes+130-us+hospitals+for+years+1999-2008\\diabetic_data.csv", stringsAsFactors = FALSE)

# === Step 3: Create Binary Target Variable ===
# 1 = readmitted within 30 days ("<30"), 0 = not readmitted (">30" or "NO")
df$readmitted_flag <- ifelse(df$readmitted == "<30", 1, 0)

# We treat only "<30" as a positive case for early readmission.
# "NO" and ">30" are both treated as negative (not high-priority for intervention).

# === Step 4: Select Subset of Relevant Features ===
selected_vars <- c(
  "race", "gender", "age", "admission_type_id", 
  "discharge_disposition_id", "admission_source_id", 
  "time_in_hospital", "num_lab_procedures", "num_procedures", 
  "num_medications", "number_outpatient", "number_emergency",
  "number_inpatient", "number_diagnoses", "insulin", 
  "diabetesMed", "readmitted_flag"
)

df <- df[, selected_vars]

# === Step 5: Handle Missing or Invalid Values ===
# Remove rows with unknown race or invalid gender
df <- df %>% filter(race != "?", gender != "Unknown/Invalid")

# === Step 6: Encode Categorical Variables ===
categorical_vars <- c("race", "gender", "age", "insulin", "diabetesMed")
df[categorical_vars] <- lapply(df[categorical_vars], as.factor)

# === Step 7: Split into Train and Test Sets ===
set.seed(123)
train_index <- createDataPartition(df$readmitted_flag, p = 0.7, list = FALSE)
train <- df[train_index, ]
test <- df[-train_index, ]

# === Step 8: Placeholder for Modeling ===
# Example: Logistic Regression
# model_logit <- glm(readmitted_flag ~ ., data = train, family = "binomial")

# Example: Decision Tree (if needed)
# library(rpart)
# model_tree <- rpart(readmitted_flag ~ ., data = train, method = "class")

# === Step 9: Placeholder for Evaluation ===
# Use confusionMatrix, ROC, etc.
# predictions <- predict(model_logit, test, type = "response")
# predicted_class <- ifelse(predictions > 0.5, 1, 0)
# confusionMatrix(factor(predicted_class), factor(test$readmitted_flag))

# === Step 10: Interpretation ===
# Add comments, plots, or variable importance summaries here.
