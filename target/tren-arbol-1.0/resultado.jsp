<%-- 
    Document   : resultado
    Created on : 26/09/2024, 6:14:27 p.m.
    Author     : julia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="clases.ArbolNAry" %>
<%@ page import="clases.Nodo" %>
<html>
<head>
    <title>Resultado del Árbol N-ario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0e0e0;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .tren-container {
            display: flex;
            justify-content: center;
            align-items: flex-end;
            position: relative;
            margin-top: 50px;
        }

        .tren {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            position: relative;
        }

        .locomotora {
  width: 120px;
  height: 60px;
  background-color: #333;
  border: 3px solid #666;
  border-radius: 20px 0 0 20px; /* Rounded corners for a sleeker look */
  color: white;
  position: relative;
  margin: 0 5px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-weight: bold;
  text-transform: uppercase;
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3); /* Increased shadow for depth */
  
  /* New styles for the redesigned locomotora */
  overflow: hidden; /* Prevent child elements from overflowing */
  
  /* Front chimney */
  &::before {
    content: '';
    width: 30px;
    height: 40px;
    background-color: #007bff;
    position: absolute;
    top: -25px;
    left: calc(50% - 15px);
    transform: skewX(-45deg); /* Tilted chimney */
    border-radius: 10px 10px 0 0;
  }
  
  /* Smoke coming out of the chimney */
  &::after {
    content: '';
    width: 0;
    height: 0;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 20px solid   
 #ddd;
    position: absolute;
    top: -15px;
    left: calc(50% - 5px);
    animation: smoke 2s ease-in-out infinite; /* Animate smoke puff */
  }
}

@keyframes smoke {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

        .vagon {
            width: 80px;
            height: 50px;
            background-color: #007bff;
            border: 3px solid #666;
            border-radius: 10px;
            margin: 0 5px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            text-transform: uppercase;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }

        .conector {
            width: 15px;
            height: 2px;
            background-color: #333;
            position: relative;
            margin: 0 -5px;
        }

        .rueda {
            width: 15px;
            height: 15px;
            background-color: #333;
            border-radius: 50%;
            position: absolute;
            bottom: -10px;
            left: 20px;
            animation: girarRuedas 2s linear infinite;
        }

        .rueda-doble {
            left: 10px;
        }

        .vagon .rueda:nth-child(2) {
            right: 20px;
            left: auto;
        }

        /* Definir rieles debajo del tren */
        .rieles {
            position: absolute;
            bottom: 0;
            height: 4px;
            width: 100%;
            background: repeating-linear-gradient(90deg, #666, #666 20px, #e0e0e0 20px, #e0e0e0 40px);
            margin-top: 20px;
        }

        /* Efecto de movimiento */
        @keyframes moverTren {
            0% {
                transform: translateX(0);
            }
            50% {
                transform: translateX(10px);
            }
            100% {
                transform: translateX(0);
            }
        }

        @keyframes girarRuedas {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        .tren {
            animation: moverTren 3s ease-in-out infinite;
        }
        .rieles {
  position: absolute;
  bottom: 0;
  height: 10px;
  width: 100%;
  background: repeating-linear-gradient(90deg, #666, #666 20px, #e0e0e0 20px, #e0e0e0 40px);
  margin-top: 20px;
}

/* Nuevos estilos para mejorar la apariencia */
.train-container {
  perspective: 1000px; /* Agrega perspectiva 3D */
}

.train {
  transform-style: preserve-3d; /* Permite transformaciones 3D */
}

.vagon {
  transform: rotateY(5deg); /* Rotación ligera para un efecto 3D */
}

.locomotora {
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3); /* Sombra más pronunciada */
}

/* Animación de balanceo */
@keyframes balancear {
  0% { transform: rotate(0deg); }
  50% { transform: rotate(3deg); }
  100% { transform: rotate(0deg); }
}

.train {
  animation: balancear 2s infinite alternate;
}
    </style>
</head>
<body>
    <h1>Resultado del Árbol N-ario</h1>
    <div class="tren-container">
<%
    ArbolNAry<Integer> arbol = (ArbolNAry<Integer>) request.getAttribute("arbol");
    if (arbol != null && arbol.getRaiz() != null) {
        // Mostrar la raíz como locomotora
        out.println("<div class='tren'><div class='locomotora'>Loc " + arbol.getRaiz().getValor() + "</div>");
        
        // Mostrar los hijos como vagones
        if (!arbol.getRaiz().getHijos().isEmpty()) {
            for (Nodo<Integer> hijo : arbol.getRaiz().getHijos()) {
                out.println("<div class='conector'></div>");
                out.println("<div class='vagon'>" + hijo.getValor() + "<div class='rueda'></div><div class='rueda rueda-doble'></div></div>");
            }
        }
        out.println("</div>"); // Cierra la clase 'tren'
    } else {
        out.println("<h2>No se pudo construir el árbol.</h2>");
    }
%>
        <div class="rieles"></div>
    </div>

    <a href="TrenServlet">Volver</a>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
  const train = document.querySelector('.train');

  // Función para generar vagones dinámicamente
  function generarVagones(hijos) {
    hijos.forEach(hijo => {
      const vagon = document.createElement('div');
      vagon.classList.add('vagon');
      vagon.textContent = hijo.getValor();
      // Agregar ruedas y conectores aquí
      train.appendChild(vagon);
    });
  }

  // Obtener el árbol desde el servidor (ejemplo)
  fetch('obtenerArbol.jsp')
    .then(response => response.json())
    .then(arbol => {
      const raiz = arbol.raiz;
      const locomotora = document.createElement('div');
      locomotora.classList.add('locomotora');
      locomotora.textContent = raiz.valor;
      train.appendChild(locomotora);

      generarVagones(raiz.hijos);
    });
        document.addEventListener("DOMContentLoaded", function () {
            const tren = document.querySelector('.tren');

            // Aplicar la animación de movimiento solo al hacer clic
            tren.addEventListener('click', () => {
                if (tren.style.animationPlayState === 'paused' || !tren.style.animationPlayState) {
                    tren.style.animationPlayState = 'running';
                } else {
                    tren.style.animationPlayState = 'paused';
                }
            });

            // Pausar animación al cargar la página para iniciar solo con clic
            tren.style.animationPlayState = 'paused';
        });
    </script>
</body>
</html>
