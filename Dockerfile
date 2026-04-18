FROM node:22-slim
WORKDIR /app
COPY package.json .
RUN npm install
COPY server.js .
COPY routes/ ./routes/
COPY frontend/ ./frontend/
EXPOSE 3000
CMD ["node", "server.js"]
