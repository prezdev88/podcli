package model.bd;

import java.sql.SQLException;

public class Data {
    private Conexion con;
    
    public Data() throws SQLException, ClassNotFoundException {
        
        con = new Conexion(
                "localhost", 
                "podcli",//nombre BD
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
    
    public void registrarPaciente(Paciente p) throws SQLException{
            
        con.ejecutar("INSERT INTO paciente VALUES (null, '"+p.getRut()+"', '"+p.getNombre()+"',"
                + " '"+p.getSexo()+"', '"+p.getDomicilio()+"', '"+p.getFechaNacimiento()+"',"
                + " '"+p.getEstadoCivil()+"', '"+p.getActividad()+"', '"+p.getTelefonos()+"');");
    }
    
    
}
//Si alguno ve que falta algo, Digalo por wsp o en algun momento, non se callen nada Saludos