#!/bin/sh

repo_url="https://github.com/BeamMP/BeamMP-Server"
release_url="$repo_url/releases/latest"



latest_tag=$(curl -sSLI -o /dev/null -w %{url_effective} "$release_url" | awk -F'/' '{print $(NF)}')

if [ -z "$latest_tag" ]; then
    echo "Failed to retrieve the latest release tag. Please check the repository or try again later."
    exit 1
fi
echo $latest_tag

download_url="$repo_url/releases/download/$latest_tag/BeamMP-Server-ubuntu-22.04"

curl -L "$download_url" -o "BeamMP-Server"

docker build -t belohnung/beammp:$latest_tag .
