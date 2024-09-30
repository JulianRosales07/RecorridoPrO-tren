/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

/**
 *
 * @author julia
 */
public class ArbolNAry<T> {
    public Nodo<T> raiz;

    public void asignarRaiz(T valor) {
        this.raiz = new Nodo<>(valor);
    }

    public Nodo<T> getRaiz() {
        return raiz; // Agrega este método para poder acceder a la raíz
    }

    public void recorridoPreorden() {
        recorridoPreorden(raiz);
    }

    private void recorridoPreorden(Nodo<T> nodo) {
        if (nodo != null) {
            System.out.print(nodo.getValor() + " ");
            for (Nodo<T> hijo : nodo.getHijos()) {
                recorridoPreorden(hijo);
            }
        }
    }
}