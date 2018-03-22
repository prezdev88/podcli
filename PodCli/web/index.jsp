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

        .navbar-header{

            padding-top: 7px; 
            padding-left: 10px

        }
        
        .jumbotron {
            background-color:transparent !important; 
        }

    </style>
    <body>

        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <a href="#" class="navbar-left">
                    <span><img width=80px height=35px src="imagen/ist.jpg"></span>
                </a>
            </div>
            <p class="navbar-text pull-left">PodCli</p>
        </nav>
        <br><br><br>
        <div class="container">
            <div class="jumbotron">
                <div class="container">
                    <h1>Atencion Podológica</h1>
                    <br>
                    <p>Bienvenid@ al sistema de atención podológica de Santo Tomás Rancagua.
                        Para comenzar escriba su rut y luego presione Entrar</p>

                    <form action="iniciarSesion.do" method="post" class="form-inline">
                        <div class="form-group">
                            <input id="rut" type="text" name="rut" placeholder="EJ: 12345678" required="" class="form-control" style="width: 250px; text-align: center">                                                  
                        </div>
                        <input type="submit" value="Entrar" class="btn btn-primary" style="width: 150px;"><br>
                    </form>

                </div>
            </div>
            <%
                Error e = (Error) request.getSession().getAttribute("error");
                if (e != null) {
                    out.println("<p class='alert alert-danger' role='alert'>" + e.getMessage() + "</p>");
                    request.getSession().removeAttribute("error");
                }
            %>
        </div>
    </body>
</html>
