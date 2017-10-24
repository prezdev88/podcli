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
        con.ejecutar("inserte into ficha value(null,'" + f.getFecha() + "','" + f.getPaciente() + "','" + f.getUsuario() + "','" + f.getHta() + "','" + f.getDm() + "','" + f.getTipoDiabetes() + "','" + f.getAniosEvolucion() + "','" + f.isMixto() + "','" + f.isControl() + "','" + f.getFarmacoterapia() + "','" + f.getOtros() + "','" + f.getAlteracion() + "','" + f.getHabitos() + "','" + f.getTalla() + "','" + f.getImc() + "','" + f.isAmputacion() + "','" + f.getUbiAmputacion() + "','" + f.getnCalzado() + "','" + f.isVarices() + "','" + f.isHeridas() + "','" + f.getUbiHeridas() + "','" + f.getTipoHerida() + "','" + f.isTratamiento() + "','" + f.isNevos() + "','" + f.getUbiNevos() + "','" + f.isMaculas() + "','" + f.getTipoMaculas() + "')");
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
