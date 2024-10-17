#!/bin/bash
log_file="oceanlog.log"  # Замените на путь к лог файлу
while true; do
    cd ocean || exit 1
    docker-compose down >> "$log_file" 2>&1
    docker-compose up -d >> "$log_file" 2>&1
    docker-compose ps >> "$log_file" 2>&1
    docker-compose logs >> "$log_file" 2>&1
    sleep 21600  # Ждать 300 секунд (5 минут)
done
