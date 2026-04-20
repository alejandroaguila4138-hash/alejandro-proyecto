<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pedir Edad</title>
</head>
<body>
<center>
    <h4>Uso del método GET()</h4>
    <form action="index.jsp" method="get">
    <table>
        <tr>
            <td>Ingrese su edad:</td>
            <td><input type="number" name="edad" required min="1" max="120"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Enviar"></td>
        </tr>
    </table>
    </form>
   <a href="index.jsp">Regresar</a>
</center>
</body>
</html>
