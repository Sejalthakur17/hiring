from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def health():
    return {
        "status": "worker running"
    }

@app.post("/process")
def process():
    return {
        "result": "processed by worker"
    }