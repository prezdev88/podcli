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
public class DetalleAtencion {
    private int idFicha;
    private int idAtencion;
    private String rutPaciente;
    private String nombrePaciente;
    private String nombreAlumno;
    private String fechaAtencion;
    private int idPaciente;

    public DetalleAtencion(int idFicha, int idAtencion, String rutPaciente, String nombrePaciente, String nombreAlumno, String fechaAtencion, int idPaciente) {
        this.idFicha = idFicha;
        this.idAtencion = idAtencion;
        this.rutPaciente = rutPaciente;
        this.nombrePaciente = nombrePaciente;
        this.nombreAlumno = nombreAlumno;
        this.fechaAtencion = fechaAtencion;
        this.idPaciente = idPaciente;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }
    
    public int getIdFicha() {
        return idFicha;
    }

    public void setIdFicha(int idFicha) {
        this.idFicha = idFicha;
    }

    public int getIdAtencion() {
        return idAtencion;
    }

    public void setIdAtencion(int idAtencion) {
        this.idAtencion = idAtencion;
    }

    public String getRutPaciente() {
        return rutPaciente;
    }

    public void setRutPaciente(String rutPaciente) {
        this.rutPaciente = rutPaciente;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public String getNombreAlumno() {
        return nombreAlumno;
    }

    public void setNombreAlumno(String nombreAlumno) {
        this.nombreAlumno = nombreAlumno;
    }

    public String getFechaAtencion() {
        return fechaAtencion;
    }

    public void setFechaAtencion(String fechaAtencion) {
        this.fechaAtencion = fechaAtencion;
    }
    
    
}
