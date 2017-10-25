<%-- 
    Document   : buscarFicha
    Created on : 24-oct-2017, 15:20:57
    Author     : Edunaldo
--%>

<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Buscar Paciente</h1>
        
        <form action="buscarPaciente.jsp" method="post">
            <input type="text" name="txtBuscar" placeholder="Buscar por Rut o Nombre:">
            <input type="submit" value="Buscar Paciente" name="buscar">
        </form>
        
            <%
                if(request.getParameter("txtBuscar") != "" && request.getParameter("txtBuscar") != null){
                    out.println("<table border=1>");
                    out.println("<tr>");
                        out.println("<th>Rut</th>");
                        out.println("<th>Nombre</th>");
                        out.println("<th>Ficha</th>");
                        out.println("<th>Atenciòn</th>");
                    out.println("</tr>");
                    Data d = new Data();
                    out.println("<tr>");
                    for(Paciente p : d.buscarPaciente(request.getParameter("txtBuscar")) ){
                        out.println("<th>"+p.getRut()+"</th>");
                        out.println("<th>"+p.getNombre()+"</th>");
                        out.println("<th><form action='verFicha.jsp' method='post'>"
                                    + "<input type='submit' value='Ver Ficha'>"
                                    + "<input type='hidden' name='rut' value="+p.getRut()+">"
                                + "</form></th>");
                        out.println("<th><form action='atencionPodologica.jsp' method='post'>"
                                    + "<input type='submit' value='Atencion Podologica'>"
                                + "</form></th>");
                    }
                    out.println("</tr>");
                    out.println("</table>");
                }
            %>
            <a href="index.jsp">Volver</a>
    </body>
</html>
