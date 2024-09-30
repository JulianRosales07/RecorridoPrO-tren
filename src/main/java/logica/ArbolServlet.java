/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package logica;

import clases.Nodo;
import clases.ArbolNAry;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;


/**
 *
 * @author julia
 */
@WebServlet("/TrenServlet")
public class ArbolServlet extends HttpServlet {
    private ArbolNAry<Integer> arbol = new ArbolNAry<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los números ingresados y dividirlos en una lista
        String numerosInput = request.getParameter("numeros");
        List<String> numerosString = Arrays.asList(numerosInput.split(","));

        // Si la lista de números está vacía, evitar continuar
        if (numerosString.isEmpty() || numerosString.get(0).trim().isEmpty()) {
            request.setAttribute("error", "Por favor, ingrese al menos un número.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        // Asignar la raíz si no existe
        if (arbol.raiz == null) {
            try {
                int valorRaiz = Integer.parseInt(numerosString.get(0).trim());
                arbol.asignarRaiz(valorRaiz);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "El valor de la raíz no es un número válido.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
        }

        // Añadir los números restantes como hijos de la raíz
        for (int i = 1; i < numerosString.size(); i++) {
            String numero = numerosString.get(i).trim();
            if (!numero.isEmpty()) {
                try {
                    int valorHijo = Integer.parseInt(numero);
                    if (arbol.raiz != null) {
                        arbol.raiz.agregarHijo(new Nodo<>(valorHijo));
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Por favor, ingrese solo números separados por comas.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }
            }
        }

        // Enviar el árbol al JSP para mostrar el tren
        request.setAttribute("arbol", arbol);
        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Restablecer el árbol
        arbol = new ArbolNAry<>();
        // Redirigir a la página principal
        response.sendRedirect("index.jsp");
    }
}
