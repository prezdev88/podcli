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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-fixed-top navbar justify-content-end" style="background-color: #F9FCF7">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header" style="text">
                    <a class="navbar-brand">
                        <img width="50px" alt="Brand" src="http://www.prodx.cl/images/ust.png">
                    </a>
                    PodCli
                </div>
            </div><!-- /.container-fluid -->
        </nav>
        
        <div class="container mt-3">
            <div class="jumbotron" style="border-radius: 10px 10px 10px 10px">
                <center><h1>Crear Usuario</h1></center>
                <div class="row justify-content-xl-center">
                    <div class="col-md-6 col-md-offset-3">
                        <form action="crearUsuario.do" method="post">
                            
                            <div class="form-group"> 
                                <label for="inputRut">Rut:</label>
                                <input name="txtRut" type="text" class="form-control" id="inputRut" placeholder="Ej: 12345678" required="required">
                                <%                                    
                                    Error e = (Error) request.getSession().getAttribute("error");
                                    if (e != null) {
                                        out.println("<p class='text-danger'>" + e.getMessage() + "</p>");
                                        request.getSession().removeAttribute("error");
                                    }
                                %>
                            </div>  

                            <div class="form-group">
                                <label for="inputNombre">Nombre:</label>
                                <input name="txtNombre" type="text" class="form-control" id="inputNombre" placeholder="Ingrese:" required="required">
                            </div>

                            <div class="form-group">
                                <label for="selectPerfil" class="control-label">Perfil</label>
                                <select class="form-control" id="selectPerfil" name="cboPerfil">
                                    <%
                                        for (Perfil p : new Data().getPerfiles()) {
                                            out.println("<option value='" + p.getId() + "'>" + p.getNombre() + "</option>");
                                        }
                                    %>
                                </select>
                            </div>
                                
                            <center>
                                <button class="btn btn-outline-primary mx-auto mt-0" type="submit" value="Registrar Usuario" name="registrar" style="width: 140px;">
                                    Registrar Usuario
                                </button>
                                <a href="crearFicha.jsp" class="btn btn-outline-primary mx-sm-3 mt-0 " role="button" aria-pressed="false" style="width: 140px;">Volver</a>
                                <!-- index.jsp o crearFicha.jsp ??  -->
                            </center>
                                
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
