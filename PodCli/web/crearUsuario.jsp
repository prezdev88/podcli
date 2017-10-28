<%-- 
    Document   : crearUsuario
    Created on : 24-oct-2017, 16:55:32
    Author     : Edunaldo
--%>

<%@page import="model.bd.Data"%>
<%@page import="model.bd.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Crear Usuario</h1>
        
        <form action="crearUsuario.do" method="post">
            <input type="text" name="txtRut" placeholder="Ingrese Rut Usuario:">
            <input type="text" name="txtNombre" placeholder="Ingrese Nombre Usuario:">
            Perfil:
            <select name="cboPerfil">
                <%
                for(Perfil p : new Data().getPerfiles()){
                    out.println("<option value='"+p.getId()+"'>"+p.getNombre()+"</option>");
                }
                %>
            </select>
            
            <input type="submit" value="Registar Usuario">
        </form>
            <a href="index.jsp">Volver</a>
        
            <%
            Error e = (Error)request.getSession().getAttribute("error");
            
            if(e != null){
                out.println(e.getMessage());
            }
            %>
    </body>
</html>
