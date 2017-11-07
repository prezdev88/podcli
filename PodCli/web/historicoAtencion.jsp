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
        <title>Histórico atención podológica</title>
    </head>
    <style>
        .navbar-brand{
            padding: 10px 10px;
        }
    </style>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <!-- El logotipo y el icono que despliega el menú se agrupan
                 para mostrarlos mejor en los dispositivos móviles -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#" style="padding-bottom: 10px">
                    <span><img width = 35px alt="Brand" src="http://www.prodx.cl/images/ust.png"></span>
                </a>
            </div>
            <p class="navbar-text pull-left">PodCli</p>

            <p class="navbar-text">
                <%    if (u != null) {
                        out.println("Usuario Actual: " + u.getNombre());
                        out.println("</p><p class='navbar-text'>Perfil: ");
                        Data d = new Data();

                        out.println(d.getPerfil(u.getPerfil()));
                    }
                %>
            </p>

            <ul class="nav navbar-nav navbar-left">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <!-- Redirigir a crear ficha -->
                <!-- Redirigir a reporte de uso -->
                <li><a href="inicio.jsp">Volver a inicio</a></li>

            </ul>

            <ul class="nav navbar-nav navbar-right" style="padding-right: 10px">
                <li>
                    <form class="navbar-form pull-right" action="index.jsp">
                        <button type="submit" class="btn btn-danger">Cerrar sesión</button>
                    </form>
                </li>
            </ul>
            <!-- Falta redirigir a donde se muestran los resultados de la busqueda -->

            <ul class="nav navbar-nav navbar-right">
                <li><form class="navbar-form pull-right" role="search" action="buscarPaciente.jsp" method="get">
                        <div class="form-group">
                            <input type="text" class="form-control" name="txtBuscar" placeholder="Buscar" required="">
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
                </li>
            </ul>
        </nav>
        <br><br><br><br>
        <%        Data d = new Data();

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
                        <form action="verFicha.jsp" class="form-inline">
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