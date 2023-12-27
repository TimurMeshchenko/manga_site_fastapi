from aio_pika import connect_robust, exceptions
from redis import Redis, ConnectionError
import os
from dotenv import load_dotenv

load_dotenv()

DB_HOST = os.environ.get("DB_HOST")
DB_PORT = os.environ.get("DB_PORT")
DB_NAME = os.environ.get("DB_NAME")
DB_USER = os.environ.get("DB_USER")
DB_PASS = os.environ.get("DB_PASS")

DB_HOST_TEST = os.environ.get("DB_HOST_TEST")
DB_PORT_TEST = os.environ.get("DB_PORT_TEST")
DB_NAME_TEST = os.environ.get("DB_NAME_TEST")
DB_USER_TEST = os.environ.get("DB_USER_TEST")
DB_PASS_TEST = os.environ.get("DB_PASS_TEST")

REDIS_HOST = os.environ.get("REDIS_HOST")
REDIS_PORT = os.environ.get("REDIS_PORT")

RABBITMQ_HOST = os.environ.get("RABBITMQ_HOST")

SMTP_USER = os.environ.get("SMTP_USER")
SMTP_PASSWORD = os.environ.get("SMTP_PASSWORD")

class Config:
    use_rabbitmq = use_redis = False
    channel = queue = None
    redis = Redis(host=REDIS_HOST, port=REDIS_PORT)

    async def connect_rabbitmq(self) -> None:
        try:
            connection = await connect_robust(host=RABBITMQ_HOST)
            Config.channel = await connection.channel()
            Config.queue = await Config.channel.declare_queue('email_queue')

            Config.use_rabbitmq = True
        except exceptions.AMQPConnectionError:
            return
        
    def check_redis_connection(self) -> bool:
        try:
            Config.redis.ping()
            Config.use_redis = True
        except ConnectionError:
            return