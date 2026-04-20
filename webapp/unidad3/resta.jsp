<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    double a, b, c;
    float m, n, p;
%>
<%
    a = 99.999;
    b = 33.333;
    c = a - b;
    m = 5.5f;
    n = 2.2f;
    p = m - n;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resta</title>
</head>
<body>
    <center>
        <h2 style="color:blue;">Resta de double y float</h2>
        <h3 style="color:green;">double: <%=a%> - <%=b%> = <%=c%></h3>
        <h3 style="color:green;">float: <%=m%> - <%=n%> = <%=p%></h3>
        <a href="index.jsp">Regresar</a>
    </center>
</body>
</html>
