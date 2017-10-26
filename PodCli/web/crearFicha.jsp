<%-- 
    Document   : crearPaciente
    Created on : 24-oct-2017, 14:12:35
    Author     : Edunaldo
--%>

<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Respuesta"%>
<%@page import="model.bd.Data"%>
<%@page import="model.bd.EstadoCivil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    Usuario u = (Usuario) request.getSession().getAttribute("usuario");

    if (u == null) {
        request.getSession().setAttribute("error", new Error("Debe Ingresar Rut"));
        response.sendRedirect("index.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
        <script src="jquery.ui.datepicker-es.js"></script>
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
                yearSuffix: ''
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

        </script>

        <title>Crear Ficha</title>
    </head>
    <body>
        <div class="container">
            <div>
                <%if (u != null) {%>
                Usuario Actual:<%=u.getNombre()%><br>
                Perfil: <%
                    Data d = new Data();

                    out.println(d.getPerfil(u.getPerfil()));
                %>
                <%}%> 

                <a href="buscarPaciente.jsp"> Buscar Pacientes </a>

                <!-- OJO AL MOVER ESTO, porque no puede haber un formulario dentro de otro-->
                <form action="cerrar.do" method="post">
                    <input type="submit" value="Cerrar Sesion">
                </form>
            </div>
            <form action="crearFicha.do" method="post" class="form-inline">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h5 class="panel-title">Crear Ficha</h5>

                        <h1>Ficha Clinica</h1><br>

                        

                        <div class="container">
                            <form action="crearFicha.do" method="post" class="col-12" class="center">
                                <input type="hidden" name="txtUsuario" value="<%= u.getId()%>">
                                <div class="row  justify-content-xl-center">

                                    <div class="panel-body">

                                        <div  class="form-group">
                                            <div>

                                                <div class="panel-heading">
                                                    <h3>Antecedentes Personales</h3>
                                                </div>
                                                <div class="panel-body">

                                                    <!--<h3 class="page-header" >Antecedentes Personales</h3><br>-->

                                                    <div class="form-group col-md-4">
                                                        <label for="nombre" style=" margin-left: -131px;">Nombre:</label>
                                                        <input class="form-control" type="text" name="txtNombre" >
                                                    </div>

                                                    <div class="form-group col-md-4">
                                                        <label for="nombre" style=" margin-left: -143px;" >Rut:</label>
                                                        <input class="form-control" type="text" name="txtRut">
                                                    </div>


                                                    <div class="form-group col-md-4">
                                                        <label for="nombre" style=" margin-left: -131px;">Fecha de Nacimiento:</label> 
                                                        <input class="form-control" type="date"  id="fechaNacimiento"name="txtFechaNacimineto">
                                                    </div>

                                                    <div class="form-group col-md-4">
                                                        <label for="nombre" style=" margin-left: -140px;">Sexo:</label>
                                                        <input type="radio" name="opSexo" value="m">Masculino
                                                        <input type="radio" name="opSexo" value="f">Femenino
                                                    </div>

                                                    <div class="form-group col-md-4">
                                                        <label for="nombre" style=" margin-left: -131px;">Estado Civil:</label>  <!-- LLenar este comboBox con estados civiles -->
                                                        <select class="custom-select-sm form-control form-control-sm" name="cboEstadoCivil">
                                                            <%
                                                                for (EstadoCivil ec : new Data().getEstadosCiviles()) {
                                                                    out.println("<option value='" + ec.getId() + "'>" + ec.getNombre() + "</option>");
                                                                }
                                                            %>
                                                        </select> 
                                                    </div>

                                                    <div class="form-group col-md-4">
                                                        <label for="nombre" style=" margin-left: -131px;">Actividad:</label> 
                                                        <input class="form-control" type="text" name="txtActividad">
                                                    </div>
                                                    <br>
                                                    <div class="form-group col-md-4">
                                                        <label for="nombre" style=" margin-left: -131px;">Telefonos:</label>  
                                                        <input class="form-control" type="text" name="txtTelefonos">
                                                    </div>

                                                    <div class="form-group col-md-4">
                                                        <label for="nombre" style=" margin-left: -131px;">Domicilio:</label>
                                                        <textarea class="form-control" name="txtDomicilio"></textarea><br><br>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <br><br>

                                        <div class="form-group">
                                            <div>
                                                <div class="panel-heading">
                                                    <h3>Antecedetes Morbidos</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <!-- LLenar este comboBox con tablas respuesta desde la BD -->
                                                    HTA: <select class="custom-select-sm form-control form-control-sm" name="cboHTA">
                                                        <%
                                                        for (Respuesta r : new Data().getRespuestas()) {
                                                            out.println("<option value='" + r.getId() + "'>" + r.getNombre() + "</option>");
                                                        }
                                                    %>
                                                    </select>
                                                    <!-- LLenar este comboBox con tablas respuesta desde la BD -->
                                                    D.M: <select class="custom-select-sm form-control form-control-sm" name="cboDM">
                                                        <%
                                                        for (Respuesta r : new Data().getRespuestas()) {
                                                            out.println("<option value='" + r.getId() + "'>" + r.getNombre() + "</option>");
                                                        }
                                                    %>
                                                    </select>
                                                    Tipo:   
                                                    <select  style="width: 65px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboTipo">
                                                        <option  style="border-radius: 20px" class="form-control form-control-sm" value="0"></option>
                                                        <option  style="border-radius: 20px" class="form-control form-control-sm" value="1">1</option>
                                                        <option  style="border-radius: 20px" class="form-control form-control-sm" value="2">2</option>
                                                    </select>
                                                    Años Evolución: <input class="form-control form-control-sm" type="number" name="txtAnioEvolucion">
                                                    Paciente Mixto:
                                                    <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboPcteMixto">
                                                        <option class="form-control form-control-sm" value="true">Si</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>
                                                    Control:
                                                    <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboControl">
                                                        <option class="form-control form-control-sm" value="true">SI</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>
                                                    <br><br>
                                                    Farmacoterapia: <textarea class="form-control" name="txtFarmacoterapia"></textarea>
                                                    Otras Patologías y Farmacoterapia: <textarea class="form-control" name="txtOtrasPatologíasYFarmacoterapia"></textarea><br><br>
                                                    Alteraciones Ortopédicas: <textarea class="form-control" name="txtAlteracionesOrtopédicas"></textarea>
                                                    Habitos Nocivos: <textarea class="form-control" name="txtHabitosNocivos"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <br><br>

                                        <div class="form-group">
                                            <div>

                                                <div class="panel-heading">
                                                    <h3>Antecedetes Morbidos</h3>
                                                </div>
                                                <div class="panel-body">
                                                    Talla: <input class="form-control" type="number" step="any" name="txtTalla">metros
                                                    IMC: <input class="form-control" type="number" step="any" name="txtIMC">
                                                    Amputación: 
                                                    <select style="width: 65px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboAmputacion">
                                                        <option class="form-control form-control-sm" value="true">SI</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>

                                                    <h3>Examen Fisicos General</h3>
                                                    Talla en metros: <input class="form-control" type="number" step="any" name="txtTalla">
                                                    IMC: <input class="form-control" type="number" step="any" name="txtIMC">
                                                    Amputación: 
                                                    <select class="custom-select-sm form-control form-control-sm" name="cboAmputacion">
                                                        <option class="form-control form-control-sm" value="true">SI</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>

                                                    Ubicación: <input class="form-control" type="text" name="txtUbicacionAmputacion">


                                                    Ubicación: <input class="form-control" type="text" name="txtUbicacionAmputacion">
                                                    <br><br>
                                                    N° Calzado: <input class="form-control" type="number" name="txtNumCalzado">

                                                    Varices Extremo Inferior: 
                                                    <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboVaricesExtremoInferior">
                                                        <option class="form-control form-control-sm" value="true">SI</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>

                                                    Heridas:
                                                    <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboHeridas">
                                                        <option class="form-control form-control-sm" value="true">SI</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>

                                                    Ubicación: <input class="form-control" type="text" name="txtUbicacionHeridas">
                                                    <br><br>
                                                    Tipo: <input class="form-control" type="text" name="txtTipoHeridas">
                                                    Tratamiento:
                                                    <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboTratamiento">
                                                        <option class="form-control form-control-sm" value="true">SI</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>

                                                    Nevos: 
                                                    <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboNevos">
                                                        <option class="form-control form-control-sm" value="true">SI</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>

                                                    Ubicación: <input class="form-control" type="text" name="txtUbicacionNevos">


                                                    Máculas:
                                                    <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboMaculas">
                                                        <option class="form-control form-control-sm" value="true">SI</option>
                                                        <option class="form-control form-control-sm" value="false">No</option>
                                                    </select>
                                                    <br><br>

                                                    Tipo: <input class="form-control" type="text" name="txtTipoMaculas">
                                                </div> 

                                                Máculas:
                                                <select class="custom-select-sm form-control form-control-sm" name="cboMaculas">
                                                    <option class="form-control form-control-sm" value="true">SI</option>
                                                    <option class="form-control form-control-sm" value="false">No</option>
                                                </select>

                                                Tipo: <input class="form-control" type="text" name="txtTipoMaculas">



                                            </div>

                                        </div>

                                        <br><br>  

                                        <div class="row  justify-content-xl-center">
                                            <br><br>
                                            <input style="border:15px" class="btn btn-outline-primary" type="submit" value="Registrar Ficha">
                                        </div>
                                        <br><br> 

                                    </div>
                                </div>
                            </form>
                        </div>


                        <script src="js/jquery.js"></script>
                        <script src="js/bootstrap.min.js"></script>
                        </body>
                        </html>
