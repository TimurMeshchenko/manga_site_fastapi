FROM python:3.9

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /remanga_fastapi

COPY remanga_fastapi .
COPY requirements.txt .
COPY docker .

RUN apt-get update && apt-get install -y netcat-openbsd
RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x /remanga_fastapi/entrypoint.sh

ENTRYPOINT "/remanga_fastapi/entrypoint.sh"
