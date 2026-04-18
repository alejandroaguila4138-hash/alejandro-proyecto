FROM node:22-slim AS backend-build
WORKDIR /app
COPY package.json .
RUN npm install
COPY server.js .
COPY routes/ ./routes/

FROM tomcat:10.1-jdk17

RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/*

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=backend-build /app /app

COPY frontend/unidad2/ /app/frontend/unidad2/
COPY frontend/unidad4/ /app/frontend/unidad4/

COPY frontend/unidad3/ /usr/local/tomcat/webapps/Unidad3/

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3000
CMD ["/start.sh"]