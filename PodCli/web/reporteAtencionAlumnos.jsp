<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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


        <%                
            Data d = new Data();
            String fecIni = null, fecFin = null;
            List<CantidadAtencion> cantidadAtenciones = null;
        %>

        <!-- Google charts -->
        <script type="text/javascript" src="js/loader.js"></script>

        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                /*Gráfico de uso*/
                <%if(request.getParameter("semestreUso") != null){%>
                    <%
                    String semestre = request.getParameter("semestreUso");
                    String anio = request.getParameter("anioUso");
                    
                    if(semestre.equals("1")){
                        fecIni = anio+"-01-01";
                        fecFin = anio+"-07-31";
                    }else{
                        fecIni = anio+"-08-01";
                        fecFin = anio+"-12-31";
                    }   

                    %>
                    data = google.visualization.arrayToDataTable([
                        ['Nombre', 'Cantidad'],
                        <%

                        cantidadAtenciones = d.getCantidadDeAtenciones(fecIni, fecFin);

                        int index=0;
                        for (CantidadAtencion ca : cantidadAtenciones) {
                            out.println("['"+ca.getNombre()+"', "+ca.getCantidad()+"]");
                            index++;
                            if(index != cantidadAtenciones.size()){
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
            <h3>Historial de atenciones podológicas</h3>

            <div class="col-md-6">
                <form action="reporteAtencionAlumnos.jsp" method="post">
                    <div class="col-md-4">
                        
                        <%
                        int semesUsu = -1;
                        if(request.getParameter("semestreUso") != null){
                            semesUsu = Integer.parseInt(request.getParameter("semestreUso"));
                        }
                        %>
                        
                        <select class="form-control" name="semestreUso">
                            <option value="1" <%=(semesUsu != -1?(semesUsu == 1?"selected":""):"")%>>1er Semestre</option>
                            <option value="2" <%=(semesUsu != -1?(semesUsu == 2?"selected":""):"")%>>2do Semestre</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <select name="anioUso" class="form-control">
                            <%
                            int anioUsu = -1;
                            if(request.getParameter("semestreUso") != null){
                                anioUsu = Integer.parseInt(request.getParameter("anioUso"));
                            }
                            for (int anio = 2018; anio < 2101; anio++) {
                                out.println("<option value='"+anio+"' "+(anioUsu != -1?(anio == anioUsu?"selected":""):"")+">"+anio+"</option>");
                            }
                            %>
                        </select>
                    </div>
                    
                    <div class="col-md-4">
                        <input class="btn btn-primary" type="submit" value="Ver reporte">
                    </div>
                    
                </form>
                
                        <style>
                            #rango{
                                text-align: center;
                                padding-top: 20px;
                                padding-bottom: 20px;
                            }
                        </style>
                        
                    <%if(request.getParameter("semestreUso") != null){%>
                    
                        <%
                        SimpleDateFormat f = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy");
                        SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd");
                        
                        out.println("<div id='rango' class='col-md-12'>");
                        out.println("Del <b>"+f.format(f2.parse(fecIni))+"</b> al <b>"+f.format(f2.parse(fecFin))+"</b>");
                        out.println("</div>");
                        %>
                        <table class="table table-striped">
                            <tr>
                                <th>Rut</th>
                                <th>Nombre</th>
                                <th>Atenciones</th>
                            </tr>

                            <%
                            for (CantidadAtencion ca : cantidadAtenciones) {
                                out.println("<tr>");
                                    out.println("<td>"+ca.getRut()+"</td>");
                                    out.println("<td><a href='reporteDetalleAlumno.jsp?id="+ca.getId()+"'>"+ca.getNombre()+"</a></td>");
                                    out.println("<td>"+ca.getCantidad()+"</td>");
                                out.println("</tr>");
                            }
                            %>
                        </table>
                    <%}%>
            </div>
            <div class="col-md-6">
                <div id="atencionesChart" style="width: 500px; height: 350px;"></div>
            </div>
        </div>
    </body>
</html>
