import os
import sys

# add the project path for proper resolution of modules
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import shutil
import tempfile
import torch

from fastapi import FastAPI, File, UploadFile
from pathlib import Path


class YV5Predictor:
    _model = None
    _img_dir = "/usr/src/yv5"
    _test_image = "/usr/src/app/data/images/bus.jpg"

    def __init__(self):
        torch.hub.set_dir(self._img_dir)
        self._model = torch.hub.load('ultralytics/yolov5', 'yolov5s')

    def test_predict(self):
        predictions = {"predictions": []}

        try:
            results = self._model(self._test_image)
            p_res = results.pandas().xyxy[0]
            for c, n in zip(p_res["class"], p_res["name"]):
                predictions["predictions"].append((c, n))
            predictions.update({"status": "success"})
        except Exception as ex:
            predictions.update({"status": f"error: {ex}"})
            
        return predictions

    def predict(self, img_file: UploadFile = File(...)):
        predictions = {"predictions": []}

        try:
            img_path = f"{self._img_dir}/{img_file.filename}"
            with open(img_path, "wb") as buffer:
                shutil.copyfileobj(img_file.file, buffer)
            results = self._model(img_path)
            p_res = results.pandas().xyxy[0]
            for c, n in zip(p_res["class"], p_res["name"]):
                predictions["predictions"].append((c, n))
            predictions.update({"status": "success"})
        except Exception as ex:
            predictions.update({"status": f"error: {ex}"})
        finally:
            os.unlink(img_path)
            
        return predictions

