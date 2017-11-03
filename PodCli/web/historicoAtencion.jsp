<%@page import="model.bd.AtencionPodologicaSelect"%>
<%@page import="java.util.List"%>
<%@page import="model.bd.Ficha"%>
<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Histórico atención podológica</title>
    </head>
    <%
        Data d = new Data();

        String idPaciente = request.getParameter("idPaciente");
        int idFicha = d.getIdFichaById(idPaciente);
        List<AtencionPodologicaSelect> atenciones = d.getAtencionesPodologicas(idFicha);
        
        String rutPaciente = d.getPaciente(idPaciente).getRut();
        
        String nomPac = d.getNombreBy(String.valueOf(idFicha));
    %>
    <h1>Atenciones podológicas de <%=nomPac%></h1>
    <h3>
        <form action="verFicha.jsp">
            <input type="hidden" name="rut" value="<%=rutPaciente%>">
            <input type="submit" value="Ver ficha">
        </form>
    </h3>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Fecha</th>
            <th>Observaciones</th>
            <th>Ver detalle</th>
        </tr>
        <%
            for (AtencionPodologicaSelect aps : atenciones) {
                out.println("<tr>");
                out.println("<td>" + aps.getId() + "</td>");
                out.println("<td>" + Data.getFormattedDate(aps.getFecha(), true) + "</td>");
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
