<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.TratamientoOrtonixia"%>
<%@page import="model.bd.AtencionPodologicaSelect"%>
<%@page import="model.bd.Data"%>
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
        <script type="text/javascript"> history.forward();</script>  <!--No permite volver si no se ha iniciado sesion-->

        <title>Ver atención</title>
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
                        </a></li>
                    <!-- Redirigir a reporte de uso -->
                    <li><a href="inicio.jsp">Volver a inicio</a></li>
                </ul>

                <!-- Falta redirigir a donde se muestran los resultados de la busqueda -->
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
                                <input type="text" class="form-control" placeholder="Buscar" required="">
                            </div>
                            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        </form>
                    </li>
                </ul>
            </nav>
        </div>

        <%            Data d = new Data();

            String idAtencionPod = request.getParameter("idAntPod");
            String idPaciente = request.getParameter("idPaciente");

            AtencionPodologicaSelect a = d.getAtencionPodologicaBy(idAtencionPod);
            Paciente p = d.getPaciente(idPaciente);
        %>

        <div class="container" style="margin-top: 100px">
            <form action="registrarAtencion.do" method="post">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h1><%= p.getNombre()%></h1>
                        <h2>Atención podológica</h2>
                        <h4><%= Data.getFormattedDate(a.getFecha(), true)%></h4>
                    </div>
                    <div class="panel-body">

                        <div class="form-group col-md-3">
                            <label for="presionArterial">Presión Arterial:</label><br>
                            <input class="form-control" type="number" step="any" value="<%= a.getPresion()%>" name="presion" readonly>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="pulsoRadial">Pulso Radial:</label><br> 
                            <input class="form-control" type="number"  value="<%= a.getPulsoRadial()%>" name="pulso" readonly>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="peso">Peso:</label><br> 
                            <input class="form-control" type="number" value="<%= a.getPeso()%>" step="any" name="peso" readonly><br><br>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="pulsopedioDerecho">Pulso Pedio Derecho:</label><br> 
                            <input class="form-control" type="number" value="<%= a.getPulsoPedio_d()%>" step="any" name="ppd" readonly>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="pulsopedioIzquierdo">Pulso Pedio Izquierdo:</label><br> 
                            <input class="form-control" type="number" value="<%= a.getPulsoPedio_i()%>" name="ppi" readonly><br><br>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="podalDerecho">T° Podal Derecho:</label><br> 
                            <input class="form-control" type="number" value="<%= a.gettPoda1_d()%>" step="any" name="tpd" readonly><br><br>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="podalIzquierdo">T° Podal Izquierdo:</label><br>
                            <input class="form-control" type="number" value="<%= a.gettPoda1_i()%>" step="any" name="tpi" readonly>
                        </div>

                        <br><br>
                        <div class="form-group col-md-6">
                            <label>Sensibilidad Pie Derecho:</label>
                            <input  type="checkbox" value="<%=(a.isSens_d() ? "Si" : "No")%>" value="true" readonly >
                        </div>

                        <br><br>
                        <div class="form-group col-md-6">
                            <label>Sensibilidad Pie Izquierdo:</label> 
                            <input value="<%=(a.isSens_i() ? "Si" : "No")%>" type="checkbox" value="true"  readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Curación:</label> 
                            <input type="checkbox" value="<%=(a.isCuracion() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Resecado:</label> 
                            <input type="checkbox" value="<%=(a.isResecado() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Enucleación:</label> 
                            <input type="checkbox" value="<%=(a.isEnucleacion() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Devastado Ungueal:</label> 
                            <input type="checkbox" value="<%=(a.isDevastado() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Masoterapia o Masaje:</label> 
                            <input type="checkbox"  value="<%=(a.isMaso() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Espiculoectomía:</label> 
                            <input type="checkbox" value="<%=(a.isEspiculoectomia() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Analgesia:</label> 
                            <input type="checkbox" value="<%=(a.isAnalgesia() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Colocacion Acrilico:</label> 
                            <input type="checkbox" value="<%=(a.isColocacionAcrilico() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Colocacion Banda Molecular:</label> 
                            <input type="checkbox" value="<%=(a.isBandaMolecular() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Colocacion Puente:</label> 
                            <input type="checkbox" value="<%=(a.isColocacionPuente() ? "Si" : "No")%>" value="true" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label>Colocacion Policarboxilato:</label>
                            <input type="checkbox" value="<%=(a.isPoli() ? "Si" : "No")%>" value="true" readonly="readonly">
                        </div>

                        <div class="form-group col-md-3" style="margin-right: 660px;">
                            <label>Tratamiento Ortonixia:</label> 
                            <select class="custom-select-sm form-control form-control-sm" value="<%=a.getTratamientoOrtonixia()%>" readonly >
                               
                            </select>
                        </div>

                        <div class="form-group col-md-3">
                            <label>Observaciones:</label><br>
                            <textarea class="form-control" rows="2" name="obs" readonly><%= a.getObservaciones()%></textarea>
                        </div>


                        <br><br>
                    </div>

                </div>
            </form>
        </div>

        <%%>
        <form action="historicoAtencion.jsp" method="post">
            <input type="hidden" name="idPaciente" value="<%=idPaciente%>">
            <input type="submit" value="Volver">
        </form>
    </body>
</html>
