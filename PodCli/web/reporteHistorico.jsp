<%@page import="model.bd.CantidadAtencion"%>
<%@page import="model.bd.Rango"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
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


        <%            Data d = new Data();
            String fecIni = null, fecFin = null;
            List<CantidadAtencion> cantidadAtenciones = null;
        %>

        <!-- Google charts -->
        <script type="text/javascript" src="js/loader.js"></script>

        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                /*Gráfico de sexo*/
                var hombres, mujeres;
                hombres = document.getElementById("hombres").innerHTML;
                mujeres = document.getElementById("mujeres").innerHTML;

                /*alert(hombres);
                 alert(mujeres);*/

                var data = google.visualization.arrayToDataTable([
                    ['Item', 'Cantidad'],
                    ['Hombres', parseInt(hombres)],
                    ['Mujeres', parseInt(mujeres)]
                ]);

                var options = {
                    title: 'Gráfico de atenciones por sexo'
                };

                var chart = new google.visualization.PieChart(document.getElementById('sexoChart'));

                chart.draw(data, options);
                /*Gráfico de sexo*/



                /*Gráfico de rangos etáreos*/
                var cant_0, cant_1, cant_2, cant_3;
                cant_0 = document.getElementById("cant_0").innerHTML;
                cant_1 = document.getElementById("cant_1").innerHTML;
                cant_2 = document.getElementById("cant_2").innerHTML;
                cant_3 = document.getElementById("cant_3").innerHTML;

                /*alert(hombres);
                 alert(mujeres);*/

                data = google.visualization.arrayToDataTable([
                    ['Rango de edad', 'Cantidad'],
                    ['[0-30[', parseInt(cant_0)],
                    ['[30-50[', parseInt(cant_1)],
                    ['[50-70[', parseInt(cant_2)],
                    ['>70', parseInt(cant_3)]
                ]);

                var options = {
                    title: 'Gráfico de atenciones por grupo etáreo'
                };

                var chart = new google.visualization.PieChart(document.getElementById('rangosChart'));

                chart.draw(data, options);
                /*Gráfico de rangos etáreos*/







                /*Gráfico de uso*/
            <%if (request.getParameter("semestreUso") != null) {%>
            <%
                        String semestre = request.getParameter("semestreUso");
                        String anio = request.getParameter("anioUso");

                        if (semestre.equals("1")) {
                            fecIni = anio + "-01-01";
                            fecFin = anio + "-07-31";
                        } else {
                            fecIni = anio + "-08-01";
                            fecFin = anio + "-12-31";
                        }

            %>
                data = google.visualization.arrayToDataTable([
                    ['Nombre', 'Cantidad'],
            <%                            cantidadAtenciones = d.getCantidadDeAtenciones(fecIni, fecFin);

                            int index = 0;
                            for (CantidadAtencion ca : cantidadAtenciones) {
                                out.println("['" + ca.getNombre() + "', " + ca.getCantidad() + "]");
                                index++;
                                if (index != cantidadAtenciones.size()) {
                                    out.print(",");
                                }
                            }
            %>
                ]);

                var options = {
                    title: 'Gráfico de atenciones podológicas'
                };

                var chart = new google.visualization.PieChart(document.getElementById('atencionesChart'));

                chart.draw(data, options);
            <%}%>


                /*Gráfico de uso*/
            }
        </script>
        <!-- Google charts -->






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

        <br><br><br>
        <div class="container">

            <h1>Reportes</h1>


            <div class="col-md-6">
                <h4>Pacientes por sexo</h4>
                <table class="table table-striped">
                    <tr>
                        <th>Item</th>
                        <th>Cantidad</th>
                    </tr>
                    <tr>
                        <td>Hombres:</td>
                        <td id="hombres"><%= d.getCantidad("m")%></td>
                    </tr>
                    <tr>
                        <td>Mujeres:</td>
                        <td id="mujeres"><%= d.getCantidad("f")%></td>
                    </tr>
                </table>
            </div>

            <div class="col-md-6">
                <div  id="sexoChart" style="width: 500px; height: 250px;"></div>
            </div>

            <div class="col-md-6">
                <h4>Pacientes por grupo etáreo</h4>
                <table class="table table-striped">
                    <tr>
                        <th>Rango de edad</th>
                        <th>Cantidad</th>
                    </tr>
                    <%
                        int i = 0;
                        for (Rango r : d.getGrupoEtario()) {
                            out.println("<tr>");
                            out.println("<td>" + r.getRango() + "</td>");
                            out.println("<td id='cant_" + i + "'>" + r.getCantidad() + "</td>");
                            out.println("</tr>");

                            i++;
                        }
                    %>
                </table>
            </div>
            <div class="col-md-6">
                <div id="rangosChart" style="width: 500px; height: 250px;"></div>
            </div>

            <form action="reporteAtencionAlumnos.jsp">
                <input value="Reporte de atenciones" type="submit" class="btn btn-success">
            </form>
        </div>
    </body>
</html>
