from fastapi.testclient import TestClient

from inference.predictor import YV5Predictor    
from .main import app

client = TestClient(app)


def test_service_check():
    response = client.get("/service/check")
    assert response.status_code == 200
    assert response.json() == {"service": "alive"}


def test_test_predict():
    response = client.get("/test/predict")
    y = YV5Predictor()
    assert response.status_code == 200
    assert isinstance(y.test_predict(), dict)
