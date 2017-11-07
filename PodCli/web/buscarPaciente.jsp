<%@page import="java.util.List"%>
<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Paciente"%>
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
        <title>Buscar Paciente</title>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top " role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#" style="padding-bottom: 10px">
                    <span><img width = 35px alt="Brand" src="http://www.prodx.cl/images/ust.png"></span>
                </a>
            </div>

            <p class="navbar-text pull-left">PodCli</p>

            <p class="navbar-text">
                <%    if (u != null) {
                        out.println("Usuario Actual: " + u.getNombre());
                        out.println("</p><p class='navbar-text'>Perfil:");
                        Data d = new Data();

                        out.println(d.getPerfil(u.getPerfil()));
                    }
                %>

                <%
                    if (u.getPerfil() == 2 || u.getPerfil() == 3) {
                %>
                <%
                    }
                %></p>



            <ul class="nav navbar-nav navbar-left">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <!-- Redirigir a crear ficha -->

                <!-- Redirigir a reporte de uso -->

                <li><a href="inicio.jsp">Volver a inicio</a></li>

            </ul>

            <!-- Falta redirigir a donde se muestran los resultados de la busqueda -->

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
                            <input type="text" class="form-control" name="txtBuscar" placeholder="Buscar">
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
                </li>
            </ul>
        </nav><br><br><br><br>
        <!--<form action="buscarPaciente.jsp" method="post">
            <input type="text"      name="txtBuscar"    placeholder="Buscar">
            <input type="submit"    name="buscar"       value="Buscar Paciente">
        </form>-->
    <center>
        <div class="container">
            <div class="jumbotron" style="background-color: #F7F6F5;">
                <h1>Buscar Paciente</h1>
                <table class="table table-striped">
                    <%            String txtBuscar = request.getParameter("txtBuscar");
                        if (txtBuscar != null) {
                            out.println("<tr>");
                            out.println("<th style='background-color:#6AA3E4; color:white;'>Rut</th>");
                            out.println("<th style='background-color:#6AA3E4; color:white;'>Nombre</th>");
                            out.println("<th style='background-color:#6AA3E4; color:white;'>Ficha</th>");
                            out.println("<th style='background-color:#6AA3E4; color:white;'>Atenciòn</th>");
                            out.println("<th style='background-color:#6AA3E4; color:white;'>Atencion Podológica</th>");
                            out.println("</tr>");

                            Data d = new Data();
                            List<Paciente> pacientes = d.getPacientes(txtBuscar);

                            for (Paciente p : pacientes) {
                                out.println("<tr>");
                                out.println("<td class='active'>" + p.getRut() + "</td>");
                                out.println("<td class='active'>" + p.getNombre() + "</td>");

                                out.println("<td class='active'>");
                                out.println("<form action='verFicha.jsp' method='post' class='form-inline'>");
                                out.println("<input type='submit' value='Ver Ficha' class='btn btn-default'>");
                                out.println("<input type='hidden' name='rut' value=" + p.getRut() + ">");
                                out.println("</form>");
                                out.println("</td>");

                                out.println("<td class='active'>");
                                out.println("<form action='atencionPodologica.jsp' method='post' class='form-inline'>");
                                out.println("<input type='hidden' value='" + d.getIdFicha(String.valueOf(p.getId())) + "' name='idFicha'>");
                                out.println("<input type='submit' value='Atencion Podologica' class='btn btn-default'>");
                                out.println("</form>");
                                out.println("</td>");

                                out.println("<td class='active'>");
                                out.println("<form action='historicoAtencion.jsp' method='post' class='form-inline'>");
                                out.println("<input type='submit' value='Histórico atenciones podológicas' class='btn btn-default'>");
                                out.println("<input type='hidden' value='" + p.getId() + "' name = 'idPaciente'>");
                                out.println("</form>");
                                out.println("</td>");
                                out.println("</tr>");
                            }
                        }
                    %>
                </table>
            </div>
        </div>
    </center>
</body>
</html>
