/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import java.util.Scanner;

/**
 *
 * @author julia
 */
public class ArbolNarios {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArbolNAry<Integer> arbol = new ArbolNAry<>();

        // Pedir al usuario que ingrese el valor de la raíz
        System.out.print("Introduce el valor de la raíz: ");
        int valorRaiz = scanner.nextInt();
        arbol.asignarRaiz(valorRaiz);

        // Crear nodos hijos para la raíz
        System.out.print("¿Cuántos hijos tendrá la raíz?: ");
        int numHijosRaiz = scanner.nextInt();

        for (int i = 0; i < numHijosRaiz; i++) {
            System.out.print("Introduce el valor del hijo " + (i + 1) + " de la raíz: ");
            int valorHijo = scanner.nextInt();
            arbol.raiz.agregarHijo(new Nodo<>(valorHijo));
        }

        // Preguntar si se quieren agregar hijos a los nodos de primer nivel
        for (Nodo<Integer> hijo : arbol.raiz.hijos) {
            System.out.print("¿Cuántos hijos tendrá el nodo " + hijo.getValor() + "?: ");
            int numHijos = scanner.nextInt();

            for (int i = 0; i < numHijos; i++) {
                System.out.print("Introduce el valor del hijo " + (i + 1) + " de " + hijo.getValor() + ": ");
                int valorHijo = scanner.nextInt();
                hijo.agregarHijo(new Nodo<>(valorHijo));
            }
        }

        // Mostrar el recorrido en preorden
        System.out.println("Recorrido en preorden del Árbol N-ario:");
        arbol.recorridoPreorden();  // Aquí se llama al método para el recorrido
    }
}
