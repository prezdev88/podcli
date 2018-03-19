package model.bd;

import java.sql.Timestamp;

public class AtencionPodologicaSelect {
    private int id;
    private int ficha;
    private String usuario;
    private Timestamp fecha;
    private String presion;//Presión Arterial
    private int pulsoRadial;
    private int pulsoPedio_d;//Derecho
    private int pulsoPedio_i;//Izquierdo
    private float peso;
    private boolean sens_d;// Sensibilidad pie derecho
    private boolean sens_i;//Sensibilidad pie izquierdo
    private String tPoda1_d;//TEMPERATURA PODAL derecho
    private String tPoda1_i;//TEMPERATURA PODAL izquierdo
    private boolean curacion;
    private boolean resecado;

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFicha() {
        return ficha;
    }

    public void setFicha(int ficha) {
        this.ficha = ficha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }


    public String getPresion() {
        return presion;
    }

    public void setPresion(String presion) {
        this.presion = presion;
    }

    public int getPulsoRadial() {
        return pulsoRadial;
    }

    public void setPulsoRadial(int pulsoRadial) {
        this.pulsoRadial = pulsoRadial;
    }

    public int getPulsoPedio_d() {
        return pulsoPedio_d;
    }

    public void setPulsoPedio_d(int pulsoPedio_d) {
        this.pulsoPedio_d = pulsoPedio_d;
    }

    public int getPulsoPedio_i() {
        return pulsoPedio_i;
    }

    public void setPulsoPedio_i(int pulsoPedio_i) {
        this.pulsoPedio_i = pulsoPedio_i;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public boolean isSens_d() {
        return sens_d;
    }

    public void setSens_d(boolean sens_d) {
        this.sens_d = sens_d;
    }

    public boolean isSens_i() {
        return sens_i;
    }

    public void setSens_i(boolean sens_i) {
        this.sens_i = sens_i;
    }

    public String gettPoda1_d() {
        return tPoda1_d;
    }

    public void settPoda1_d(String tPoda1_d) {
        this.tPoda1_d = tPoda1_d;
    }

    public String gettPoda1_i() {
        return tPoda1_i;
    }

    public void settPoda1_i(String tPoda1_i) {
        this.tPoda1_i = tPoda1_i;
    }

    public boolean isCuracion() {
        return curacion;
    }

    public void setCuracion(boolean curacion) {
        this.curacion = curacion;
    }

    public boolean isResecado() {
        return resecado;
    }

    public void setResecado(boolean resecado) {
        this.resecado = resecado;
    }

    public boolean isEnucleacion() {
        return enucleacion;
    }

    public void setEnucleacion(boolean enucleacion) {
        this.enucleacion = enucleacion;
    }

    public boolean isDevastado() {
        return devastado;
    }

    public void setDevastado(boolean devastado) {
        this.devastado = devastado;
    }

    public boolean isMaso() {
        return maso;
    }

    public void setMaso(boolean maso) {
        this.maso = maso;
    }

    public boolean isEspiculoectomia() {
        return espiculoectomia;
    }

    public void setEspiculoectomia(boolean espiculoectomia) {
        this.espiculoectomia = espiculoectomia;
    }

    public boolean isAnalgesia() {
        return analgesia;
    }

    public void setAnalgesia(boolean analgesia) {
        this.analgesia = analgesia;
    }

    public boolean isColocacionAcrilico() {
        return colocacionAcrilico;
    }

    public void setColocacionAcrilico(boolean colocacionAcrilico) {
        this.colocacionAcrilico = colocacionAcrilico;
    }

    public boolean isBandaMolecular() {
        return bandaMolecular;
    }

    public void setBandaMolecular(boolean bandaMolecular) {
        this.bandaMolecular = bandaMolecular;
    }

    public boolean isColocacionPuente() {
        return colocacionPuente;
    }

    public void setColocacionPuente(boolean colocacionPuente) {
        this.colocacionPuente = colocacionPuente;
    }

    public String getTratamientoOrtonixia() {
        return tratamientoOrtonixia;
    }

    public void setTratamientoOrtonixia(String tratamientoOrtonixia) {
        this.tratamientoOrtonixia = tratamientoOrtonixia;
    }

    public boolean isPoli() {
        return poli;
    }

    public void setPoli(boolean poli) {
        this.poli = poli;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    private boolean enucleacion;
    private boolean devastado;//Devastado Ungueal
    private boolean maso;// Masoterapia o masaje
    private boolean espiculoectomia;
    private boolean analgesia;
    private boolean colocacionAcrilico;
    private boolean bandaMolecular;
    private boolean colocacionPuente;
    private String tratamientoOrtonixia;
    private boolean poli;
    private String observaciones;
}
