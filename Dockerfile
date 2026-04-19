FROM tomcat:9.0-jdk17-openjdk-slim

# Borramos lo que viene por defecto y copiamos tu webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY webapp/ /usr/local/tomcat/webapps/ROOT/

# Comando maestro: cambia el puerto 8080 por el que Railway nos asigne en ese momento
CMD ["/bin/sh", "-c", "sed -i 's/8080/'$PORT'/g' /usr/local/tomcat/conf/server.xml && catalina.sh run"]