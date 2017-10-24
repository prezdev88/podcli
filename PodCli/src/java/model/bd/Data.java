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
                "",//nombre BD
                "root",
                ""//Password
        );

    }

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
    /*
    metodo con el cual se puede registrar la atencion podologica
    dandole como parametro un objeto de Atencion podologica
    */   
    public void registrarAtencionPodologica(AtencionPodologica a) throws SQLException {
         query = "insert into atencionPodologica values"
                + "(null,"+a.getFicha()+","+a.getUsuario()+","
                + ""+a.getFecha()+","+a.getPresion()+","+a.getPulsoRadial()+",\n"
                + +a.getPulsoPedio_d()+" ,"+a.getPulsoPedio_i()+" ,"+a.getPeso()+" ,"
                + ""+a.isSens_d()+" ,"+a.isSens_i()+","+a.gettPoda1_d()+" ,"
                + ""+a.gettPoda1_i()+" ,"+a.isCuracion()+",\n"
                + ""+a.isColoqPuente()+","+a.isResecado()+","+a.isEnucleacion()+","
                + ""+a.isDevastado()+" ,"+a.isMaso()+","
                + ""+a.isEspiculoectomia()+"  ,"+a.isAnalgesia()+",\n"
                + ""+a.isColocacionAcrilico()+" ,"+a.isBandaMolecular()+","
                + ""+a.isColocacionPuente()+","+a.getTratamientoOrtonixia()+","
                + ""+a.isPoli()+" ,'"+a.getObservaciones()+"')";
        con.ejecutar(query);
    }
    public List<AtencionPodologica> getListaAtencionPodologica(String rut) throws SQLException{
        query="select *from atencionPodologica a,ficha f,paciente p\n" +
                "where a.ficha=f.id and f.paciente=p.id and ( p.rut like '%"+rut+"%')";
        rs=con.ejecutarSelect(query);
        List<AtencionPodologica>atenciones=new ArrayList<>();
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
        }
        return null;
    }

    //Buscar paciente para listar (por rut, nombre, apellido y más??)
    //Buscar Paciente (atencion Podologica)
}
//Si alguno ve que falta algo, Digalo por wsp o en algun momento, non se callen nada Saludos
