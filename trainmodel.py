import joblib
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier

# 1. Load data
iris = load_iris()
X, y = iris.data, iris.target

# 2. Train model
clf = RandomForestClassifier(n_estimators=10)
clf.fit(X, y)

# 3. Save model
joblib.dump(clf, "model.pkl")
print("Model trained and saved to model.pkl")