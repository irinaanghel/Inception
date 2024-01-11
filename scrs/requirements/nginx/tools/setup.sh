#!/bin/sh

echo "[Inception-Nginx] Creating the SSL Certificate"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/aanghel.42.fr.key -out /etc/ssl/aanghel.42.fr.crt -subj "/C=IT/L=Rome/O=42Roma/OU=student/CN=aanghel.42.fr"

echo "[Inception-Nginx] Waiting Static Website..."
while ! nc -z static_website 3000; do   
    sleep 0.1
done