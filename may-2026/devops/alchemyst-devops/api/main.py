from fastapi import FastAPI
import requests

app = FastAPI()

workers = [
    "http://10.0.2.170:9000/process",
    "http://10.0.2.64:9000/process",
    "http://10.0.2.227:9000/process"
]

counter = 0

@app.get("/")
def health():
    return {
        "status": "api running"
    }

@app.post("/infer")
def infer():

    global counter

    worker = workers[counter % len(workers)]

    counter += 1

    response = requests.post(worker)

    return response.json()