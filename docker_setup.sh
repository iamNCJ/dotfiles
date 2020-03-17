#!/bin/bash

docker volume create portainer_data

docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

docker container run -d --name minidlna  --restart=always --privileged --network host whatever4711/minidlna

docker run -d -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445 -p 445:445/udp --name=samba  --restart=always --hostname 'filer' \
    -v /mnt/data:/share/folder  elswork/samba -u "your_username:your_password" -s "FileShare:/share/folder:rw:your_username"

docker create \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai\
  -e TRANSMISSION_WEB_HOME=/transmission/ \
  -e USER=user \
  -e PASS=password \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /root/.transmission_config:/config \
  -v /mnt/data/downloads:/downloads \
  -v /mnt/data/watch:/watch \
  --restart unless-stopped \
  linuxserver/transmission

docker run \
  -d \
  --name transmission \
  -p 9091:9091 \
  -p 51413:51413 \
  -v /mnt/data/download:/data \
  -e USERNAME=user \
  -e PASSWORD=passwd \
  gists/transmission

docker run -d \
  --name aria2-pro \
  --restart unless-stopped \
  --log-opt max-size=1m \
  -e PUID=$UID \
  -e PGID=$GID \
  -e RPC_SECRET=<TOKEN> \
  -p 6800:6800 \
  -p 6888:6888 \
  -p 6888:6888/udp \
  -v ~/aria2-config:/config \
  -v ~/downloads:/downloads \
  p3terx/aria2-pro

docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower

docker create \
  --name=librespeed \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -p 81:80 \
  --restart unless-stopped \
  linuxserver/librespeed

docker run -d --name ariang -p 6080:80 leonismoe/ariang:arm64v8-latest
