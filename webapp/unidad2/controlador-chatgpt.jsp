<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, java.nio.charset.StandardCharsets" %>
<%
    // 1. Buscamos la variable de entorno específica para ChatGPT
    String apiKey = System.getenv("CHATGPT_API_KEY");

    if (apiKey == null || apiKey.isEmpty()) {
        response.setStatus(500);
        out.print("{\"error\": \"Falta configurar la API Key de ChatGPT en Railway\"}");
        return;
    }

    String pregunta = request.getParameter("pregunta");
    if (pregunta == null || pregunta.isEmpty()) {
        pregunta = "Hola, dime algo corto";
    }

    // 2. Preparamos el JSON como lo pide OpenAI (con el modelo gpt-3.5-turbo o el que uses)
    String jsonBody = "{\"model\": \"gpt-3.5-turbo\", \"messages\": [{\"role\": \"user\", \"content\": \"" + pregunta.replace("\"", "\\\"") + "\"}]}";

    try {
        // 3. Conexión oficial a OpenAI
        URL url = new URL("https://api.openai.com/v1/chat/completions");
        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
        conexion.setRequestMethod("POST");
        conexion.setRequestProperty("Content-Type", "application/json");
        // OpenAI exige que la llave vaya con la palabra "Bearer" enfrente
        conexion.setRequestProperty("Authorization", "Bearer " + apiKey); 
        conexion.setDoOutput(true);

        try(OutputStream os = conexion.getOutputStream()) {
            byte[] input = jsonBody.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        int responseCode = conexion.getResponseCode();
        InputStream is = (responseCode >= 200 && responseCode < 300) ? conexion.getInputStream() : conexion.getErrorStream();

        BufferedReader in = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
        String inputLine;
        StringBuilder contenidoDeRespuesta = new StringBuilder();
        
        while ((inputLine = in.readLine()) != null) {
            contenidoDeRespuesta.append(inputLine);
        }
        
        in.close();
        conexion.disconnect();

        // Devolvemos el JSON de OpenAI al frontend
        out.print(contenidoDeRespuesta.toString());

    } catch (Exception e) {
        response.setStatus(500);
        out.print("{\"error\": \"Error con OpenAI: " + e.getMessage() + "\"}");
    }
%>