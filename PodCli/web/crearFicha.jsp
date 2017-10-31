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
        <title>Crear Ficha</title>
        
        
        
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
                yearSuffix: ''
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

        </script>
        
    </head>
    <body>
        
        <div>
            <%
                if (u != null) {
                    out.println("Usuario Actual: " + u.getNombre());
                    out.println("<br>Perfil:");
                    Data d = new Data();

                    out.println(d.getPerfil(u.getPerfil()));
                }
            %>
            <br><a href="buscarPaciente.jsp"> Buscar Pacientes </a>
            <br><a href="cerrar.do">Cerrar sesión</a>
        </div>
            
            
            
        <form action="crearFicha.do" method="post" class="form-inline">
            
            <!-- ----------------------------------FICHA CLÍNICA----------------------------------- -->
            <div id="fichaClinica">
                <h1>Ficha Clinica</h1><br>

                <input type="hidden" name="txtUsuario" value="<%= u.getId()%>"> 
                <!-- HACER PRUEBAS DE DATEPICKER!!!!!! -->
                <h2>Antecedentes Personales</h2>
                Nombre: <input class="form-control" type="text" name="txtNombre">
                <input type="radio" name="opSexo" value="m" checked="checked">Masculino
                <input type="radio" name="opSexo" value="f">Femenino
                Fecha Nacimiento: <input class="form-control" id="fechaNacimiento" name="txtFechaNacimineto">
                Domicilio: <textarea class="form-control" name="txtDomicilio"></textarea>
                Rut: <input class="form-control" type="text" name="txtRut">
                <!-- LLenar este comboBox con estados civiles -->
                Estado Civil: 
                <select class="custom-select-sm form-control form-control-sm" name="cboEstadoCivil">
                    <%
                        for (EstadoCivil ec : new Data().getEstadosCiviles()) {
                            out.println("<option value='" + ec.getId() + "'>" + ec.getNombre() + "</option>");
                        }
                    %>
                </select> 
                Actividad: <input class="form-control" type="text" name="txtActividad">
                Telefonos:  <input class="form-control" type="text" name="txtTelefonos">
            </div>
            <!-- ----------------------------------FICHA CLÍNICA----------------------------------- -->



            
            
            
            
            
            
            
            <!-- ---------------------------------- ANTECEDENTES MORBIDOS ----------------------------------- -->
            <div id="antecedentesMorbidos">
                <h2>Antecedentes Morbidos</h2>
                HTA: <select class="custom-select-sm form-control form-control-sm" name="cboHTA">
                    <%
                        for (Respuesta r : new Data().getRespuestas()) {
                            if(r.getId() == 2){
                                out.println("<option value='" + r.getId() + "' selected>" + r.getNombre() + "</option>");
                            }else{
                                out.println("<option value='" + r.getId() + "'>" + r.getNombre() + "</option>");
                            }
                            
                        }
                    %>
                </select>
                <!-- LLenar este comboBox con tablas respuesta desde la BD -->
                D.M: <select class="custom-select-sm form-control form-control-sm" name="cboDM">
                    <%
                        for (Respuesta r : new Data().getRespuestas()) {
                            if(r.getId() == 2){
                                out.println("<option value='" + r.getId() + "' selected>" + r.getNombre() + "</option>");
                            }else{
                                out.println("<option value='" + r.getId() + "'>" + r.getNombre() + "</option>");
                            }
                            
                        }
                    %>
                </select>
                Tipo:   
                <select  class="col-md" class="custom-select-sm form-control form-control-sm" name="cboTipo">
                    <option class="form-control form-control-sm" value="0">N/A</option>
                    <option class="form-control form-control-sm" value="1">1</option>
                    <option class="form-control form-control-sm" value="2">2</option>
                </select>
                Años Evolución: <input class="form-control form-control-sm" type="number" name="txtAnioEvolucion">
                Paciente Mixto:
                <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboPcteMixto">
                    <option class="form-control form-control-sm" value="true">Si</option>
                    <option class="form-control form-control-sm" value="false" selected>No</option>
                </select>
                Control:
                <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboControl">
                    <option class="form-control form-control-sm" value="true">SI</option>
                    <option class="form-control form-control-sm" value="false" selected="">No</option>
                </select>

                Farmacoterapia: <textarea class="form-control" name="txtFarmacoterapia"></textarea>
                Otras Patologías y Farmacoterapia: <textarea class="form-control" name="txtOtras"></textarea><br><br>
                Alteraciones Ortopédicas: <textarea class="form-control" name="txtAlter"></textarea>
                Habitos Nocivos: <textarea class="form-control" name="txtHabitosNocivos"></textarea>
            </div>
            <!-- ---------------------------------- ANTECEDENTES MORBIDOS ----------------------------------- -->


            
            
            
            
            
            <!-- ---------------------------------- EXAMEN FÍSICO GENERAL ----------------------------------- -->
            <div id="examenFisicoGeneral">
                <h2>Examen Físico General</h2>
                Talla en metros: <input class="form-control" type="number" step="any" name="txtTalla">
                IMC: <input class="form-control" type="number" step="any" name="txtIMC">
                Amputación: 
                <select class="custom-select-sm form-control form-control-sm" name="cboAmputacion">
                    <option class="form-control form-control-sm" value="true">Si</option>
                    <option class="form-control form-control-sm" value="false" selected>No</option>
                </select>

                Ubicación: <input class="form-control" type="text" name="txtUbicacionAmputacion">
                N° Calzado: <input class="form-control" type="number" name="txtNumCalzado">
                Varices Extremo Inferior: 
                <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboVaricesExtremoInferior">
                    <option class="form-control form-control-sm" value="true">Si</option>
                    <option class="form-control form-control-sm" value="false" selected>No</option>
                </select>
                Heridas:
                <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboHeridas">
                    <option class="form-control form-control-sm" value="true">Si</option>
                    <option class="form-control form-control-sm" value="false" selected>No</option>
                </select>
                Ubicación: <input class="form-control" type="text" name="txtUbicacionHeridas">
                Tipo: <input class="form-control" type="text" name="txtTipoHeridas">
                Tratamiento:
                <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboTratamiento">
                    <option class="form-control form-control-sm" value="true">Si</option>
                    <option class="form-control form-control-sm" value="false" selected>No</option>
                </select>
                Nevos: 
                <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboNevos">
                    <option class="form-control form-control-sm" value="true">Si</option>
                    <option class="form-control form-control-sm" value="false" selected>No</option>
                </select>
                Ubicación: <input class="form-control" type="text" name="txtUbicacionNevos">
                Máculas:
                <select style="width: 68px" class="col-md" class="custom-select-sm form-control form-control-sm" name="cboMaculas">
                    <option class="form-control form-control-sm" value="true">Si</option>
                    <option class="form-control form-control-sm" value="false" selected>No</option>
                </select>
                Tipo: <input class="form-control" type="text" name="txtTipoMaculas">
            </div>
            <!-- ---------------------------------- EXAMEN FÍSICO GENERAL ----------------------------------- -->
            
            
            
            
            <input type="submit" value="Registrar Ficha">
        </form>
    </body>
</html>
