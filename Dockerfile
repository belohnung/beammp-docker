FROM ubuntu:22.04

RUN useradd -ms /bin/bash container
ENV USER=container HOME=/home/container
WORKDIR /home/container

RUN apt update -yyq && \
    apt install -yyq liblua5.3-0 libcurl4 curl && \
    rm -rf /var/lib/apt/lists/*

# Download latest BeamMP-Server
RUN REPO_URL="https://github.com/BeamMP/BeamMP-Server" && \
    RELEASE_URL="$REPO_URL/releases/latest" && \
    LATEST_TAG=$(curl -sSLI -o /dev/null -w %{url_effective} "$RELEASE_URL" | awk -F'/' '{print $(NF)}') && \
    DOWNLOAD_URL="$REPO_URL/releases/download/$LATEST_TAG/BeamMP-Server.debian.11.x86_64" && \
    curl -fL "$DOWNLOAD_URL" -o /home/container/BeamMP-Server && \
    chmod +x /home/container/BeamMP-Server

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]