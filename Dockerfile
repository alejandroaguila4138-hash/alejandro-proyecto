FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY webapp/ /usr/local/tomcat/webapps/ROOT/

CMD ["/bin/sh", "-c", "export CATALINA_OPTS=\"-DCHATGPT_API_KEY=$CHATGPT_API_KEY -DGEMINI_API_KEY=$GEMINI_API_KEY\" && sed -i 's/port=\"8080\"/port=\"'$PORT'\"/' /usr/local/tomcat/conf/server.xml && catalina.sh run"]