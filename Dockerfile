FROM node:22-slim AS backend-build
WORKDIR /app/backend
COPY backend/package.json .
RUN npm install
COPY backend/ .

FROM tomcat:10.1-jdk17

# Instalar Node.js en el contenedor de Tomcat
RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/*

# Limpiar apps de ejemplo
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar backend
COPY --from=backend-build /app/backend /app/backend

# Copiar frontend estático (Unidad 2 y 4) al backend para que Express los sirva
COPY frontend/unidad2/ /app/frontend/unidad2/
COPY frontend/unidad4/ /app/frontend/unidad4/

# Copiar JSP (Unidad 3) a Tomcat
COPY frontend/unidad3/ /usr/local/tomcat/webapps/Unidad3/

# Script de inicio que levanta Node y Tomcat juntos
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3000
CMD ["/start.sh"]
