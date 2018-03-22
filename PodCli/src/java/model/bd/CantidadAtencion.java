package model.bd;

/**
 *
 * @author prez
 */
public class CantidadAtencion {
    private int id;
    private String rut;
    private String nombre;
    private int cantidad;

    public CantidadAtencion(int id, String rut, String nombre, int cantidad) {
        this.id = id;
        this.rut = rut;
        this.nombre = nombre;
        this.cantidad = cantidad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    

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

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
}
