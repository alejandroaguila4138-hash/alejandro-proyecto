const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const chatgptRoute = require('./routes/chatgpt');
const geminiRoute  = require('./routes/gemini');

const app = express();

app.use(cors());
app.use(express.json());

// Rutas del backend (API keys seguras aquí)
app.use('/api/chatgpt', chatgptRoute);
app.use('/api/gemini',  geminiRoute);

// Redirigir la raíz a Unidad2
app.get('/', (req, res) => {
    res.redirect('/Unidad2/index.html');
}); 

// Servir archivos estáticos de cada unidad
app.use('/Unidad2', express.static(path.join(__dirname, 'frontend/unidad2')));
app.use('/Unidad4', express.static(path.join(__dirname, 'frontend/unidad4')));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en puerto ${PORT}`);
});
