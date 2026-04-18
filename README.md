# Proyecto Escolar - Aplicaciones Web Orientadas a Servicios
**Alumno:** Ortiz Aguila Octavio Alejandro  
**Grupo:** DSM-51  
**Institución:** Universidad Tecnológica de la Costa

## Estructura
- `frontend/unidad2/` — Archivos HTML (APIs, formularios, etc.)
- `frontend/unidad3/` — Archivos JSP (Java Server Pages)
- `frontend/unidad4/` — Examen Unidad 4
- `backend/` — Servidor Node.js (manejo seguro de API keys)

## Configuración local
1. Entra a la carpeta backend: `cd backend`
2. Instala dependencias: `npm install`
3. Crea el archivo `.env` con tus keys:
```
OPENAI_API_KEY=tu_key_aqui
GEMINI_API_KEY=tu_key_aqui
```
4. Inicia el servidor: `node server.js`

## Despliegue
Desplegado en Railway con Docker.
