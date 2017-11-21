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

            <%@include file="modules/actualUser.jsp" %>

            <ul class="nav navbar-nav navbar-left">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <!-- Redirigir a crear ficha -->
                <li class="active"><a href="crearFicha.jsp">Crear Ficha</a></li>

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

            function buscarPaciente() {
                var rut = $("#txtRut").val();
                $.ajax({
                    url: "buscarPaciente.do",
                    data: {
                        rut: rut
                    },
                    success: function (result) {
                        $("#resultado").html(result);
                    }
                });
            }
        </script>

        <div class="container">

            <form action="crearFicha.do" method="post" style="margin-top: 100px">

                <%                    if (request.getParameter("m") != null) {
                        int m = Integer.parseInt(request.getParameter("m"));
                        switch (m) {
                            case 1:
                                out.println("<div class='alert alert-success'>Paciente creado!</div>");
                                break;
                            case 2:
                                out.println("<div class='alert alert-danger'>ERROR: Seleccione fecha!</div>");
                                break;
                        }
                    }
                %>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <span class="panel-title">
                            Antecedentes Personales
                        </span>
                        <span id="resultado"></span>
                    </div>
                    <div class="panel-body">
                        <input type="hidden" name="txtUsuario" value="<%= u.getId()%>"> 

                        <!-- ----------------------------------FICHA CLÍNICA----------------------------------- -->
                        <div id="fichaClinica">
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="txtRut">Rut:</label><span class="text-danger">*</span>
                                    <input class="form-control" type="text" onkeypress="return punto(event)" onkeyup="buscarPaciente()" name="txtRut" id="txtRut" maxlength="10" required="">
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="txtNombre">Nombre:</label><span class="text-danger">*</span>
                                    <input class="form-control" type="text" name="txtNombre" required="">
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="txtFechaNacimineto">Fecha de Nacimiento:</label><span class="text-danger">*</span>
                                    <input class="form-control" id="fechaNacimiento" name="txtFechaNacimineto" readonly="" required="required">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="opSexo">Sexo:</label><span class="text-danger">*</span>
                                    <select class="form-control" name="opSexo">
                                        <option value="m">Masculino</option>
                                        <option value="f">Femenino</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="txtActividad">Actividad:</label>
                                    <input class="form-control" type="text" name="txtActividad">
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="cboEstadoCivil">Estado Civil:</label><span class="text-danger">*</span>
                                    <select class="form-control" name="cboEstadoCivil">
                                        <%
                                            for (EstadoCivil ec : new Data().getEstadosCiviles()) {
                                                out.println("<option value='" + ec.getId() + "'>" + ec.getNombre() + "</option>");
                                            }
                                        %>
                                    </select>  
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group  col-md-6">
                                    <label for="txtDomicilio">Domicilio:</label><span class="text-danger">*</span>
                                    <textarea class="form-control" name="txtDomicilio" required=""></textarea>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="txtTelefonos">Telefonos:</label><span class="text-danger">*</span>
                                    <textarea class="form-control" type="text" name="txtTelefonos" required=""></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ----------------------------------FICHA CLÍNICA----------------------------------- -->

                <!-- ---------------------------------- ANTECEDENTES MORBIDOS ----------------------------------- -->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="panel-title">
                            Antecedentes Morbidos
                        </div>
                    </div>
                    <div class="panel-body">
                        <div id="antecedentesMorbidos">

                            <div class="row">
                                <div class="form-group col-md-3">
                                    <label for="cboHTA">HTA:</label>
                                    <select class="form-control" name="cboHTA">
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
                                    <label>D.M:</label>
                                    <select class="form-control" name="cboDM">
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
                                    <label for="cboTipo">Tipo:</label>
                                    <select class="form-control" name="cboTipo">
                                        <option value="0">N/A</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="txtAnioEvolucion">Años de Evolucion:</label>
                                    <input class="form-control" type="number" name="txtAnioEvolucion">
                                </div>  
                            </div>




                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Paciente mixto:</label>
                                    <select class="form-control" name="cboPcteMixto">
                                        <option value="true">Si</option>
                                        <option value="false" selected>No</option>
                                    </select> 
                                </div>

                                <div class="form-group col-md-6">
                                    <label>Control:</label>
                                    <select class="form-control" name="cboControl">
                                        <option value="true">Si</option>
                                        <option value="false" selected>No</option>
                                    </select>
                                </div>
                            </div>


                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Farmacoterapia:</label>
                                    <textarea class="form-control" name="txtFarmacoterapia"></textarea>
                                </div>

                                <div class="form-group col-md-6">
                                    <label>Otras Patologías y Farmacoterapia:</label>
                                    <textarea class="form-control" name="txtOtras"></textarea><br>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Alteraciones Ortopédicas:</label>
                                    <textarea class="form-control" name="txtAlter"></textarea>
                                </div>

                                <div class="form-group col-md-6">
                                    <label>Habitos Nocivos:</label>
                                    <textarea class="form-control" name="txtHabitosNocivos"></textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- ---------------------------------- ANTECEDENTES MORBIDOS ----------------------------------- -->

                <!-- ---------------------------------- EXAMEN FÍSICO GENERAL ----------------------------------- -->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="panel-title"><h4>Examen Físico General</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div id="examenFisicoGeneral">

                            <div class="form-group col-md-3">
                                Talla en metros:<span class="text-danger">*</span><br>
                                <input class="form-control" type="number" step="any" name="txtTalla" required=""><br>
                            </div>

                            <div class="form-group col-md-9">
                                IMC:<span class="text-danger">*</span><br>
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
                                N° Calzado:<span class="text-danger">*</span><br> 
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
                <!-- ---------------------------------- EXAMEN FÍSICO GENERAL ----------------------------------- -->

                <center>
                    <button type="submit" class="btn btn-primary" value="RegistrarFicha">Registrar Ficha</button>
                </center>
                <br><br>
            </form>
        </div>
    </body>
</html>
