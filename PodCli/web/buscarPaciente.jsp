<%@page import="java.util.List"%>
<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="validar.jsp"%>
<!DOCTYPE html>

<% request.setCharacterEncoding("UTF-8"); %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


        <title>Buscar Paciente</title>
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

                <%if(u.getPerfil() == 2 || u.getPerfil() == 3){%>
                    <li><a href="reporteHistorico.jsp">Reporte Histórico</a></li>
                <%}%>
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
            

            <%@include file="modules/buscarNav.jsp" %>
        </nav>
        </nav>
        <br><br>
        <!--<form action="buscarPaciente.jsp" method="post">
            <input type="text"      name="txtBuscar"    placeholder="Buscar">
            <input type="submit"    name="buscar"       value="Buscar Paciente">
        </form>-->
        <br>
        <div class="container">
            <div >
                <div class="container">
                    <h1>Buscar Paciente</h1>
                    <table class="table table-striped">
                        <%            
                            String txtBuscar = request.getParameter("txtBuscar");
                            if (txtBuscar != null) {
                                out.println("<tr>");
                                    out.println("<th>Rut</th>");
                                    out.println("<th>Nombre</th>");
                                    out.println("<th>Ficha</th>");
                                    out.println("<th>Atender</th>");
                                    out.println("<th>Histórico</th>");
                                out.println("</tr>");

                                Data d = new Data();
                                List<Paciente> pacientes = d.getPacientes(txtBuscar);

                                for (Paciente p : pacientes) {
                                    out.println("<tr>");
                                    out.println("<td>" + p.getRut() + "</td>");
                                    out.println("<td>" + p.getNombre() + "</td>");

                                    out.println("<td>");
                                    out.println("<form action='verFicha.jsp' method='post' class='form-inline'>");
                                    out.println("<input type='submit' value='Ver Ficha' class='btn btn-success'>");
                                    out.println("<input type='hidden' name='rut' value=" + p.getRut() + ">");
                                    out.println("</form>");
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println("<form action='atencionPodologica.jsp' method='post' class='form-inline'>");
                                    out.println("<input type='hidden' value='" + d.getIdFicha(String.valueOf(p.getId())) + "' name='idFicha'>");
                                    out.println("<input type='submit' value='Atender' class='btn btn-info'>");
                                    out.println("</form>");
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println("<form action='historicoAtencion.jsp' method='post' class='form-inline'>");
                                    out.println("<input type='submit' value='Histórico atenciones' class='btn btn-warning'>");
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
        </div>
</body>
</html>
