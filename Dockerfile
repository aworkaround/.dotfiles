FROM ubuntu:24.10

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ansible git sudo

RUN usermod -aG sudo ubuntu
USER ubuntu
WORKDIR /home/ubuntu/

ENTRYPOINT ["tail", "-f", "/dev/null"]
