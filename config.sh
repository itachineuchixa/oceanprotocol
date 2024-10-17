#!/bin/bash

# Обновление пакетов
sudo apt update && sudo apt upgrade -y

# Установка curl и docker
sudo apt install curl -y
sudo apt install docker.io -y
sudo apt install docker-compose -y

# Проверка версий
docker --version
docker-compose --version

# Создание директории для ноды
mkdir -p ocean && cd ocean

# Скачивание и запуск скрипта установки ноды
curl -O https://raw.githubusercontent.com/oceanprotocol/ocean-node/main/scripts/ocean-node-quickstart.sh
chmod +x ocean-node-quickstart.sh

# Запуск скрипта установки
./ocean-node-quickstart.sh

# Запрашиваем IP-адрес сервера
read -p "Нажмите enter чтобы продолжить: " skip

# Запуск ноды
docker-compose up -d
docker ps
docker-compose logs -f
