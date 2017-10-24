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
                ""//Password
        );
        //Metodos:

        //1)Antecedentes personales
        //2)Antecentes morbidos
        //3)Examen fisicos

        /*Registrar Paciente(){
                1
                2
                3
              }
         */
        //atencion Podologica
        //Buscar paciente para listar (por rut, nombre, apellido y más??)
        //Buscar Paciente (atencion Podologica)
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

}
//Si alguno ve que falta algo, Digalo por wsp o en algun momento, non se callen nada Saludos
