from celery import Celery
from app.core.config import settings

celery_app = Celery("worker", broker=settings.CELERY_BROKER_URL, backend=settings.CELERY_RESULT_BACKEND)

celery_app.conf.task_routes = {
    "app.worker.tasks.generate_image": "queue_high",
    "app.worker.tasks.chat_response": "queue_default",
    "app.worker.tasks.cleanup": "queue_low",
}
