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
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Crear Ficha</title>
        
        <script>
            function switchear(idComponente){
                var elemento = document.getElementById(idComponente);
                if(idComponente === "cboTipo"){
                    var id = document.getElementById("cboDM").value;
                    id = parseInt(id);
                    
                    elemento.disabled = !(id === 1 || id === 4);
                }else if(idComponente.includes("cbo")){
                    elemento.disabled = !elemento.disabled;
                }else {
                    elemento.readOnly = !elemento.readOnly;
                }
                
            }
        </script>


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

            <%
                if (u.getPerfil() == 2 || u.getPerfil() == 3) {
            %>
            <br><a href="crearUsuario.jsp">Crear Usuario</a>
            <br><a href="reporteHistorico.jsp">Reporte histórico</a>
            <%
                }
            %>

            <br><a href="buscarPaciente.jsp"> Buscar Pacientes </a>
            <br><a href="cerrar.do">Cerrar sesión</a>
        </div>



        <form action="crearFicha.do" method="post">
            <input type="hidden" name="txtUsuario" value="<%= u.getId()%>"> 

            <!-- ----------------------------------FICHA CLÍNICA----------------------------------- -->
            <div id="fichaClinica">
                <h1>Ficha Clinica</h1><br>
                <!-- HACER PRUEBAS DE DATEPICKER!!!!!! -->
                <h2>Antecedentes Personales</h2>
                Nombre: <input type="text" name="txtNombre" required=""><br>
                <input type="radio" name="opSexo" value="m" checked="checked">Masculino
                <input type="radio" name="opSexo" value="f">Femenino<br>
                Fecha Nacimiento: <input id="fechaNacimiento" name="txtFechaNacimineto" required=""><br>
                Domicilio: <textarea name="txtDomicilio" required=""></textarea><br>
                Rut: <input type="text" name="txtRut" required=""><br>
                <!-- LLenar este comboBox con estados civiles -->
                Estado Civil: 
                <select name="cboEstadoCivil">
                    <%
                        for (EstadoCivil ec : new Data().getEstadosCiviles()) {
                            out.println("<option value='" + ec.getId() + "'>" + ec.getNombre() + "</option>");
                        }
                    %>
                </select> <br>
                Actividad: <input type="text" name="txtActividad"><br>
                Telefonos:  <input type="text" name="txtTelefonos" required=""><br>
            </div>
            <!-- ----------------------------------FICHA CLÍNICA----------------------------------- -->










            <!-- ---------------------------------- ANTECEDENTES MORBIDOS ----------------------------------- -->
            <div id="antecedentesMorbidos">
                <h2>Antecedentes Morbidos</h2>
                HTA: <select name="cboHTA">
                    <%
                        for (Respuesta r : new Data().getRespuestas()) {
                            if (r.getId() == 2) {
                                out.println("<option value='" + r.getId() + "' selected>" + r.getNombre() + "</option>");
                            } else {
                                out.println("<option value='" + r.getId() + "'>" + r.getNombre() + "</option>");
                            }

                        }
                    %>
                </select><br>
                
                D.M: <select id="cboDM" name="cboDM" onclick="switchear('cboTipo')">
                    <%
                        for (Respuesta r : new Data().getRespuestas()) {
                            if (r.getId() == 2) {
                                out.println("<option value='" + r.getId() + "' selected>" + r.getNombre() + "</option>");
                            } else {
                                out.println("<option value='" + r.getId() + "'>" + r.getNombre() + "</option>");
                            }

                        }
                    %>
                </select><br>
                Tipo:   
                <select id="cboTipo" name="cboTipo" disabled>
                    <option value="0">N/A</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select><br>
                Años Evolución: <input type="number" name="txtAnioEvolucion"><br>
                Paciente Mixto:
                <select name="cboPcteMixto">
                    <option value="true">Si</option>
                    <option value="false" selected>No</option>
                </select><br>
                Control:
                <select name="cboControl">
                    <option value="true">SI</option>
                    <option value="false" selected="">No</option>
                </select><br>

                Farmacoterapia: <textarea name="txtFarmacoterapia"></textarea><br>
                Otras Patologías y Farmacoterapia: <textarea name="txtOtras"></textarea><br>
                Alteraciones Ortopédicas: <textarea name="txtAlter"></textarea><br>
                Habitos Nocivos: <textarea name="txtHabitosNocivos"></textarea><br>
            </div>
            <!-- ---------------------------------- ANTECEDENTES MORBIDOS ----------------------------------- -->







            <!-- ---------------------------------- EXAMEN FÍSICO GENERAL ----------------------------------- -->
            <div id="examenFisicoGeneral">
                <h2>Examen Físico General</h2>
                Talla en metros: <input type="number" step="any" name="txtTalla" required=""><br>
                IMC: <input type="number" step="any" name="txtIMC" required=""><br>
                Amputación: 
                <select name="cboAmputacion" onclick="switchear('txtUbicacionAmputacion')">
                    <option value="true">Si</option>
                    <option value="false" selected>No</option>
                </select><br>

                Ubicación: <input type="text" name="txtUbicacionAmputacion" id="txtUbicacionAmputacion" readonly><br>
                N° Calzado: <input type="number" name="txtNumCalzado" required=""><br>
                Varices Extremo Inferior: 
                <select name="cboVaricesExtremoInferior">
                    <option value="true">Si</option>
                    <option value="false" selected>No</option>
                </select><br>
                Heridas:
                <select name="cboHeridas" onclick="switchear('txtUbicacionHeridas'); switchear('txtTipoHeridas'); switchear('cboTratamiento');">
                    <option value="true">Si</option>
                    <option value="false" selected>No</option>
                </select><br>
                Ubicación: <input type="text" id="txtUbicacionHeridas" name="txtUbicacionHeridas" readonly><br>
                Tipo: <input type="text" id="txtTipoHeridas" name="txtTipoHeridas" readonly><br>
                Tratamiento:
                <select id="cboTratamiento" name="cboTratamiento" disabled>
                    <option value="true">Si</option>
                    <option value="false" selected>No</option>
                </select><br>
                Nevos: 
                <select name="cboNevos" onclick="switchear('txtUbicacionNevos')">
                    <option value="true">Si</option>
                    <option value="false" selected>No</option>
                </select><br>
                Ubicación: <input type="text" name="txtUbicacionNevos" id="txtUbicacionNevos" readonly><br>
                Máculas:
                <select name="cboMaculas" onclick="switchear('txtTipoMaculas')">
                    <option value="true">Si</option>
                    <option value="false" selected>No</option>
                </select><br>
                Tipo: <input type="text" name="txtTipoMaculas" id="txtTipoMaculas" readonly><br>
            </div>
            <!-- ---------------------------------- EXAMEN FÍSICO GENERAL ----------------------------------- -->




            <input type="submit" value="Registrar Ficha">
        </form>
    </body>
</html>
