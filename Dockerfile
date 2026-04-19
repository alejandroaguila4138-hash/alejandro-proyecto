FROM tomcat:9.0-jdk11-openjdk-slim
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY webapp/ /usr/local/tomcat/webapps/ROOT/
CMD sed -i -e "s/port=\"8080\"/port=\"$PORT\"/g" /usr/local/tomcat/conf/server.xml && catalina.sh run