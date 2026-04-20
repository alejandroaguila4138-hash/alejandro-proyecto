<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uso de String</title>
</head>
<body>
    <%
        String dia = "viernes 13";
        String semana = "trece";
        String siglo = "XXI";
        String mes = "marzo";
        String anio = "2026";
    %>
    <center>
        <h2 style="color: blue;">Hoy es <%= dia %> de <%= mes %> del <%= anio %> siglo <%= siglo %></h2>
        <p><%= semana %></p>
        <p><%= siglo %></p>
        <p><%= mes %></p>
        <p><%= anio %></p>
        <a href="index.jsp">Regresae</a>
    </center>
</body>
</html>
