FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY webapp/ /usr/local/tomcat/webapps/ROOT/

CMD ["/bin/sh", "-c", "sed -i 's/port=\"8080\"/port=\"'$PORT'\"/' /usr/local/tomcat/conf/server.xml && catalina.sh run"]