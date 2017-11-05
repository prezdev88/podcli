<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.DatosReporteUso"%>
<%@page import="java.util.List"%>
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
        <title>Reporte Histórico</title>
        <!-- Esto es del calendario JQUERY -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
        <!-- Esto es del calendario JQUERY -->

        <script>
            $(function () {
                $("#fecIni").datepicker();
                $("#fecIni").datepicker({
                    dateFormat: "dd-mm-yy"
                });

                // Getter
                var dateFormat = $("#fecIni").datepicker("option", "dateFormat");

                // Setter
                $("#fecIni").datepicker("option", "dateFormat", "dd 'de' MM 'de' yy");


                $("#fecFin").datepicker();
                $("#fecFin").datepicker({
                    dateFormat: "dd-mm-yy"
                });

                // Getter
                var dateFormat = $("#fecFin").datepicker("option", "dateFormat");

                // Setter
                $("#fecFin").datepicker("option", "dateFormat", "dd 'de' MM 'de' yy");
            });
        </script>

        <script>
            // español
            $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '<Ant',
                nextText: 'Sig>',
                currentText: 'Hoy',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: '',
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0"
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

        </script>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <!-- El logotipo y el icono que despliega el menú se agrupan
                 para mostrarlos mejor en los dispositivos móviles -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#" style="padding-bottom: 50px">
                    <span><img width = 46px alt="Brand" src="http://www.prodx.cl/images/ust.png"></span>
                </a>
            </div>
            <p class="navbar-text pull-left">PodCli</p>

            <ul class="nav navbar-nav navbar-left">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <!-- Redirigir a crear ficha -->
                <li><a href="#">
                        <%    if (u != null) {
                                out.println("Usuario Actual: " + u.getNombre());
                                out.println("<br>Perfil:");
                                Data d = new Data();

                                out.println(d.getPerfil(u.getPerfil()));
                            }
                        %>

                        <%
                            if (u.getPerfil() == 2 || u.getPerfil() == 3) {
                        %>
                        <%
                            }
                        %></a></li>
                <!-- Redirigir a reporte de uso -->
                <li><a href="#">Reporte de uso</a></li>
                <li><a href="inicio.jsp">Volver a inicio</a></li>

            </ul>

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

        <br><br><br><br><br><br>
        <div class="container mt">
            <div class="row justify-content-xl-center">
                <div class="jumbotron">
                    <center>
                        <h1>Reporte histórico</h1>
                        <form action="reporteHistorico.jsp" method="post" class="form-inline">
                            <input class="form-control" id="fecIni" name="fecIni" required="">
                            <input  class="form-control"id="fecFin" name="fecFin" required="">
                            <input type="submit" value="Procesar" name="btnProcesar" class="btn btn-primary">
                            <a href="inicio.jsp" role="button" class="btn btn-primary">Volver</a>
                        </form>

                        <%            if (request.getParameter("btnProcesar") != null) {
                                Data d = new Data();
                                String fecIni = request.getParameter("fecIni");
                                String fecFin = request.getParameter("fecFin");

                                String[] vectFecha = fecIni.split(" de ");
                                String fecIniFormated = vectFecha[2] + "-" + d.getMes(vectFecha[1].toLowerCase()) + "-" + vectFecha[0];

                                vectFecha = fecFin.split(" de ");
                                String fecFinFormated = vectFecha[2] + "-" + d.getMes(vectFecha[1].toLowerCase()) + "-" + vectFecha[0];

                                List<DatosReporteUso> datos = d.getDatosReporteUso(fecIniFormated, fecFinFormated);
                        %>
                        <br>
                        Desde el [ <b><%=fecIni%></b> ] hasta el [ <b><%=fecFin%></b> ]
                    </center>
                    <br><br>
                    <table class="table table-striped">
                        <tr>
                            <th style="width:200px">Rut</th>
                            <th style="width:200px">Nombre</th>
                            <th style="width:200px">Nº Fichas</th>
                            <th style="width:200px">Nº Atenciones</th>
                        </tr>

                        <%for (DatosReporteUso dru : datos) {%>
                        <tr>
                            <td style="width:200px"><%= dru.getRut()%></td>
                            <td style="width:200px"><%= dru.getNombre()%></td>
                            <td style="width:200px"><%= dru.getCantidadFichas()%></td>
                            <td style="width:200px"><%= dru.getCantidadAtencionesPodologicas()%></td>
                        </tr>
                        <%}

                            } // cierre del if%>
                    </table>
                </div>
            </div> 
        </div> 
    </body>
</html>
