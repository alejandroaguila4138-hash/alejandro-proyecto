<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, java.nio.charset.StandardCharsets" %>
<%
  String apiKey = System.getenv("GEMINI_API_KEY");

    if (apiKey == null || apiKey.isEmpty()) {
        response.setStatus(500);
        out.print("{\"error\": \"Falta configurar la API Key\"}");
        return;
    }

    String pregunta = request.getParameter("pregunta");
    if (pregunta == null || pregunta.isEmpty()) {
        pregunta = "Hola";
    }

    String jsonBody = "{\"contents\": [{\"parts\":[{\"text\": \"" + pregunta.replace("\"", "\\\"") + "\"}]}]}";

    try {
        URL url = new URL("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + apiKey);
        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
        conexion.setRequestMethod("POST");
        conexion.setRequestProperty("Content-Type", "application/json");
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

        out.print(contenidoDeRespuesta.toString());

    } catch (Exception e) {
        response.setStatus(500);
        out.print("{\"error\": \"Error: " + e.getMessage() + "\"}");
    }
%>