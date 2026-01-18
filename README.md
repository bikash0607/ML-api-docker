# ML Model Deployment with FastAPI & Docker

This repository contains a simple machine learning API service. It wraps a Scikit-Learn Random Forest Classifier trained on the Iris dataset within a FastAPI interface and is containerized using Docker.

## Project Structure

- `main.py`: The FastAPI application handling inference requests.
- `train_model.py`: Script to train and save the model locally.
- `Dockerfile`: Instructions to build the container image.
- `requirements.txt`: Python dependencies.

## Prerequisites

- Docker installed
- Python 3.9+ (if running locally without Docker)

## 1. Setup & Training

Before running the API (either locally or in Docker), ensure the model file exists. If `model.pkl` is not present, generate it:

```bash
# Install dependencies
pip install -r requirements.txt

# Train the model
python train_model.py
```
## 2. Running Locally (No Docker)

You can run the API directly using Uvicorn:

```Bash

uvicorn main:app --reload

The API will be available at:

    http://localhost:8000
    Swagger UI: http://localhost:8000/docs
```


### 3. Running with Docker
Build the Image

Bash

docker build -t iris-api .

Run the Container

```Bash

docker run -p 8000:8000 iris-api

The API is now running inside the container and accessible at:

    http://localhost:8000
    Swagger UI: http://localhost:8000/docs
```
## 4. API Usage & Demo
Automatic Documentation

FastAPI provides an interactive Swagger UI. Open your browser to:
http://localhost:8000/docs
Sample Request (cURL)

You can test the endpoint using curl in your terminal:

```Bash

curl -X 'POST' \
  'http://localhost:8000/predict' \
  -H 'Content-Type: application/json' \
  -d '{
  "sepal_length": 5.1,
  "sepal_width": 3.5,
  "petal_length": 1.4,
  "petal_width": 0.2
}'
```
Expected Response

The API returns the predicted class index and the class name (Setosa, Versicolor, or Virginica):

JSON

{
  "prediction_class": 0,
  "class_name": "setosa"
}
