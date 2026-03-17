# app_fastapi.py
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class StatusResponse(BaseModel):
    status: str
    message: str

@app.get("/status", response_model=StatusResponse)
async def get_status():
    return {"status": "ok", "message": "FastAPI app is running!"}

# Run with: uvicorn app_fastapi:app --reload
