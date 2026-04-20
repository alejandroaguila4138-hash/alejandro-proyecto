<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro Universitario</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: white; padding: 2rem; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 300px; text-align: center; }
        h2 { color: #2c3e50; }
        input[type="number"] { width: 100%; padding: 10px; margin: 15px 0; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        button { background-color: #3498db; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; transition: background 0.3s; }
        button:hover { background-color: #2980b9; }
    </style>
</head>
<body>
<div class="card">
    <h2>Admision Universidad</h2>
    <p>Ingresa tu edad:</p>
    <form action="registro-validacion.jsp" method="POST">
        <input type="number" name="edad" placeholder="" required min="1" max="120">
        <button type="submit">Validar Registro</button>

        <a href="index.jsp">Regresar</a>
    </form>
</div>
</body>
</html>
