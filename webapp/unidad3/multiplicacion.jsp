<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    double a, b, c;
    float m, n, p;
%>
<%
    a = 12.345;
    b = 67.890;
    c = a * b;
    m = 2.7828f;
    n = 3.1416f;
    p = m * n;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Multiplicación</title>
</head>
<body>
    <center>
        <h2 style="color:blue;">Multiplicación de double y float</h2>
        <h3 style="color:green;">double: a = <%=a%> * <%=b%> = <%=c%></h3>
        <h3 style="color:green;">float: m = <%=m%> * <%=n%> = <%=p%></h3>
        <a href="index.jsp">Regresar</a>
    </center>
</body>
</html>
