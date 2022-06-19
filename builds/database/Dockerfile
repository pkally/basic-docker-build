# Dockerfile for rockylinux running postgres.
ARG OS_VERSION="latest"
ARG SCRIPT_LINK="https://www.postgresql.org/download/linux/redhat/"
FROM rockylinux:${OS_VERSION}
LABEL description="Preconfigured server with database for website."
EXPOSE 5432/tcp
# We will need curl for this next step.
COPY /install-postgres.sh /tmp/
RUN ["/bin/bash", "/tmp/install-postgres.sh"]
RUN rm /tmp/install-postgres.sh
RUN dnf update -y
