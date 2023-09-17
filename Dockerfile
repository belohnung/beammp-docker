FROM ubuntu:22.04

RUN useradd -ms /bin/bash container
ENV USER=container HOME=/home/container
WORKDIR /home/container
RUN apt update -yyq
RUN apt install liblua5.3-0 libcurl4 -yyq
COPY BeamMP-Server /home/container/BeamMP-Server
COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]