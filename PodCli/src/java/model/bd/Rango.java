/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bd;

/**
 *
 * @author prez
 */
public class Rango {
    private String rango;
    private int cantidad;

    public Rango(String rango, int cantidad) {
        this.rango = rango;
        this.cantidad = cantidad;
    }

    public String getRango() {
        return rango;
    }

    public void setRango(String rango) {
        this.rango = rango;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
}
