<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>PodCli</title>
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
            <!-- El logotipo y el icono que despliega el menú se agrupan
                 para mostrarlos mejor en los dispositivos móviles -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#" style="padding-bottom: 10px">
                    <span><img width = 30px alt="Brand" src="http://www.prodx.cl/images/ust.png"></span>
                </a>
            </div>
            <p class="navbar-text pull-left">PodCli</p>
        </nav>
        <br><br><br>
        <div class="container mt-0">
            <div class="jumbotron" style="border-radius: 10px 10px 10px 10px">
                <center>
                    <div class="container">
                        <h1>Atencion Podológica</h1>
                        <br>
                        <p>Bienvenid@ al sistema de atención podológica de Santo Tomás Rancagua.
                            Para comenzar escriba su rut y luego presione Entrar</p>

                        <form action="iniciarSesion.do" method="post" class="form-inline">
                            <div class="form-group">
                                <input id="rut" type="text" name="rut" placeholder="EJ: 12345678-k" required="" class="form-control" style="width: 250px; text-align: center">                                                  
                            </div>
                            <center>
                                <%
                                    Error e = (Error) request.getSession().getAttribute("error");
                                    if (e != null) {
                                        out.println("<p class='text-danger input-sm'>" + e.getMessage() + "</p>");
                                        request.getSession().removeAttribute("error");
                                    }
                                %>
                            </center>
                            <br>
                            <input type="submit" value="Entrar" class="btn btn-primary" style="width: 150px;"><br>
                        </form>
                    </div>
                </center>
            </div>
        </div>
    </body>
</html>
