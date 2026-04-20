<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Suma</title>
</head>
<body>
<%
    int x, y, z, suma;
    x = 30;
    y = 23;
    z = 3;
    suma = x + y + z;
%>
<center>
    <h2>La suma de <%= x %> + <%= y %> + <%= z %> es igual a: <%= suma %></h2>
    <a href="index.jsp">Regresar</a>
</center>
</body>
</html>
