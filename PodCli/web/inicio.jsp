<%-- 
    Document   : inicio
    Created on : 03-11-2017, 23:56:45
    Author     : Veroko
--%>
<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="validar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Home</title>
    </head>
    <style>
        .navbar-nav.navbar-center {
            position: absolute;
            left: 50%;
            transform: translatex(-50%);
        }

        .navbar-brand{
            padding: 10px 10px;
        }
    </style>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top " role="navigation">

            <div class="navbar-header">
                <a class="navbar-brand" href="#" style="padding-bottom: 10px">
                    <span><img width = 30px alt="Brand" src="http://www.prodx.cl/images/ust.png"></span>
                </a>
            </div>

            <p class="navbar-text pull-left">PodCli</p>

            <ul class="nav navbar-nav navbar-left">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <!-- Redirigir a crear ficha -->
                <li><a href="crearFicha.jsp">Crear ficha</a></li>
                <!-- Redirigir a reporte de uso -->
                <li><a href="#">Reporte de uso</a></li>
                <li><a href="crearUsuario.jsp">Crear Usuario</a></li>

            </ul>

            <!-- Falta redirigir a donde se muestran los resultados de la busqueda -->

            <ul class="nav navbar-nav navbar-center">
                <li><form class="navbar-form pull-right" role="search" action="" method="get">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Buscar">
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
                </li>
            </ul>
            <!-- <ul class="nav navbar-nav navbar-right">
                <li><button type="button" class="btn btn-danger navbar-btn"><a href="">Cerrar sesión</a></button></li>
            </ul> -->

            <ul class="nav navbar-nav navbar-right" style="padding-right: 10px">
                <li>
                    <form class="navbar-form pull-right" action="index.jsp">
                        <button type="submit" class="btn btn-danger">Cerrar sesión</button>
                    </form>
                </li>
            </ul>
        </nav>
 

        <!-- Falta metodo para obtener el nombre y ocupacion de la persona que entró -->
        <div class="container">
            <div class="jumbotron">
                <div class="container">
                    <% if (u != null) {
                            out.println("<br><br><br>");
                            out.println("<h1 class='display-4' >"+u.getNombre()+"</h1>");
                            out.println("<br>");
                            Data d = new Data();
                            out.println("<p class = 'lead'>"+d.getPerfil(u.getPerfil())+"</p>");
                        }
                    %>
                </div>
            </div>
        </div>
        
    </body>
</html>
