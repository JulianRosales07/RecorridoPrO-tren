<%-- 
    Document   : index.jsp
    Created on : 26/09/2024, 4:48:35 p. m.
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Construir Tren N-ario</title>
    <style>
body {
    font-family: 'Roboto', sans-serif;
    background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

h2 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
    font-size: 24px;
}

form {
    background: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
    text-align: center;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 10px;
    color: #555;
}

input[type="text"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

input[type="submit"] {
    background: linear-gradient(135deg, #6b73ff, #000dff);
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s ease;
}

input[type="submit"]:hover {
    background: linear-gradient(135deg, #000dff, #6b73ff);
}

    </style>
</head>
<body>
    <h2>Construir un Tren con Números</h2>
    <form action="TrenServlet" method="post">
        <label for="numeros">Ingresa los números separados por comas:</label><br>
        <input type="text" id="numeros" name="numeros" placeholder="Ej: 1,2,3,4,5"><br><br>
        <input type="submit" value="Crear Tren">
    </form>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("form");
    const input = document.getElementById("numeros");

    form.addEventListener("submit", function(event) {
        const numeros = input.value.split(",");
        if (numeros.some(isNaN)) {
            alert("Por favor, ingresa solo números separados por comas.");
            event.preventDefault();
        }
    });
});

    </script>
</body>
</html>

