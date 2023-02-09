from fastapi.testclient import TestClient
from jobs.main import app


client = TestClient(app)


def test_read_main():
    response = client.post('/predict/?description=test')
    assert response.status_code == 200
