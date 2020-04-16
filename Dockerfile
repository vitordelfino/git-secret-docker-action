FROM ubuntu:latest

RUN apt update && \
  apt install -y man make git apt-transport-https && \
  apt install -y ruby ruby-dev ruby-build && \
  apt install -y git-secret && \
  apt autoremove && apt-get autoclean

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]