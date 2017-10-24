package model.bd;

import java.sql.Timestamp;

public class Ficha {
    
    private int id;
    private Timestamp fecha;
    private int paciente;
    private int usuario;
    private int hta;
    private int dm;
    private int tipoDiabetes;
    private int aniosEvolucion;
    private boolean mixto;
    private boolean control;
    private String farmacoterapia;
    private String otros;
    private String alteracion;
    private String habitos;
    private float talla;
    private float imc;
    private boolean amputacion;
    private String ubiAmputacion;
    private int nCalzado;
    private boolean varices;
    private boolean heridas;
    private String ubiHeridas;
    private String tipoHerida;
    private boolean tratamiento;
    private boolean nevos;
    private String ubiNevos;
    private boolean maculas;
    private String tipoMaculas;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    public int getPaciente() {
        return paciente;
    }

    public void setPaciente(int paciente) {
        this.paciente = paciente;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public int getHta() {
        return hta;
    }

    public void setHta(int hta) {
        this.hta = hta;
    }

    public int getDm() {
        return dm;
    }

    public void setDm(int dm) {
        this.dm = dm;
    }

    public int getTipoDiabetes() {
        return tipoDiabetes;
    }

    public void setTipoDiabetes(int tipoDiabetes) {
        this.tipoDiabetes = tipoDiabetes;
    }

    public int getAniosEvolucion() {
        return aniosEvolucion;
    }

    public void setAniosEvolucion(int aniosEvolucion) {
        this.aniosEvolucion = aniosEvolucion;
    }

    public boolean isMixto() {
        return mixto;
    }

    public void setMixto(boolean mixto) {
        this.mixto = mixto;
    }

    public boolean isControl() {
        return control;
    }

    public void setControl(boolean control) {
        this.control = control;
    }

    public String getFarmacoterapia() {
        return farmacoterapia;
    }

    public void setFarmacoterapia(String farmacoterapia) {
        this.farmacoterapia = farmacoterapia;
    }

    public String getOtros() {
        return otros;
    }

    public void setOtros(String otros) {
        this.otros = otros;
    }

    public String getAlteracion() {
        return alteracion;
    }

    public void setAlteracion(String alteracion) {
        this.alteracion = alteracion;
    }

    public String getHabitos() {
        return habitos;
    }

    public void setHabitos(String habitos) {
        this.habitos = habitos;
    }

    public float getTalla() {
        return talla;
    }

    public void setTalla(float talla) {
        this.talla = talla;
    }

    public float getImc() {
        return imc;
    }

    public void setImc(float imc) {
        this.imc = imc;
    }

    public boolean isAmputacion() {
        return amputacion;
    }

    public void setAmputacion(boolean amputacion) {
        this.amputacion = amputacion;
    }

    public String getUbiAmputacion() {
        return ubiAmputacion;
    }

    public void setUbiAmputacion(String ubiAmputacion) {
        this.ubiAmputacion = ubiAmputacion;
    }

    public int getnCalzado() {
        return nCalzado;
    }

    public void setnCalzado(int nCalzado) {
        this.nCalzado = nCalzado;
    }

    public boolean isVarices() {
        return varices;
    }

    public void setVarices(boolean varices) {
        this.varices = varices;
    }

    public boolean isHeridas() {
        return heridas;
    }

    public void setHeridas(boolean heridas) {
        this.heridas = heridas;
    }

    public String getUbiHeridas() {
        return ubiHeridas;
    }

    public void setUbiHeridas(String ubiHeridas) {
        this.ubiHeridas = ubiHeridas;
    }

    public String getTipoHerida() {
        return tipoHerida;
    }

    public void setTipoHerida(String tipoHerida) {
        this.tipoHerida = tipoHerida;
    }

    public boolean isTratamiento() {
        return tratamiento;
    }

    public void setTratamiento(boolean tratamiento) {
        this.tratamiento = tratamiento;
    }

    public boolean isNevos() {
        return nevos;
    }

    public void setNevos(boolean nevos) {
        this.nevos = nevos;
    }

    public String getUbiNevos() {
        return ubiNevos;
    }

    public void setUbiNevos(String ubiNevos) {
        this.ubiNevos = ubiNevos;
    }

    public boolean isMaculas() {
        return maculas;
    }

    public void setMaculas(boolean maculas) {
        this.maculas = maculas;
    }

    public String getTipoMaculas() {
        return tipoMaculas;
    }

    public void setTipoMaculas(String tipoMaculas) {
        this.tipoMaculas = tipoMaculas;
    }
    
    
}
