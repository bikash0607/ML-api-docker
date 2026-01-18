from fastapi import FastAPI
from pydantic import BaseModel
import joblib
import numpy as np

# 1. Load the trained model
model = joblib.load("model.pkl")

# 2. Define the app
app = FastAPI(title="Iris Model API", version="1.0")

# 3. Define Input Schema
class IrisRequest(BaseModel):
    sepal_length: float
    sepal_width: float
    petal_length: float
    petal_width: float

# 4. Define Prediction Endpoint
@app.post("/predict")
def predict(data: IrisRequest):
    # Convert input to array
    features = np.array([[
        data.sepal_length, 
        data.sepal_width, 
        data.petal_length, 
        data.petal_width
    ]])
    
    # Make prediction
    prediction = model.predict(features)
    class_name = ["setosa", "versicolor", "virginica"][prediction[0]]
    
    return {
        "prediction_class": int(prediction[0]),
        "class_name": class_name
    }

@app.get("/")
def home():
    return {"message": "ML API is running. Go to /docs for Swagger UI."}