<%--
    Document   : index
    Created on : 18-oct-2017, 16:16:51
    Author     : prez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>JSP Page</title>
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

        <div class="container mt-1">
            <!--<h1 class="page-header">Recuperaciones</h1>-->
            <div class="jumbotron">
                <div class="row">
                    <div class="align-items-center">
                    <h1>Atencion Podologica</h1>
                    <p>Bienvenid@ al sistema de atencion podologica de Santo Tomás Rancagua. 
                        Para comenzar escriba su rut y luego presione Entrar</p>
                    </div>
                    <div class="col-md-6 col-md-offset-3">
                        <form action="" method="post" class="navbar-form">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="rut" type="text" class="form-control mx-auto col-xs-3" name="rut" placeholder="EJ: 12345678-k">                                        
                            </div>

                            <input type="submit" value="Entrar" class="btn btn-primary btn-lg btn-block mx-auto mt-1" style="width: 200px;">

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--
        <h1>Podcli</h1>
        <a href="inicioSesion.jsp">Inicio Sesión</a>
        <a class="btn btn-outline-primary" href="crearFicha.jsp"> Crear Paciente </a>
        <button class="btn btn-outline-primary">Boton</button>
        <p>

          Esto
          es un
          parrafo

        </p>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <a href="crearFicha.jsp">Crear Paciente</a>
        <a href="atencionPodologica.jsp">Atencion Podologica</a>
        <a href="buscarPaciente.jsp">Buscar Paciente</a>
        <a href="crearUsuario.jsp">Crear Usuario</a>
        -->
    </body>
</html>
