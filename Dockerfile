FROM python:3.9

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /remanga_fastapi

COPY remanga_fastapi .
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

WORKDIR src

CMD gunicorn main:app --workers 1 --worker-class uvicorn.workers.UvicornWorker --bind=0.0.0.0:8000
