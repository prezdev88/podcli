<%@page import="model.bd.AtencionPodologicaSelect"%>
<%@page import="java.util.List"%>
<%@page import="model.bd.Ficha"%>
<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Data d = new Data();

        String idPaciente = request.getParameter("idPaciente");
        int idFicha = d.getIdFichaById(idPaciente);
        List<AtencionPodologicaSelect> atenciones = d.getAtencionesPodologicas(idFicha);
        
        String nomPac = d.getNombreBy(String.valueOf(idFicha));
    %>
    <h1>Atenciones podológicas de <%=nomPac%></h1>
    <h3>Ficha asociada: <%=idFicha%></h3>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Fecha</th>
            <th>Observaciones</th>
            <th>Ver detalle</th>
        </tr>
        <%
            for (AtencionPodologicaSelect aps : atenciones) {
                //el TR va dentro del for ¬¬, no fuera
                out.println("<tr>");
                out.println("<td>" + aps.getId() + "</td>");
                out.println("<td>" + aps.getFecha() + "</td>");
                out.println("<td>" + aps.getObservaciones() + "</td>");
                out.println("<td>");
                out.println("<form action='verAtencion.jsp' method='post'>");
                out.println("<input type='submit' value='Ver detalle'>");
                out.println("<input type='hidden' name='idAntPod' value=" + aps.getId() + ">");
                out.println("<input type='hidden' name='idPaciente' value=" + idPaciente + ">");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }
        %>
    </table>
    <a href="buscarPaciente.jsp">Volver</a>
</html>
