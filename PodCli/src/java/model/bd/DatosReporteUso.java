package model.bd;

public class DatosReporteUso {
    private String rut;
    private String nombre;
    private int cantidadFichas;
    private int cantidadAtencionesPodologicas;

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidadFichas() {
        return cantidadFichas;
    }

    public void setCantidadFichas(int cantidadFichas) {
        this.cantidadFichas = cantidadFichas;
    }

    public int getCantidadAtencionesPodologicas() {
        return cantidadAtencionesPodologicas;
    }

    public void setCantidadAtencionesPodologicas(int cantidadAtencionesPodologicas) {
        this.cantidadAtencionesPodologicas = cantidadAtencionesPodologicas;
    }
    
    
}
