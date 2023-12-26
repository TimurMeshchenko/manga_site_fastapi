from aio_pika import connect_robust, exceptions
from redis import Redis, ConnectionError

class Config:
    use_rabbitmq = use_redis = False
    channel = queue = None
    redis = Redis(host='localhost', port=6379)

    async def connect_rabbitmq(self) -> None:
        try:
            connection = await connect_robust(host='localhost')
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