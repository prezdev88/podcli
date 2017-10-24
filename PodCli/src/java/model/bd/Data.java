package model.bd;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Data {

    private Conexion con;

    public Data() throws SQLException, ClassNotFoundException {

        con = new Conexion(
                "localhost",
                "",//nombre BD
                "root",
                "");//Password
    }

    public void crearFicha(Paciente p, Ficha f) {
        //se crea la ficha a partir de "Registrar Paciente"    
    }

    public List<EstadoCivil> getEstadoCivil() throws SQLException {
        List<EstadoCivil> list = new ArrayList<>();

        String query = "select * from estado civil";

        ResultSet rs = con.ejecutarSelect(query);

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

    public void registrarPaciente(Paciente p) throws SQLException {

        con.ejecutar("INSERT INTO paciente VALUES (null, '" + p.getRut() + "', '" + p.getNombre() + "',"
                + " '" + p.getSexo() + "', '" + p.getDomicilio() + "', '" + p.getFechaNacimiento() + "',"
                + " '" + p.getEstadoCivil() + "', '" + p.getActividad() + "', '" + p.getTelefonos() + "');");

    }

    public List<Perfil> getPerfiles() throws SQLException {
        ResultSet rs;
        String query = "SELECT * FROM perfil;";
        rs = con.ejecutarSelect(query);

        List<Perfil> list = new ArrayList<>();
        Perfil p;

        while (rs.next()) {
            p = new Perfil();
            p.setId(rs.getInt(0));
            p.setNombre(rs.getString(1));
            list.add(p);
        }
        con.desconectar();
        return list;
    }

    public List<Paciente> buscarPaciente(String filtro) throws SQLException {
        List<Paciente> lista = new ArrayList<Paciente>();

        String query = "SELECT * FROM paciente "
                + "WHERE rut LIKE '%" + filtro + "%' OR "
                + "nombre LIKE '%" + filtro + "%'";

        ResultSet rs = con.ejecutarSelect(query);
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

    public void crearFicha(Ficha f) throws SQLException {
        con.ejecutar("inserte into ficha value(null,'NOW()',"
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
    
     public List<Ficha> buscarFicha(String filtro) throws SQLException{
        List<Ficha> lista = new ArrayList<Ficha>();
        
        ResultSet rs = con.ejecutarSelect("select * from ficha WHERE usuario Like = '"+filtro+"'");
        
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
        List<Ficha> lista = new ArrayList<Ficha>();
        
        ResultSet rs = con.ejecutarSelect("SELECT * FROM ficha;");
        
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
//Metodos:

    //1)Antecedentes personales
    //2)Antecentes morbidos
    //Examen fisicos
    //atencion Podologica
    //Buscar paciente para listar (por rut, nombre, apellido y más??) (OK)
    //Ficha
    // listar/get ficha - estado civil - perfil (OK)
}
//Si alguno ve que falta algo, Digalo por wsp o en algun momento, non se callen nada Saludos
