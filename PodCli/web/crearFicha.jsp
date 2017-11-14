<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Respuesta"%>
<%@page import="model.bd.Data"%>
<%@page import="model.bd.EstadoCivil"%>
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
        <title>Crear Ficha</title>

        <!--Es para el despliegue de VER en el nav -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <!-- Esto es del calendario JQUERY -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- Esto es del calendario JQUERY -->


        <script>
            $(function () {
                $("#fechaNacimiento").datepicker();
                $("#fechaNacimiento").datepicker({
                    dateFormat: "dd-mm-yy"
                });

                // Getter
                var dateFormat = $("#fechaNacimiento").datepicker("option", "dateFormat");

                // Setter
                $("#fechaNacimiento").datepicker("option", "dateFormat", "dd 'de' MM 'de' yy");
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
    <style>
        .navbar-header{
            
            padding-top: 7px; 
            padding-left: 10px
                
        }
    </style>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top " role="navigation">
            <div class="navbar-header">
                <a href="#" class="navbar-left">
                    <span><img width=80px height=35px src="imagen/ist.jpg"></span>
                </a>
            </div>

            <p class="navbar-text pull-left">PodCli</p>

            <p class="navbar-text">
                <%    if (u != null) {
                        out.println("Usuario Actual: " + u.getNombre());
                        out.println("</p><p class='navbar-text'>Perfil:");
                        Data d = new Data();

                        out.println(d.getPerfil(u.getPerfil()));
                    }
                %>

                <%
                    if (u.getPerfil() == 2 || u.getPerfil() == 3) {
                %>
                <%
                    }
                %></p>



            <ul class="nav navbar-nav navbar-left">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <!-- Redirigir a crear ficha -->

                <!-- Redirigir a reporte de uso -->

                <li class="active"><a href="inicio.jsp">Volver a inicio</a></li>

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
                            <input type="text" class="form-control" placeholder="Buscar" name="txtBuscar" required="">
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
                </li>
            </ul>
        </nav>

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

        <script>
            function punto(e) {
                tecla = (document.all) ? e.keyCode : e.which;
                //alert(tecla);
                if ((tecla >= 48 & tecla <= 57) || tecla === 107 || tecla === 45) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>

        <form action="crearFicha.do" method="post" style="margin-top: 100px" class="form-inline">
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="panel-title"><h4>Antecedentes Personales</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <input type="hidden" name="txtUsuario" value="<%= u.getId()%>"> 

                        <!-- ----------------------------------FICHA CLÍNICA----------------------------------- -->
                        <div id="fichaClinica">

                            <div class="form-group col-md-4">
                                <br>
                                Nombre:<br>
                                <input class="form-control" type="text" name="txtNombre" required="">
                            </div>

                            <div class="col-md-4">
                                <br>
                                Rut:<br>
                                <input class="form-control" type="text" onkeypress="return punto(event)" name="txtRut" maxlength="10" required="">
                            </div>

                            <div class="col-md-4">
                                <br>
                                Fecha de Nacimiento:<br>
                                <input class="form-control" id="fechaNacimiento" name="txtFechaNacimineto" readonly="" required="">
                                <br>
                            </div>

                            <div class="col-md-4">
                                <br>
                                Sexo:
                                <br>
                                <div class="radio">                                
                                    <label>
                                        <input type="radio" name="opSexo" value="m" checked="checked"> Masculino 
                                        <input type="radio" name="opSexo" value="f"> Femenino
                                    </label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <br>
                                Actividad:<br>
                                <input class="form-control" type="text" name="txtActividad">
                                <br>
                            </div>

                            <div class="col-md-4">
                                <br>
                                Estado Civil:<br> 
                                <select class="custom-select-sm form-control form-control-sm" name="cboEstadoCivil">
                                    <%
                                        for (EstadoCivil ec : new Data().getEstadosCiviles()) {
                                            out.println("<option value='" + ec.getId() + "'>" + ec.getNombre() + "</option>");
                                        }
                                    %>
                                </select>  
                                <br>
                            </div>

                            <div class="col-md-4">
                                <br>
                                Domicilio:<br>
                                <textarea class="form-control" name="txtDomicilio" required=""></textarea>
                            </div>



                            <div class="col-md-4">
                                <br>
                                Telefonos:<br>
                                <input class="form-control" type="text" name="txtTelefonos" required="">
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- ----------------------------------FICHA CLÍNICA----------------------------------- -->

            <!-- ---------------------------------- ANTECEDENTES MORBIDOS ----------------------------------- -->
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="panel-title"><h4>Antecedentes Morbidos</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div id="antecedentesMorbidos">

                            <div class="form-group col-md-3">
                                HTA:<br>
                                <select class="custom-select-sm form-control form-control-sm" name="cboHTA">
                                    <%
                                        for (Respuesta r : new Data().getRespuestas()) {
                                            if (r.getId() == 2) {
                                                out.println("<option value='" + r.getId() + "' selected>" + r.getNombre() + "</option>");
                                            } else {
                                                out.println("<option value='" + r.getId() + "'>" + r.getNombre() + "</option>");
                                            }

                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                D.M:<br>
                                <select class="custom-select-sm form-control form-control-sm" name="cboDM">
                                    <%
                                        for (Respuesta r : new Data().getRespuestas()) {
                                            if (r.getId() == 2) {
                                                out.println("<option value='" + r.getId() + "' selected>" + r.getNombre() + "</option>");
                                            } else {
                                                out.println("<option value='" + r.getId() + "'>" + r.getNombre() + "</option>");
                                            }

                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                Tipo:<br>
                                <select class="custom-select-sm form-control form-control-sm" name="cboTipo">
                                    <option class="form-control form-control-sm" value="0">N/A</option>
                                    <option class="form-control form-control-sm" value="1">1</option>
                                    <option class="form-control form-control-sm" value="2">2</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                Años de Evolucion:<br>
                                <input class="form-control form-control-sm" type="number" name="txtAnioEvolucion">
                            </div>    


                            <div class="form-group col-md-3">
                                <br>
                                Paciente mixto:<br>
                                <select class="custom-select-sm form-control form-control-sm" name="cboPcteMixto">
                                    <option class="form-control form-control-sm" value="true">Si</option>
                                    <option class="form-control form-control-sm" value="false" selected>No</option>
                                </select> 
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Control:<br>
                                <select class="custom-select-sm form-control form-control-sm" name="cboControl">
                                    <option class="form-control form-control-sm" value="true">Si</option>
                                    <option class="form-control form-control-sm" value="false" selected>No</option>
                                </select>
                            </div>


                            <div class="form-group col-md-3">
                                <br>
                                Farmacoterapia:<br>
                                <textarea class="form-control" name="txtFarmacoterapia"></textarea>
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Otras Patologías y Farmacoterapia: 
                                <textarea class="form-control" name="txtOtras"></textarea><br>
                            </div>

                            <div class="form-group col-md-3">
                                Alteraciones Ortopédicas: 
                                <textarea class="form-control" name="txtAlter"></textarea>
                            </div>

                            <div class="form-group col-md-3">
                                Habitos Nocivos:<br> 
                                <textarea class="form-control" name="txtHabitosNocivos"></textarea>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- ---------------------------------- ANTECEDENTES MORBIDOS ----------------------------------- -->

            <!-- ---------------------------------- EXAMEN FÍSICO GENERAL ----------------------------------- -->
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="panel-title"><h4>Examen Físico General</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div id="examenFisicoGeneral">

                            <div class="form-group col-md-3">
                                Talla en metros:<br>
                                <input class="form-control" type="number" step="any" name="txtTalla" required=""><br>
                            </div>

                            <div class="form-group col-md-9">
                                IMC:<br>
                                <input class="form-control" type="number" step="any" name="txtIMC" required="">
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Amputación:<br>
                                <select class="custom-select-sm form-control form-control-sm" name="cboAmputacion">
                                    <option class="form-control form-control-sm" value="true">Si</option>
                                    <option class="form-control form-control-sm" value="false" selected>No</option>
                                </select>
                            </div>

                            <div class="form-group col-md-9">
                                <br>
                                Ubicación:<br>
                                <input class="form-control" type="text" name="txtUbicacionAmputacion">
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                N° Calzado:<br> 
                                <input class="form-control" type="number" name="txtNumCalzado" required="">
                            </div>

                            <div class="form-group col-md-9">
                                <br>
                                Varices Extremo Inferior:<br>
                                <select style="width: 68px" class="custom-select-sm form-control form-control-sm" name="cboVaricesExtremoInferior">
                                    <option class="form-control form-control-sm" value="true">Si</option>
                                    <option class="form-control form-control-sm" value="false" selected>No</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Heridas:<br>
                                <select style="width: 68px" class="custom-select-sm form-control form-control-sm" name="cboHeridas">
                                    <option class="form-control form-control-sm" value="true">Si</option>
                                    <option class="form-control form-control-sm" value="false" selected>No</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Ubicación:<br>
                                <input class="form-control" type="text" name="txtUbicacionHeridas">
                            </div>                      

                            <div class="form-group col-md-3">
                                <br>
                                Tipo:<br>
                                <input class="form-control" type="text" name="txtTipoHeridas">
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Tratamiento:<br>
                                <select style="width: 68px" class="custom-select-sm form-control form-control-sm" name="cboTratamiento">
                                    <option class="form-control form-control-sm" value="true">Si</option>
                                    <option class="form-control form-control-sm" value="false" selected>No</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Nevos:<br> 
                                <select style="width: 68px" <%--class="col-md"--%> class="custom-select-sm form-control form-control-sm" name="cboNevos">
                                    <option class="form-control form-control-sm" value="true">Si</option>
                                    <option class="form-control form-control-sm" value="false" selected>No</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Ubicación:<br>
                                <input class="form-control" type="text" name="txtUbicacionNevos">
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Máculas:<br>
                                <select style="width: 68px" class="custom-select-sm form-control form-control-sm" name="cboMaculas">
                                    <option class="form-control form-control-sm" value="true">Si</option>
                                    <option class="form-control form-control-sm" value="false" selected>No</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                <br>
                                Tipo:<br> 
                                <input class="form-control" type="text" name="txtTipoMaculas">
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- ---------------------------------- EXAMEN FÍSICO GENERAL ----------------------------------- -->

            <center>
                <button type="submit" class="btn btn-primary" value="RegistrarFicha">Registrar Ficha</button>
            </center>
            <br><br>
        </form>
    </body>
</html>
