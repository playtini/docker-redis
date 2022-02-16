ARG IMAGE=bitnami/redis:latest

FROM $IMAGE

USER root

RUN apt update \
    && apt install -y redis-redisearch

RUN chown -R redis:redis /usr/lib/redis/modules/redisearch.so \
    && chmod -R 755 /usr/lib/redis/modules/redisearch.so \
    && echo 'loadmodule /usr/lib/redis/modules/redisearch.so' >> /etc/redis/redis.conf

USER 1001