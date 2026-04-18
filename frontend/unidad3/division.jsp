<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    double a, b, c;
    float m, n, p;
%>
<%
    a = 100.0;
    b = 4.0;
    c = a / b;
    m = 9.9f;
    n = 3.3f;
    p = m / n;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>División</title>
</head>
<body>
    <center>
        <h2 style="color:blue;">División de double y float</h2>
        <h3 style="color:green;">double: <%=a%> / <%=b%> = <%=c%></h3>
        <h3 style="color:green;">float: <%=m%> / <%=n%> = <%=p%></h3>
        <a href="index.jsp">Volver al índice de la unidad 3</a>
    </center>
</body>
</html>
