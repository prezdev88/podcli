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
    
    Usuario u = (Usuario)session.getAttribute("usuario");
    
    if(u == null){
        request.getSession().setAttribute("error", new Error("Debe Ingresar Rut"));
        response.sendRedirect("index.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Crear Ficha</title>
    </head>
    <body>
        <h1>Ficha Clinica</h1><br>
        
        <div>
            <%if(u != null){%>
            Usuario Actual:<%=u.getNombre()%><br>
            Perfil: <%
                Data d = new Data();
                
                out.println(d.getPerfil(u.getPerfil()));
            %>
           <%}%> 
            <form action="cerrar.do" method="post">
                <input type="submit" value="Cerrar Sesion">
            </form>
            
        </div>

        <div class="container">
            <form action="crearFicha.do" method="post" class="col-12" class="center">
                <div class="row  justify-content-xl-center">
                    <div>
                        <h3>Antecedentes Personales</h3><br>
                        Nombre: <input class="form-control" type="text" name="txtNombre">
                        <input type="radio" name="opSexo" value="m">Masculino
                        <input type="radio" name="opSexo" value="f">Femenino
                        Fecha Nacimiento: <input class="form-control" type="date" name="txtFechaNacimineto">
                        Domicilio: <textarea class="form-control" name="txtDomicilio"></textarea>
                        Rut: <input class="form-control" type="text" name="txtRut">
                        <!-- LLenar este comboBox con estados civiles -->
                        Estado Civil: <select class="custom-select-sm form-control form-control-sm" name="cboEstadoCivil">
                            <%
                                for (EstadoCivil ec : new Data().getEstadoCivil()) {
                                    out.println("<option value='" + ec.getId() + "'>" + ec.getNombre() + "</option>");
                                }
                            %>
                        </select> 
                        Actividad: <input class="form-control" type="text" name="txtActividad">
                        Telefonos:  <input class="form-control" type="text" name="txtTelefonos">
                    </div>
                </div>
                <div class="row  justify-content-xl-center">
                    <div>
                        <h3>Antecedentes Morbidos</h3><br>
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
                        <select class="custom-select-sm form-control form-control-sm" name="cboTipo">
                            <option class="form-control form-control-sm" value="1">1</option>
                            <option class="form-control form-control-sm" value="2">2</option>
                            <option class="form-control form-control-sm" value="3">3</option>
                        </select>
                        Años Evolución: <input class="form-control form-control-sm" type="number" name="txtAnioEvolucion">
                        Paciente Mixto:
                        <select class="custom-select-sm form-control form-control-sm" name="cboPcteMixto">
                            <option class="form-control form-control-sm" value="true">SI</option>
                            <option class="form-control form-control-sm" value="false">No</option>
                        </select>
                        Control:
                        <select class="custom-select-sm form-control form-control-sm" name="cboControl">
                            <option class="form-control form-control-sm" value="true">SI</option>
                            <option class="form-control form-control-sm" value="false">No</option>
                        </select>
                        Farmacoterapia: <textarea class="form-control" name="txtFarmacoterapia"></textarea>
                        Otras Patologías y Farmacoterapia: <textarea class="form-control" name="txtOtrasPatologíasYFarmacoterapia"></textarea>
                        Alteraciones Ortopédicas: <textarea class="form-control" name="txtAlteracionesOrtopédicas"></textarea>
                        Habitos Nocivos: <textarea class="form-control" name="txtHabitosNocivos"></textarea>
                    </div>
                </div>
                <div class="row  justify-content-xl-center">
                    <div>
                        <h3>Examen Fisicos General</h3>
                        Talla: <input class="form-control" type="number" step="any" name="txtTalla">metros
                        IMC: <input class="form-control" type="number" step="any" name="txtIMC">
                        Amputación: 
                        <select class="custom-select-sm form-control form-control-sm" name="cboAmputacion">
                            <option class="form-control form-control-sm" value="true">SI</option>
                            <option class="form-control form-control-sm" value="false">No</option>
                        </select>

                        Ubicación: <input class="form-control" type="text" name="txtUbicacionAmputacion">

                        N° Calzado: <input class="form-control" type="number" name="txtNumCalzado">

                        Varices Extremo Inferior: 
                        <select class="custom-select-sm form-control form-control-sm" name="cboVaricesExtremoInferior">
                            <option class="form-control form-control-sm" value="true">SI</option>
                            <option class="form-control form-control-sm" value="false">No</option>
                        </select>

                        Heridas:
                        <select class="custom-select-sm form-control form-control-sm" name="cboHeridas">
                            <option class="form-control form-control-sm" value="true">SI</option>
                            <option class="form-control form-control-sm" value="false">No</option>
                        </select>

                        Ubicación: <input class="form-control" type="text" name="txtUbicacionHeridas">
                        Tipo: <input class="form-control" type="text" name="txtTipoHeridas">
                        Tratamiento:
                        <select class="custom-select-sm form-control form-control-sm" name="cboTratamiento">
                            <option class="form-control form-control-sm" value="true">SI</option>
                            <option class="form-control form-control-sm" value="false">No</option>
                        </select>

                        Nevos: 
                        <select class="custom-select-sm form-control form-control-sm" name="cboNevos">
                            <option class="form-control form-control-sm" value="true">SI</option>
                            <option class="form-control form-control-sm" value="false">No</option>
                        </select>

                        Ubicación: <input class="form-control" type="text" name="txtUbicacionNevos">

                        Máculas:
                        <select class="custom-select-sm form-control form-control-sm" name="cboMaculas">
                            <option class="form-control form-control-sm" value="true">SI</option>
                            <option class="form-control form-control-sm" value="false">No</option>
                        </select>

                        Tipo: <input class="form-control" type="text" name="txtTipoMaculas">


                    </div>

                </div>
                <div class="row  justify-content-xl-center">
                    <br>
                    <input class="btn btn-outline-primary" type="submit" value="Registrar Ficha">
                </div>
            </form>
        </div>


        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
