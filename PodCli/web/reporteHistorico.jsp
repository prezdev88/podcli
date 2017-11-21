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
        </style>
    </head>
    <body>
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

                <li class="active"><a href="reporteHistorico.jsp">Reporte Histórico</a></li>
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
        <br>
        <br>
        <br>

        <div class="container">
            <div class="jumbotron" style="border-radius: 10px 10px 10px 10px">
                <div class="container">
                    <center>
                        <h1>Reporte histórico</h1>
                        <form action="reporteHistorico.jsp" method="post" class="form-inline">
                            <input class="form-control" id="fecIni" name="fecIni" required="" readonly="">
                            <input  class="form-control"id="fecFin" name="fecFin" required="" readonly="">
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
