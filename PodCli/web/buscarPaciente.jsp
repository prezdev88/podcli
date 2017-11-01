<%@page import="java.util.List"%>
<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    Usuario u = (Usuario) session.getAttribute("usuario");

    if (u == null) {
        request.getSession().setAttribute("error", new Error("Debe Ingresar Rut"));
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Buscar paciente</title>
    </head>
    <body>
       
        <h1>Buscar Paciente</h1>                               

        <form action="buscarPaciente.jsp" method="post">
            <input type="text"      name="txtBuscar"    placeholder="Buscar">
            <input type="submit"    name="buscar"       value="Buscar Paciente">
        </form>
                
        <%
            String txtBuscar = request.getParameter("txtBuscar");
            if (txtBuscar != null) {
                out.println("<table>");
                    out.println("<tr>");
                        out.println("<th>Rut</th>");
                        out.println("<th>Nombre</th>");
                        out.println("<th>Ficha</th>");
                        out.println("<th>Atenciòn</th>");
                    out.println("</tr>");

                Data d = new Data();
                List<Paciente> pacientes = d.getPacientes(txtBuscar);

                for (Paciente p :pacientes) {
                    out.println("<tr>");
                        out.println("<td>" + p.getRut() + "</td>");
                        out.println("<td>" + p.getNombre() + "</td>");

                        out.println("<td>");
                            out.println("<form action='verFicha.jsp' method='post'>");
                                out.println("<input type='submit' value='Ver Ficha'>");
                                out.println("<input type='hidden' name='rut' value=" + p.getRut() + ">");
                            out.println("</form>");
                        out.println("</td>");

                        out.println("<td>");
                            out.println("<form action='atencionPodologica.jsp' method='post'>");
                                out.println("<input type='hidden' value='"+ d.getIdFicha(String.valueOf(p.getId()))+"' name='idFicha'>");
                                out.println("<input type='submit' value='Atencion Podologica'>");
                            out.println("</form>");
                        out.println("</td>");

                        out.println("<td>");
                            out.println("<form action='historicoAtencion.jsp' method='post'>");
                                out.println("<input type='submit' value='Histórico atenciones podológicas'>");
                                out.println("<input type='hidden' value='" + p.getId() + "' name = 'idPaciente'>");
                            out.println("</form>");
                        out.println("</td>");
                    out.println("</tr>");
                }

                out.println("</table>");
            }
        %>
        <a href="crearFicha.jsp">Volver</a>
    </body>
</html>
