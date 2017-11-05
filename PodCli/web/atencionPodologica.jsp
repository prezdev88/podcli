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
    <body>
        <div class="row justify-content-xl-center">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" style="padding-bottom: 10px">
                        <span><img width = 50px alt="Brand" src="http://www.prodx.cl/images/ust.png"></span>
                    </a>
                </div>

                <p class="navbar-text pull-left">PodCli</p>

                <ul class="nav navbar-nav navbar-left">
                    <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                    <!-- Redirigir a crear ficha -->
                    <li><a href="#"><% if (u != null) {
                            out.println("Usuario Actual: " + u.getNombre());
                            out.println("<br>Perfil:");
                            Data d = new Data();

                            out.println(d.getPerfil(u.getPerfil()));
                        }
                            %>

                            <%
                                if (u.getPerfil() == 2 || u.getPerfil() == 3) {
                            %>
                            <br><a href="crearUsuario.jsp">Crear Usuario</a>
                            <br><a href="reporteHistorico.jsp">Reporte histórico</a>
                            <%
                                }
                            %></a></li>
                    <!-- Redirigir a reporte de uso -->
                    <li><a href="#">Reporte de uso</a></li>
                    <li><a href="crearFicha.jsp">Crear Ficha</a></li>
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
                    <li><form class="navbar-form pull-right" role="search" action="" method="get">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Buscar">
                            </div>
                            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        </form>
                    </li>
                </ul>
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

            <%
                if (u.getPerfil() == 2 || u.getPerfil() == 3) {
            %>
            <br><a href="crearUsuario.jsp">Crear Usuario</a>
            <br><a href="reporteHistorico.jsp">Reporte histórico</a>
            <%
                }
            %>-->

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
                            <label for="presionArterial">Presión Arterial:</label><br>
                            <input class="form-control" type="number" step="any" name="txtPersionArterial">
                        </div>

                        <div class="form-group col-md-3">
                            <label for="pulsoRadial">Pulso Radial:</label><br> 
                            <input class="form-control" type="number" name="txtPulsoRadial">
                        </div>

                        <div class="form-group col-md-3">
                            <label for="peso">Peso:</label><br> 
                            <input class="form-control" type="number" step="any" name="txtPeso"><br><br>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="pulsopedioDerecho">Pulso Pedio Derecho:</label><br> 
                            <input class="form-control" type="number" name="txtPulsoPedioDerecho">
                        </div>

                        <div class="form-group col-md-4">
                            <label for="pulsopedioIzquierdo">Pulso Pedio Izquierdo:</label><br> 
                            <input class="form-control" type="number" name="txtPulsoPedioIzquierdo"><br><br>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="podalDerecho">T° Podal Derecho:</label><br> 
                            <input class="form-control" type="number" step="any" name="txtTemperaturaPodalDerecho"><br><br>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="podalIzquierdo">T° Podal Izquierdo:</label><br>
                            <input class="form-control" type="number" step="any" name="txtTemperaturaPodalIzquierdo">
                        </div>

                        <br><br>
                        <div class="form-group col-md-6">
                            <label>Sensibilidad Pie Derecho:</label>
                            <input  type="checkbox" value="true" name="chkSensPieDerecho">
                        </div>

                        <br><br>
                        <div class="form-group col-md-6">
                            <label>Sensibilidad Pie Izquierdo:</label> 
                            <input type="checkbox" value="true" name="chkSensPieIzquierdo">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Curación:</label> 
                            <input type="checkbox" value="true" name="chkCuracion">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Resecado:</label> 
                            <input type="checkbox" value="true" name="chkResecado">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Enucleación:</label> 
                            <input type="checkbox" value="true" name="chkEnucleacion">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Devastado Ungueal:</label> 
                            <input type="checkbox" value="true" name="chkDevastadoUngueal">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Masoterapia o Masaje:</label> 
                            <input type="checkbox" value="true" name="chkMaso">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Espiculoectomía:</label> 
                            <input type="checkbox" value="true" name="chkEspiculoectomia">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Analgesia:</label> 
                            <input type="checkbox" value="true" name="chkAnalgesia">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Colocacion Acrilico:</label> 
                            <input type="checkbox" value="true" name="chkColAcri">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Colocacion Banda Molecular:</label> 
                            <input type="checkbox" value="true" name="chkColBandaMolecular">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Colocacion Puente:</label> 
                            <input type="checkbox" value="true" name="chkColPuente">
                        </div>

                        <div class="form-group col-md-6">
                            <label>Colocacion Policarboxilato:</label>
                            <input type="checkbox" value="true" name="chkColPolicarboxilato">
                        </div>

                        <div class="form-group col-md-3" style="margin-right: 660px;">
                            <label>Tratamiento Ortonixia:</label> 
                            <select name="cboTratamientoOrtonixia" class="custom-select-sm form-control form-control-sm">
                                <%
                                    for (TratamientoOrtonixia to : new Data().getTratamientosOrtonoxia()) {
                                        out.println("<option value='" + to.getId() + "'>" + to.getNombre() + "</option>");
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group col-md-3">
                            <label>Observaciones:</label><br>
                            <textarea class="form-control" rows="2" name="txtObsAtencionPodo"></textarea>
                        </div>


                        <br><br>

                        <center class="form-group col-md-12">
                            <button type="submit" class="btn btn-primary btn-lg" value="RegistrarFicha">Registrar Atención</button>
                        </center>

                    </div>

                </div>
            </form>
        </div>
    </body>
</html>
