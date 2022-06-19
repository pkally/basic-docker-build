FROM rockylinux:latest
LABEL description="Precongifured test cache for website."
EXPOSE 6379/tcp
RUN dnf install -y redis
RUN dnf update -y
COPY /redis.conf /etc/redis/redis.conf
