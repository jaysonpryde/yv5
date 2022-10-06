from fastapi import FastAPI

app = FastAPI()

@app.get("/service/check")
async def service_check():
    return {"service": "alive"}
