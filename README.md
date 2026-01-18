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
