import os
import shutil
import tempfile

from fastapi import FastAPI, File, UploadFile
from inference.predictor import YV5Predictor


y = YV5Predictor()

app = FastAPI()


@app.get("/service/check")
async def service_check():
    return {"service": "alive"}


@app.get("/test/predict")
async def test_predict():
    return y.test_predict()


@app.post("/predict")
async def predict(img_file: UploadFile = File(...)):
    return y.predict(img_file)
