FROM ubuntu:22.04

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY BeamMP-Server /BeamMP-Server
COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash" "/entrypoint.sh"]