#!/bin/bash

if [[ $(cat /proc/version) == *"WSL2"* ]]; then
  docker_status=$(sudo service docker status)
  if [[ $docker_status = *"Docker is not running"* ]]; then
    sudo service docker start
  fi
fi

if [ $# -eq 0 ]; then
  docker compose --env-file .env up -d
  docker compose exec jekyll /bin/bash
  docker compose down
else
  docker run --rm -e TZ=Asia/Seoul \
    -v $(pwd):/srv/jekyll \
    -p 4000:4000 -p 35729:35729 \
    -it \
    jekyll/jekyll \
    /bin/bash
fi
