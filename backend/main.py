from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.routers.auth import router as auth_router
from backend.routers.contacts import router as contacts_router
from backend.routers.scan import router as scan_router
from backend.routers.delivery import router as delivery_router
from backend.routers.dashboard import router as dashboard_router

app = FastAPI(
    title="SnapShare AI",
    description="AI-powered automatic photo sharing app",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth_router)
app.include_router(contacts_router)
app.include_router(scan_router)
app.include_router(delivery_router)
app.include_router(dashboard_router)

@app.get("/")
def home():
    return {
        "message": "SnapShare AI Backend Running Successfully"
    }