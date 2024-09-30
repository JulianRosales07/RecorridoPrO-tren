/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author julia
 */
public class Nodo<T> {
    private T valor;
    public List<Nodo<T>> hijos;

    public Nodo(T valor) {
        this.valor = valor;
        this.hijos = new ArrayList<>();
    }

    public T getValor() {
        return valor;
    }

    public List<Nodo<T>> getHijos() {
        return hijos;
    }

    public void agregarHijo(Nodo<T> hijo) {
        this.hijos.add(hijo);
    }
}