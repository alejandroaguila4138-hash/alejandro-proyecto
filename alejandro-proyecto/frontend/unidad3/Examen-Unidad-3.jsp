<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Examen Unidad 3</title>
</head>
<body>

    <h2>Examen Unidad 3</h2>

    <form method="post">
        <p>
            Nombre: <br>
            <input type="text" name="nombre"
                   pattern="[A-Za-zÁéíóúÁÉÍÓÚñÑ ]+"
                   title="Solo escribe letras" required>
        </p>
        <p>
            Apellido 1: <br>
            <input type="text" name="apellido1"
                   pattern="[A-Za-zÁéíóúÁÉÍÓÚñÑ ]+"
                   title="Solo escribe letras" required>
        </p>
        <p>
            Apellido 2: <br>
            <input type="text" name="apellido2"
                   pattern="[A-Za-zÁéíóúÁÉÍÓÚñÑ ]+"
                   title="Solo escribe letras" required>
        </p>

        <hr>
        <p>Ingresa 10 números (1-100):</p>
        <% for(int i=1; i<=10; i++) { %>
            <input type="number" name="num" min="1" max="100" required>
        <% } %>

        <br><br>
        <input type="submit" value="Procesar Datos">
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String nombre = request.getParameter("nombre").replaceAll("[^a-zA-ZáéíóúÁÉÍÓÚñÑ ]", "");
            String ap1 = request.getParameter("apellido1").replaceAll("[^a-zA-ZáéíóúÁÉÍÓÚñÑ ]", "");
            String ap2 = request.getParameter("apellido2").replaceAll("[^a-zA-ZáéíóúÁÉÍÓÚñÑ ]", "");
            String[] numsStr = request.getParameterValues("num");

            String msgApellidos = ap1.equalsIgnoreCase(ap2) ? "Apellidos iguales." : "Apellidos diferentes.";

            int mayor = -1, menor = 101;
            boolean repetidos = false;
            int[] nums = new int[10];

            for (int i = 0; i < 10; i++) {
                nums[i] = Integer.parseInt(numsStr[i]);
                if (nums[i] > mayor) mayor = nums[i];
                if (nums[i] < menor) menor = nums[i];
            }

            for (int i = 0; i < nums.length; i++) {
                for (int j = i + 1; j < nums.length; j++) {
                    if (nums[i] == nums[j]) {
                        repetidos = true;
                        break;
                    }
                }
            }
    %>
        <hr>
        <h3>Resultados para: <%= nombre %></h3>
        <p><strong>Los apellidos:</strong> <%= msgApellidos %></p>
        <p><strong>Número Mayor:</strong> <%= mayor %></p>
        <p><strong>Número Menor:</strong> <%= menor %></p>
        <p><strong>Números iguales:</strong> <%= repetidos ? "Sí, hay números iguales." : "No hay repetidos." %></p>
    <% } %>

    <br>
    <button onclick="location.href='index.jsp'">Regresar</button>

</body>
</html>
