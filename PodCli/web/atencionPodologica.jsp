<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Data"%>
<%@page import="model.bd.TratamientoOrtonixia"%>
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

        <title>Atención Podológica</title>
    </head>
    <style>
        .navbar-header{

            padding-top: 7px; 
            padding-left: 10px

        }
    </style>
    <body>
        <div class="row justify-content-xl-center">
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

                    <li><a href="reporteHistorico.jsp">Reporte Histórico</a></li>
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
        </div>

        <div>
            <!--<%
                if (u != null) {
                    out.println("Usuario Actual: " + u.getNombre());
                    out.println("<br>Perfil:");
                    Data d = new Data();

                    out.println(d.getPerfil(u.getPerfil()));
                }
            %>
            <!--<br><a href="buscarPaciente.jsp"> Buscar Pacientes </a>
            <br><a href="cerrar.do">Cerrar sesión</a>-->
        </div> 

        <div class="container" style="margin-top: 100px">
            <form action="registrarAtencion.do" method="post">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <%                Data d = new Data();
                            String idFicha = request.getParameter("idFicha");
                        %>
                        <h3 class="panel-title">Atención Podologica de <%= d.getNombreBy(idFicha)%></h3>
                        <%
                            if (u != null) {
                        %>
                        <input type="hidden" name="usuario" value="<%= u.getId()%>">
                        <%
                            }
                        %>
                        <input type="hidden" name="ficha" value="<%=idFicha%>">
                    </div>
                    <div class="panel-body">

                        <div class="form-group col-md-3">
                            Presión Arterial:<br>
                            <input class="form-control" type="number" step="any" name="presion" required="">
                        </div>

                        <div class="form-group col-md-3">
                            Pulso Radial:<br> 
                            <input class="form-control" type="number" name="pulso" required="">
                        </div>

                        <div class="form-group col-md-3">
                            Peso:<br> 
                            <input class="form-control" type="number" step="any" name="peso" required=""><br><br>
                        </div>

                        <div class="form-group col-md-3">
                            Pulso Pedio Derecho:<br> 
                            <input class="form-control" type="number" name="ppd" required="">
                        </div>

                        <div class="form-group col-md-4">
                            Pulso Pedio Izquierdo:<br> 
                            <input class="form-control" type="number" name="ppi" required=""><br><br>
                        </div>

                        <div class="form-group col-md-4">
                            T° Podal Derecho:<br> 
                            <input class="form-control" type="number" step="any" name="tpd" required=""><br><br>
                        </div>

                        <div class="form-group col-md-4">
                            T° Podal Izquierdo:<br>
                            <input class="form-control" type="number" step="any" name="tpi" required="">
                        </div>

                        <br><br>
                        <div class="form-group col-md-6">
                            Sensibilidad Pie Derecho:
                            <input  type="checkbox" value="true" name="spd">
                        </div>

                        <br><br>
                        <div class="form-group col-md-6">
                            Sensibilidad Pie Izquierdo:
                            <input type="checkbox" value="true" name="spi">
                        </div>

                        <div class="form-group col-md-6">
                            Curación:
                            <input type="checkbox" value="true" name="curacion">
                        </div>

                        <div class="form-group col-md-6">
                            Resecado:
                            <input type="checkbox" value="true" name="resecado">
                        </div>

                        <div class="form-group col-md-6">
                            Enucleación: 
                            <input type="checkbox" value="true" name="enu">
                        </div>

                        <div class="form-group col-md-6">
                            Devastado Ungueal:
                            <input type="checkbox" value="true" name="devastado">
                        </div>

                        <div class="form-group col-md-6">
                            Masoterapia o Masaje:
                            <input type="checkbox" value="true" name="maso">
                        </div>

                        <div class="form-group col-md-6">
                            Espiculoectomía:
                            <input type="checkbox" value="true" name="epi">
                        </div>

                        <div class="form-group col-md-6">
                            Analgesia:
                            <input type="checkbox" value="true" name="anal">
                        </div>

                        <div class="form-group col-md-6">
                            Colocacion Acrilico:
                            <input type="checkbox" value="true" name="acri">
                        </div>

                        <div class="form-group col-md-6">
                            Colocacion Banda Molecular:
                            <input type="checkbox" value="true" name="cbm">
                        </div>

                        <div class="form-group col-md-6">
                            Colocacion Puente:
                            <input type="checkbox" value="true" name="cpuente">
                        </div>

                        <div class="form-group col-md-6">
                            Colocacion Policarboxilato:
                            <input type="checkbox" value="true" name="cpoli">
                        </div>

                        <div class="form-group col-md-3" style="margin-right: 660px;">
                            Tratamiento Ortonixia:
                            <select name="to" class="custom-select-sm form-control form-control-sm">
                                <%
                                    for (TratamientoOrtonixia to : new Data().getTratamientosOrtonoxia()) {
                                        out.println("<option value='" + to.getId() + "'>" + to.getNombre() + "</option>");
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group col-md-12">
                            Observaciones:<br>
                            <textarea class="form-control" rows="4" name="obs"></textarea>
                        </div>


                        <br><br>

                        <center class="form-group col-md-12">
                            <button type="submit" class="btn btn-primary" value="RegistrarFicha">Registrar Atención</button>
                        </center>

                    </div>

                </div>
            </form>
        </div>
    </body>
</html>
