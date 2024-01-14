#!/bin/bash

# Задаем переменные
REPO_URL="https://github.com/SanchezGogol/shvirtd-example-python"
REPO_NAME="shvirtd-example-python"
DOCKER_COMPOSE_FILE="proxy.yaml"

# Скачиваем репозиторий
sudo mkdir /opt/$REPO_NAME
sudo git clone $REPO_URL /opt/$REPO_NAME

# Переходим в каталог репозитория
cd /opt/$REPO_NAME

# Запускаем docker build, затем compose
sudo docker build -t hw5 . -f Dockerfile.python
sudo docker compose -f $DOCKER_COMPOSE_FILE up -d

echo "START OK"