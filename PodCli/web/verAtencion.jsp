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

        <div>
            <h1><%= p.getNombre()%></h1>
            <h2>Atención podológica</h2>
            <h4><%= Data.getFormattedDate(a.getFecha(), true)%></h4>
        </div>
        <div>

            Presión Arterial:           <input type="number" step="any" value="<%= a.getPresion()%>" name="presion" readonly><br>
            Pulso Radial:               <input type="number" value="<%= a.getPulsoRadial()%>" name="pulso" readonly><br>
            Peso:                       <input type="number" step="any" value="<%= a.getPeso()%>" name="peso" readonly><br>
            Pulso Pedio Derecho:        <input type="number" name="ppd" value="<%= a.getPulsoPedio_d()%>" readonly><br>
            Pulso Pedio Izquierdo:      <input type="number" name="ppi" value="<%= a.getPulsoPedio_i()%>" readonly><br>
            Sensibilidad Pie Derecho:   <input value="<%=(a.isSens_d() ? "Si" : "No")%>" readonly> <br>   
            Sensibilidad Pie Izquierdo: <input value="<%=(a.isSens_i() ? "Si" : "No")%>" readonly> <br>
            T° Podal Derecho:           <input type="number" step="any" value="<%= a.gettPoda1_d()%>" name="tpd" readonly><br>
            T° Podal Izquierdo:         <input type="number" step="any" value="<%= a.gettPoda1_i()%>" name="tpi" readonly><br>
            Curación:                   <input value="<%=(a.isCuracion() ? "Si" : "No")%>" readonly> <br>                  
            Resecado:                   <input value="<%=(a.isResecado() ? "Si" : "No")%>" readonly> <br>                 
            Enucleación:                <input value="<%=(a.isEnucleacion() ? "Si" : "No")%>" readonly> <br>             
            Devastado Ungueal:          <input value="<%=(a.isDevastado() ? "Si" : "No")%>" readonly> <br>         
            Masoterapia o Masaje:       <input value="<%=(a.isMaso() ? "Si" : "No")%>" readonly> <br>     
            Espiculoectomía:            <input value="<%=(a.isEspiculoectomia() ? "Si" : "No")%>" readonly> <br>          
            Analgesia:                  <input value="<%=(a.isAnalgesia() ? "Si" : "No")%>" readonly> <br>        
            Colocacion Acrilico:        <input value="<%=(a.isColocacionAcrilico() ? "Si" : "No")%>" readonly> <br>     
            Colocacion Banda Molecular: <input value="<%=(a.isBandaMolecular() ? "Si" : "No")%>" readonly> <br>
            Colocacion Puente:          <input value="<%=(a.isColocacionPuente() ? "Si" : "No")%>" readonly> <br>       
            Tratamiento Ortonixia:      <input type="text" readonly value="<%=a.getTratamientoOrtonixia()%>"><br>
            Colocacion Policarboxilato: <input value="<%=(a.isPoli() ? "Si" : "No")%>"readonly> <br>
            Observaciones:              <textarea name="obs" readonly><%= a.getObservaciones()%></textarea>
        </div>

        <%%>
        <form action="historicoAtencion.jsp" method="post">
            <input type="hidden" name="idPaciente" value="<%=idPaciente%>">
            <input type="submit" value="Volver">
        </form>
    </body>
</html>
