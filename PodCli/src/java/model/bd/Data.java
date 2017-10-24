package model.bd;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Data {

    private Conexion con;
    private ResultSet rs;
    private String query;

    public Data() throws SQLException, ClassNotFoundException {

        con = new Conexion(
                "localhost",
                "podcli",//nombre BD
                "root",
                ""//Password
        );

    }
    
    public void crearPaciente(Paciente p) throws SQLException {

        con.ejecutar("INSERT INTO paciente VALUES (null, "
                + "'" + p.getRut() + "', "
                + "'" + p.getNombre() + "', "
                + "'" + p.getSexo() + "', "
                + "'" + p.getDomicilio() + "', "
                + "'" + p.getFechaNacimiento() + "', "
                + "'" + p.getEstadoCivil() + "', "
                + "'" + p.getActividad() + "', "
                + "'" + p.getTelefonos() + "');");

    }
    
    public void crearFicha(Ficha f) throws SQLException {
        con.ejecutar("insert into ficha value(null,'NOW()',"
                    + "'" + f.getPaciente() + "',"
                    + "'" + f.getUsuario() + "',"
                    + "'" + f.getHta() + "',"
                    + "'" + f.getDm() + "',"
                    + "'" + f.getTipoDiabetes() + "',"
                    + "'" + f.getAniosEvolucion() + "',"
                    + "'" + f.isMixto() + "',"
                    + "'" + f.isControl() + "',"
                    + "'" + f.getFarmacoterapia() + "',"
                    + "'" + f.getOtros() + "',"
                    + "'" + f.getAlteracion() + "',"
                    + "'" + f.getHabitos() + "',"
                    + "'" + f.getTalla() + "',"
                    + "'" + f.getImc() + "',"
                    + "'" + f.isAmputacion() + "',"
                    + "'" + f.getUbiAmputacion() + "',"
                    + "'" + f.getnCalzado() + "',"
                    + "'" + f.isVarices() + "',"
                    + "'" + f.isHeridas() + "',"
                    + "'" + f.getUbiHeridas() + "',"
                    + "'" + f.getTipoHerida() + "',"
                    + "'" + f.isTratamiento() + "',"
                    + "'" + f.isNevos() + "',"
                    + "'" + f.getUbiNevos() + "',"
                    + "'" + f.isMaculas() + "',"
                    + "'" + f.getTipoMaculas() + "')");
    }
    
    public void crearFicha(Paciente p, Ficha f) throws SQLException {
        crearPaciente(p);
        f.setPaciente(getUltimoIdPaciente());
        crearFicha(f);
    }
    
    public void registrarAtencionPodologica(AtencionPodologica a) throws SQLException {
         query = "insert into atencionPodologica values"
                + "(null,"+a.getFicha()+","+a.getUsuario()+","
                + ""+a.getFecha()+","+a.getPresion()+","+a.getPulsoRadial()+",\n"
                + +a.getPulsoPedio_d()+" ,"+a.getPulsoPedio_i()+" ,"+a.getPeso()+" ,"
                + ""+a.isSens_d()+" ,"+a.isSens_i()+","+a.gettPoda1_d()+" ,"
                + ""+a.gettPoda1_i()+" ,"+a.isCuracion()+",\n"
                + ""+a.isColocacionPuente()+","+a.isResecado()+","+a.isEnucleacion()+","
                + ""+a.isDevastado()+" ,"+a.isMaso()+","
                + ""+a.isEspiculoectomia()+"  ,"+a.isAnalgesia()+",\n"
                + ""+a.isColocacionAcrilico()+" ,"+a.isBandaMolecular()+","
                +","+a.getTratamientoOrtonixia()+","
                + ""+a.isPoli()+" ,'"+a.getObservaciones()+"')";
        con.ejecutar(query);
    }
    
    public List<AtencionPodologica> getListaAtencionPodologica(String rut) throws SQLException{//ARREGLAR SELECT [Nico Ahumada]
        query = "select * from atencionPodologica a,ficha f, paciente p " +
                "where a.ficha = f.id and f.paciente = p.id and ( p.rut like '%"+rut+"%')";
        rs = con.ejecutarSelect(query);
        List<AtencionPodologica> atenciones = new ArrayList<>();
        AtencionPodologica a;
        while (rs.next()){
            a=new AtencionPodologica();
            a.setId(rs.getInt(1));
            a.setFicha(rs.getInt(2));
            a.setUsuario(rs.getInt(3));
            a.setFecha(rs.getTimestamp(4));
            a.setPresion(rs.getFloat(5));
            a.setPulsoRadial(rs.getInt(6));
            a.setPulsoPedio_d(rs.getInt(7));
            a.setPulsoPedio_i(rs.getInt(8));
            a.setPeso(rs.getFloat(9));
            a.setSens_d(rs.getBoolean(10));
            a.setSens_i(rs.getBoolean(11));
            a.settPoda1_d(rs.getFloat(12));
            a.settPoda1_i(rs.getFloat(13));
            a.setCuracion(rs.getBoolean(14));
            a.setColocacionPuente(rs.getBoolean(15));
            a.setResecado(rs.getBoolean(16));
            a.setEnucleacion(rs.getBoolean(17));
            a.setDevastado(rs.getBoolean(18));
            a.setMaso(rs.getBoolean(19));
            a.setEspiculoectomia(rs.getBoolean(20));
            a.setAnalgesia(rs.getBoolean(21));
            a.setColocacionAcrilico(rs.getBoolean(22));
            a.setBandaMolecular(rs.getBoolean(23));
            
            a.setTratamientoOrtonixia(rs.getInt(24));
            a.setPoli(rs.getBoolean(25));
            a.setObservaciones(rs.getString(26));
            atenciones.add(a);
        }
        con.desconectar();
        return atenciones;
    }
    
    public List<Paciente> buscarPaciente(String filtro) throws SQLException {
        List<Paciente> lista = new ArrayList<>();

        query = "SELECT * FROM paciente "
                + "WHERE rut LIKE '%" + filtro + "%' OR "
                + "nombre LIKE '%" + filtro + "%'";

        rs = con.ejecutarSelect(query);
        Paciente p;

        while (rs.next()) {
            p = new Paciente();

            p.setId(rs.getInt(1));
            p.setRut(rs.getString(2));
            p.setNombre(rs.getString(3));
            p.setSexo(rs.getString(4));
            p.setDomicilio(rs.getString(5));
            p.setFechaNacimiento(rs.getTimestamp(6));
            p.setEstadoCivil(rs.getInt(7));
            p.setActividad(rs.getString(8));
            p.setTelefonos(rs.getString(9));

            lista.add(p);
        }

        con.desconectar();

        return lista;
    }
              
     public List<Ficha> buscarFicha(String filtro) throws SQLException{ //Arrelga SELECT [Diego Aravena]
        List<Ficha> lista = new ArrayList<>();
        
        rs = con.ejecutarSelect("select * from ficha WHERE ficha.paciente = paciente.id and paciente.nombre LIKE '%"+filtro+"%' or paciente.rut LIKE '%"+filtro+"%'");
        
        Ficha f;
        
        while (rs.next()) {
            f = new Ficha();
            
            f.setId(rs.getInt(1));
            f.setFecha(rs.getTimestamp(2));
            f.setPaciente(rs.getInt(3));
            f.setUsuario(rs.getInt(4));
            f.setHta(rs.getInt(5));
            f.setDm(rs.getInt(6));
            f.setTipoDiabetes(rs.getInt(7));
            f.setAniosEvolucion(rs.getInt(8));
            f.setMixto(rs.getBoolean(9));
            f.setControl(rs.getBoolean(10));
            f.setFarmacoterapia(rs.getString(11));
            f.setOtros(rs.getString(12));
            f.setAlteracion(rs.getString(13));
            f.setHabitos(rs.getString(14));
            f.setTalla(rs.getFloat(15));
            f.setImc(rs.getFloat(16));
            f.setAmputacion(rs.getBoolean(17));
            f.setUbiAmputacion(rs.getString(18));
            f.setnCalzado(rs.getInt(19));
            f.setVarices(rs.getBoolean(20));
            f.setHeridas(rs.getBoolean(21));
            f.setUbiHeridas(rs.getString(22));
            f.setTipoHerida(rs.getString(23));
            f.setTratamiento(rs.getBoolean(24));
            f.setNevos(rs.getBoolean(25));
            f.setUbiNevos(rs.getString(26));
            f.setMaculas(rs.getBoolean(27));
            f.setTipoMaculas(rs.getString(28));
            
            lista.add(f);
        }
        con.desconectar();

        return lista;
    }
     
     public List<Ficha> listarFicha(String filtro) throws SQLException{
        List<Ficha> lista = new ArrayList<>();
        
        rs = con.ejecutarSelect("SELECT * FROM ficha;");
        
        Ficha f;
        
        while (rs.next()) {
            f = new Ficha();
            
            f.setId(rs.getInt(1));
            f.setFecha(rs.getTimestamp(2));
            f.setPaciente(rs.getInt(3));
            f.setUsuario(rs.getInt(4));
            f.setHta(rs.getInt(5));
            f.setDm(rs.getInt(6));
            f.setTipoDiabetes(rs.getInt(7));
            f.setAniosEvolucion(rs.getInt(8));
            f.setMixto(rs.getBoolean(9));
            f.setControl(rs.getBoolean(10));
            f.setFarmacoterapia(rs.getString(11));
            f.setOtros(rs.getString(12));
            f.setAlteracion(rs.getString(13));
            f.setHabitos(rs.getString(14));
            f.setTalla(rs.getFloat(15));
            f.setImc(rs.getFloat(16));
            f.setAmputacion(rs.getBoolean(17));
            f.setUbiAmputacion(rs.getString(18));
            f.setnCalzado(rs.getInt(19));
            f.setVarices(rs.getBoolean(20));
            f.setHeridas(rs.getBoolean(21));
            f.setUbiHeridas(rs.getString(22));
            f.setTipoHerida(rs.getString(23));
            f.setTratamiento(rs.getBoolean(24));
            f.setNevos(rs.getBoolean(25));
            f.setUbiNevos(rs.getString(26));
            f.setMaculas(rs.getBoolean(27));
            f.setTipoMaculas(rs.getString(28));
            
            lista.add(f);
        }
        con.desconectar();

        return lista;
     }
     
     public List<EstadoCivil> getEstadoCivil() throws SQLException {
        List<EstadoCivil> list = new ArrayList<>();

        query = "select * from estado civil";

        rs = con.ejecutarSelect(query);

        EstadoCivil es;

        while (rs.next()) {
            es = new EstadoCivil();

            es.setId(rs.getInt(1));
            es.setNombre(rs.getString(2));

            list.add(es);
        }
        con.desconectar();

        return list;

    }

    public List<Perfil> getPerfiles() throws SQLException {
        
        query = "SELECT * FROM perfil;";
        rs = con.ejecutarSelect(query);

        List<Perfil> list = new ArrayList<>();
        Perfil p;

        while (rs.next()) {
            p = new Perfil();
            p.setId(rs.getInt(1));
            p.setNombre(rs.getString(2));
            list.add(p);
        }
        con.desconectar();
        return list;
    }

    public List<TratamientoOrtonixia> getTratamientoOrtonoxia() throws SQLException {
        
        query = "SELECT * FROM Ortonoxia;";
        rs = con.ejecutarSelect(query);

        List<TratamientoOrtonixia> list = new ArrayList<>();
        TratamientoOrtonixia to;

        while (rs.next()) {
            to = new TratamientoOrtonixia();
            to.setId(rs.getInt(1));
            to.setNombre(rs.getString(2));
            list.add(to);
        }
        con.desconectar();

        return list;
    }
     
    private int getUltimoIdPaciente() throws SQLException { //Genera id del ultimo paciente Creado
        int ultimaId = 0;
        String lastId = "SELECT MAX(id) FROM paciente;";
        rs = con.ejecutarSelect(lastId);
        Paciente p;
        if(rs.next()){
            p = new Paciente();
            p.setId(rs.getInt(1));
            ultimaId = p.getId();
        }
        
        return ultimaId;
    }
}
//Si alguno ve que falta algo, Digalo por wsp o en algun momento, non se callen nada Saludos
