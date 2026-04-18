#!/bin/bash
# Iniciar Tomcat en background
/usr/local/tomcat/bin/catalina.sh start

# Iniciar Node en primer plano
cd /app/backend
node server.js
