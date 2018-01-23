# !/bin/bash

clear

mkdir -p /data/dionaea/log
mkdir -p /data/dionaea/binaries
mkdir -p /data/glastopf/db
mkdir -p /data/glastopf/log
mkdir -p /data/cowrie/log
mkdir -p /data/cowrie/log/tty
mkdir -p /data/cowrie/downloads
mkdir -p /data/cowrie/keys

chown -R 3500:3500 /data

addgroup --gid 3500 sensor
adduser --system --shell /bin/bash --uid 3500 --disabled-password --gid 3500 sensor

chown -R 3500:3500 ~/sensor
mv ~/sensor/ /home/sensor/sensor

usermod -aG docker sensor
su - sensor
docker-compose -f /home/sensor/sensor/docker-compose.yml up -d