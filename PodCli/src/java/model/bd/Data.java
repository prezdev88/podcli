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
            
            //listar/get ficha
        
            
            // get estado civil y get perfil
        
    } 
    
    public void crearFicha(Paciente p, Ficha f){
        //se crea la ficha a partir de "Registrar Paciente"
    }
    
    public List<Perfil> getPerfiles() throws SQLException{
        ResultSet rs;
        String query = "SELECT * FROM perfil;";
        rs = con.ejecutarSelect(query);
        
        List<Perfil> list = new ArrayList<>();
        Perfil p;
        
        while(rs.next()){
            p = new Perfil();
            p.setId(rs.getInt(0));
            p.setNombre(rs.getString(1));
            list.add(p);
        }
        con.desconectar();
        return list;
    }
    
}
//Si alguno ve que falta algo, Digalo por wsp o en algun momento, non se callen nada Saludos