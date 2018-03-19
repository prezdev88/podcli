<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.AtencionPodologicaSelect"%>
<%@page import="java.util.List"%>
<%@page import="model.bd.Ficha"%>
<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="validar.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Histórico Atención podológica</title>
    </head>
    <style>
        .navbar-header{
            
            padding-top: 7px; 
            padding-left: 10px
                
        }
    </style>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top " role="navigation">
            <div class="navbar-header">
                <a href="#" class="navbar-left">
                    <span><img width=80px height=35px src="imagen/ist.jpg"></span>
                </a>
            </div>

            <p class="navbar-text pull-left">PodCli</p>
            
            <%@include file="modules/actualUser.jsp" %>

            <ul class="nav navbar-nav navbar-left">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <!-- Redirigir a crear ficha -->
                <li><a href="crearFicha.jsp">Crear Ficha</a></li>

                <!-- Se agregaron recientemente en el nav -->
                <li>
                    <%                        if (u.getPerfil() == 2 || u.getPerfil() == 3) {
                    %>
                    <a href="crearUsuario.jsp">Crear Usuario</a>
                    <%
                        }
                    %></li>

                <li><a href="reporteHistorico.jsp">Reporte Histórico</a></li>
                <!-- Se agregaron recientemente en el nav -->

                <!-- Redirigir a reporte de uso -->                

            </ul>
            <!-- <ul class="nav navbar-nav navbar-right">
                <li><button type="button" class="btn btn-danger navbar-btn"><a href="">Cerrar sesión</a></button></li>
            </ul> -->
            <ul class="nav navbar-nav navbar-right" style="padding-right: 10px">
                <li>
                    <form class="navbar-form pull-right" action="cerrar.do">
                        <button type="submit" class="btn btn-danger">Cerrar sesión</button>
                    </form>
                </li>
            </ul>
            <!-- Falta redirigir a donde se muestran los resultados de la busqueda -->

            <%@include file="modules/buscarNav.jsp" %>
        </nav>  
        <br><br><br><br>
        <%      
            Data d = new Data();

            String idPaciente = request.getParameter("idPaciente");
            int idFicha = d.getIdFichaById(idPaciente);
            List<AtencionPodologicaSelect> atenciones = d.getAtencionesPodologicas(idFicha);

            String rutPaciente = d.getPaciente(idPaciente).getRut();

            String nomPac = d.getNombreBy(String.valueOf(idFicha));
        %>
        <div class="container">
            <div class="jumbotron" style="border-radius: 10px 10px 10px 10px">
                <div class="container">
                    <center>
                        <h1>Atenciones podológicas</h1>
                        <br>
                    </center>
                    <h3 style="margin-left: 170px;">
                        <form action="verFicha.jsp" class="form-inline" method="post">
                            <input type="hidden" name="rut" value="<%=rutPaciente%>">
                            Nombre del Paciente: [ <%=nomPac%> ]                         
                            <input type="submit" value="Ver ficha" class="btn btn-default" style="width: 200px;">
                        </form>
                    </h3>
                    <center>
                        <table class="table table-striped">
                            <tr>
                                <th style="background-color:#6AA3E4; color:white;">Id</th>
                                <th style="background-color:#6AA3E4; color:white;">Fecha</th>
                                <th style="background-color:#6AA3E4; color:white;">Observaciones</th>
                                <th style="background-color:#6AA3E4; color:white;">Ver detalle</th>
                            </tr>
                            <%
                                for (AtencionPodologicaSelect aps : atenciones) {
                                    out.println("<tr>");
                                    out.println("<td class='active'>" + aps.getId() + "</td>");
                                    out.println("<td class='active'>" + Data.getFormattedDate(aps.getFecha(), true) + "</td>");
                                    out.println("<td class='active'>" + aps.getObservaciones() + "</td>");
                                    out.println("<td class='active'>");
                                    out.println("<form action='verAtencion.jsp' method='post' class='form-inline'>");
                                    out.println("<input type='submit' value='Ver detalle' class='btn btn-default'>");
                                    out.println("<input type='hidden' name='idAntPod' value=" + aps.getId() + ">");
                                    out.println("<input type='hidden' name='idPaciente' value=" + idPaciente + ">");
                                    out.println("</form>");
                                    out.println("</td>");
                                    out.println("</tr>");
                                }
                            %>
                        </table>
                    </center>
                </div>
            </div>
        </div> 
    </body>
</html>