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
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Buscar paciente</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-fixed-top navbar justify-content-end navbar-light bg-light">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <img width="50px" alt="Brand" src="http://www.prodx.cl/images/ust.png">
                    </a>
                    <a class="navbar-brand" href="#">[PodCli]</a>
                </div>
            </div><!-- /.container-fluid -->
        </nav>
        <br><br><br><br>
        <div class="container mt">
            <div class="row justify-content-xl-center">

            </div>
            <div class="row justify-content-xl-center" >
                <nav class="navbar navbar-light bg-light col-md-9 col-md-offset-3 " <%--style="border-style: outset;"--%>>
                    <h1>Buscar Paciente</h1>                               

                    <form class="form-inline">
                        <div class="form-group">
                            <label for="busqueda" class="sr-only">Ingrese datos</label>
                            <input type="text" readonly class="form-control-plaintext" id="busqueda" value="Busqueda por nombre o rut:" style="width: 210px;">
                        </div>
                        <div class="form-group mx-sm-3">
                            <label for="inputPassword2" class="sr-only">Password</label>
                            <input class="form-control" type="text" name="txtBuscar" placeholder="Buscar" aria-label="Search">
                        </div>
                        <button class="btn btn-outline-success mx-auto mt-0" type="submit" value="Buscar Paciente" name="buscar" style="width: 140px;">Buscar</button>
                        <a href="crearFicha.jsp" class="btn btn-outline-success mx-sm-3 mt-0 " role="button" aria-pressed="false" style="width: 140px;">Volver</a>
                    </form>
                </nav>
            </div>
        </div>
        <div class="container mt">
            <div class="row justify-content-xl-center">  
                <nav class="navbar navbar-light bg-light col-md-9 col-md-offset-3 ">
                    <%
                        if (request.getParameter("txtBuscar") != "" && request.getParameter("txtBuscar") != null) {
                            out.println("<table class='table'>");
                            out.print("<thead class='thead-light'>");
                            out.println("<tr>");
                            out.println("<th>Rut</th>");
                            out.println("<th>Nombre</th>");
                            out.println("<th>Ficha</th>");
                            out.println("<th>Atenciòn</th>");
                            out.println("</thead>");
                            out.print("<tbody>");
                            out.println("</tr>");
                            Data d = new Data();
                            for (Paciente p : d.buscarPaciente(request.getParameter("txtBuscar"))) {
                                //el TR va dentro del for ¬¬, no fuera
                                out.println("<tr>");
                                out.println("<th style='width:200px;'>" + p.getRut() + "</th>");
                                out.println("<th style='width:200px;'>" + p.getNombre() + "</th>");
                                out.println("<th><form action='verFicha.jsp' method='post'>"
                                        + "<input type='submit' value='Ver Ficha' class='btn btn-outline-secondary' style='width:200px;'>"
                                        + "<input type='hidden' name='rut' value=" + p.getRut() + " style='width:200px;'>"
                                        + "</form></th>");
                                out.println("<th><form action='atencionPodologica.jsp?idFicha="+d.getIdFicha(p.getId())+"' method='post'>"
                                        + "<input type='submit' value='Atencion Podologica' class='btn btn-outline-secondary' style='width:200px;'>"
                                        + "</form></th>");
                            }
                            out.println("</tr>");
                            out.print("</tbody>");
                            out.println("</table>");
                        }
                    %>
                </nav>
            </div>
        </div>
    </body>
</html>
