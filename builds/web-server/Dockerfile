ARG OS_VERSION=latest
FROM rockylinux:${OS_VERSION}
LABEL description="Preconfigured test server for website."
EXPOSE 80/tcp
RUN dnf update -y
RUN dnf install -y nginx
COPY /nginx/nginx.conf /etc/nginx/
