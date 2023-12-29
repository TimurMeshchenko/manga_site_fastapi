# #!/bin/bash

until nc -z $RABBITMQ_HOST 5672; do
  echo "Waiting for RabbitMQ to be available..."
  sleep 2
done

cd src

gunicorn main:app --workers 1 --worker-class uvicorn.workers.UvicornWorker --bind=0.0.0.0:8000

exec "$@"
