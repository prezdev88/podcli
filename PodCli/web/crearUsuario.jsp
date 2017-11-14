<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Data"%>
<%@page import="model.bd.Perfil"%>
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
        <title>Crear Usuario</title>
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

                <li class="active"><a href="inicio.jsp">Volver a inicio</a></li>

            </ul>

            <ul class="nav navbar-nav navbar-right" style="padding-right: 10px">
                <li>
                    <form class="navbar-form pull-right" action="cerrar.do">
                        <button type="submit" class="btn btn-danger">Cerrar sesión</button>
                    </form>
                </li>
            </ul>
            <!-- Falta redirigir a donde se muestran los resultados de la busqueda -->

            <ul class="nav navbar-nav navbar-right">
                <li><form class="navbar-form pull-right" role="search" action="buscarPaciente.jsp" method="get">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Buscar" name="txtBuscar" required="">
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
                </li>
            </ul>
            <!-- <ul class="nav navbar-nav navbar-right">
                <li><button type="button" class="btn btn-danger navbar-btn"><a href="">Cerrar sesión</a></button></li>
            </ul> -->
        </nav>
        <script>
            function punto(e) {
                tecla = (document.all) ? e.keyCode : e.which;
                //alert(tecla);
                if (tecla < 47 || tecla > 58) {
                    return false;
                }
            }
        </script>
        <br><br>
        <!-- Falta metodo para obtener el nombre y ocupacion de la persona que entró -->
        <br>
        <div class="container">
            <div class="jumbotron" style="border-radius: 10px 10px 10px 10px">
                <center><h1>Crear Usuario</h1></center>
                <div class="row justify-content-xl-center">
                    <div class="col-md-6 col-md-offset-3">
                        <form action="crearUsuario.do" method="post">

                            <div class="form-group"> 
                                Rut:
                                <input name="txtRut" type="text" class="form-control" maxlength="8" onkeypress="return punto(event)" id="inputRut" placeholder="Ej: 12345678" required="required">
                                <%                                    Error e = (Error) request.getSession().getAttribute("error");
                                    if (e != null) {
                                        out.println("<p class='text-danger'>" + e.getMessage() + "</p>");
                                        request.getSession().removeAttribute("error");
                                    }
                                %>
                            </div>  

                            <div class="form-group">
                                Nombre:
                                <input name="txtNombre" type="text" class="form-control" id="inputNombre" placeholder="Ingrese:" required="required">
                            </div>

                            <div class="form-group">
                                Perfil:
                                <select class="form-control" id="selectPerfil" name="cboPerfil">
                                    <%
                                        for (Perfil p : new Data().getPerfiles()) {
                                            out.println("<option value='" + p.getId() + "'>" + p.getNombre() + "</option>");
                                        }
                                    %>
                                </select>
                            </div>

                            <center>
                                <button class="btn btn-primary" type="submit" value="Registrar Usuario" name="registrar">
                                    Registrar Usuario
                                </button>
                                <a href="inicio.jsp" class="btn btn-primary" role="button" aria-pressed="false" >Volver</a>
                                <!-- index.jsp o crearFicha.jsp ??  -->
                            </center>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
