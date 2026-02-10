import numpy as np
import pandas as pd

# --------------------------------------------------
# 1. Load Dataset
# --------------------------------------------------
data = pd.read_csv("patient_risk_multiclass_dataset.csv")

X = data[["Age", "SystolicBP", "Cholesterol", "BMI"]].values
Y = data[["LowRisk", "MediumRisk", "HighRisk"]].values

 # N samples, d=4 features, K classes

# --------------------------------------------------
# Normalize Input Features 
# --------------------------------------------------
X = (X - X.mean(axis=0)) / X.std(axis=0)

# --------------------------------------------------
# Initialize Parameters
# --------------------------------------------------
np.random.seed(0)
W= np.random.randn(4, 3)

learning_rate = 0.01
epochs = 1000

def sigmoid(z):
    return 1/(1+np.exp(-z))

# --------------------------------------------------
#Training Loop (Gradient Descent)
# --------------------------------------------------
N = X.shape[0]
for epoch in range(epochs):
    z = np.matmul(X, W)
    Y_pred = sigmoid(z)
    epsilon = 10e-8 
    loss = -np.mean(Y * np.log(Y_pred+epsilon) + (1-Y)*np.log(1-Y_pred+epsilon))
    dw = (1/N) * X.T @ (Y_pred-Y)
    W=W - learning_rate*dw

    # print("iteration: ", epoch, " loss: ", loss)

# --------------------------------------------------

# forward pass with final weights and print predictions for test data (take random 5 samples from training data as test data)

idx = np.random.randint(0, N, size=5)
print("Chosen rows: ", idx)
X_test = X[idx]
Y_test = Y[idx]
Y_preds = sigmoid(X_test@W)
print("Predicted:", np.argmax(Y_preds, axis=1))
print("Actual:", np.argmax(Y_test, axis=1))