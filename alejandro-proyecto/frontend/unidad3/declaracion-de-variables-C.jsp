<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%!
    String pais;
    int moneda;
    float paridad;
    double total;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Declaracion de Variables C</title>
</head>
<body>
    <%
        pais = "Mexico";
        moneda = 10;
        paridad = 17.8f;
        total = 178.00;
    %>
    <center>
        <h1>Declaración de Variables C)</h1>
        <h2>En el país <%=pais%> el dólar tiene un precio de <%=paridad%> y yo tengo <%=moneda%> dólares.
            Entonces mi total es <%=total%> pesos.</h2>
        <a href="index.jsp">Regresar</a>
    </center>
</body>
</html>
