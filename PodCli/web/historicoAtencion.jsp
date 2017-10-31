<%@page import="model.bd.Ficha"%>
<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <table>
      <thead class='thead-light'>
        <tr>
            <th>id</th>
            <th>Fecha</th>
            <th>ver</th>
            </thead>
            <tbody>
              
        </tr>
        <tr>
            <%
                int id = Integer.parseInt(request.getParameter("idPaciente"));
                out.println("<th>" + id + "</th>");
                out.print("</tbody>");
                Data d = new Data();
                
                 for (Ficha f : d.buscarFichaById(Integer.parseInt(request.getParameter("idPaciente")))) {
                                //el TR va dentro del for ¬¬, no fuera
                                out.println("<tr>");
                                out.println("<th style='width:200px;'>" + f.getId()+ "</th>");
                                out.println("<th style='width:200px;'>" + f.getFecha() + "</th>");
                                out.println("<th><form action='verFicha.jsp' method='post'>"
                                        + "<input type='submit' value='Ver Ficha' class='btn btn-outline-secondary' style='width:200px;'>"
                                        + "<input type='hidden' name='idFicha' value=" + f.getId() + " style='width:200px;'>"
                                        + "</form></th>");
                 }


            %>
        </tr>


    </table>

</html>
