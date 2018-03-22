<%@page import="model.bd.DetalleAtencion"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bd.CantidadAtencion"%>
<%@page import="model.bd.Rango"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.DatosReporteUso"%>
<%@page import="java.util.List"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="validar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Reporte Histórico</title>
        <!-- Esto es del calendario JQUERY -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 



        <!-- Esto es del calendario JQUERY -->


        <%                
            Data d = new Data();
        %>


        <style>
            .navbar-nav.navbar-center {
                position: absolute;
                left: 50%;
                transform: translatex(-50%);
            }

            .navbar-header{
                padding-top: 7px; 
                padding-left: 10px
            }
        </style>
    </head>
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

                <li class="active"><a href="reporteHistorico.jsp">Reporte Histórico</a></li>
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

        <br><br><br>
        <div class="container">
            
            <h1>Reportes</h1>
            <h3>Historial de atenciones podológicas</h3>

            <%
            List<DetalleAtencion> detalles = d.getDetallesAtencion(request.getParameter("id"));
            %>
            
            <table class="table table-striped">
                <tr>
                    <th>Rut</th>
                    <th>Nombre</th>
                    <th>Fecha Atención</th>
                    <th>Ver detalle atención</th>
                </tr>
                
                
                <%for (DetalleAtencion da : detalles) {%>
                    <tr>
                        <td><%=da.getRutPaciente()%></td>
                        <td>
                            <a href="verFicha.jsp?rut=<%= da.getRutPaciente() %>"><%=da.getNombrePaciente()%></a>
                            <a href="historicoAtencion.jsp?idPaciente=<%= da.getIdPaciente()%>">[Ver històrico de atenciones]</a>
                        </td>
                        <td><%=da.getFechaAtencion()%></td>
                        <td>
                            <form action="verAtencion.jsp" method="post">
                                <input type="hidden" name="idAntPod" value="<%= da.getIdAtencion() %>">
                                <input type="hidden" name="idPaciente" value="<%= da.getIdPaciente() %>">
                                <input type="submit" value="Ver detalle" class="btn btn-success">
                            </form>
                        </td>
                    </tr>
                <%}%>
                
            </table>
        </div>
    </body>
</html>
