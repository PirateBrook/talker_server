from app.worker.celery_app import celery_app
import time

@celery_app.task
def generate_image(prompt: str):
    time.sleep(5) # Simulate heavy work
    return f"Image generated for: {prompt}"

@celery_app.task
def chat_response(message: str):
    time.sleep(1)
    return f"Processed chat: {message}"

@celery_app.task
def cleanup():
    return "Cleanup done"
