import pytest
from src.app import app   # works now because src is a package

@pytest.fixture
def client():
    app.testing = True
    with app.test_client() as client:
        yield client

def test_home_page(client):
    response = client.get("/")
    assert response.status_code == 200
    assert b"Flask API - Dark Theme" in response.data

def test_api_hello(client):
    response = client.get("/api/hello")
    assert response.status_code == 200
    json_data = response.get_json()
    assert json_data["message"] == "Hello from your Flask API!"
