<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultado de Validación</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f7f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .result-card { background: white; padding: 2rem; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); text-align: center; max-width: 400px; }
        .success { color: #27ae60; }
        .error { color: #e74c3c; }
        .btn-back { display: inline-block; margin-top: 20px; text-decoration: none; color: #3498db; font-weight: bold; }
    </style>
</head>
<body>

<div class="result-card">
    <%
        String edadStr = request.getParameter("edad");
        String mensaje;
        String claseCss;
        boolean esApto = false;

        try {
            int edad = Integer.parseInt(edadStr);

            if (edad >= 17 && edad <= 25) {
                mensaje = "¡Felicidades! Eres apto.";
                claseCss = "success";
                esApto = true;
            } else if (edad < 17 && edad > 0) {
                mensaje = "Lo sentimos, aún no cumples con la edad mínima de (17 años).";
                claseCss = "error";
            } else if (edad > 25) {
                mensaje = "Lo sentimos, superas la edad máxima (25 años).";
                claseCss = "error";
            } else {
                mensaje = "La edad ingresada no es válida.";
                claseCss = "error";
            }
        } catch (NumberFormatException e) {
            mensaje = "Error: El dato ingresado no es un número válido.";
            claseCss = "error";
        }
    %>

    <h2 class="<%= claseCss %>">
        <%= esApto ? "Registro Permitido" : "Registro Denegado" %>
    </h2>
    <p><%= mensaje %></p>

    <%-- CORREGIDO: era .html, debe ser .jsp --%>
    <a href="registro-universidad.jsp" class="btn-back">Volver a intentar</a>
</div>
                      
     <center> <a href="index.jsp">Regresar</a> </center> 
</body>
</html>
