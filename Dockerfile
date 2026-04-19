# Usamos Java 17 para evitar el error de CgroupV2 de Java 11
FROM tomcat:9.0-jdk17-openjdk-slim

# Limpiamos y copiamos tu webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY webapp/ /usr/local/tomcat/webapps/ROOT/

# Exponemos el puerto
ENV PORT 8080
EXPOSE $PORT

# Comando para sincronizar el puerto de Railway con Tomcat y arrancar
CMD sed -i "s/port=\"8080\"/port=\"$PORT\"/g" /usr/local/tomcat/conf/server.xml && catalina.sh run