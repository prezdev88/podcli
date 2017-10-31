<%-- 
    Document   : atencionPodologica
    Created on : 24-oct-2017, 15:20:19
    Author     : Edunaldo
--%>

<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Data"%>
<%@page import="model.bd.TratamientoOrtonixia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%

            Usuario u = (Usuario) session.getAttribute("usuario");

            if (u == null) {
                request.getSession().setAttribute("error", new Error("Debe Ingresar Rut"));
                response.sendRedirect("index.jsp");
            }
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <title>JSP Page</title>
    </head>
    <body style="background-color: gainsboro">
        
        <!--<h1>Atencion Podologica</h1>-->
        <br><br>
         <div class="container">
            <form action="" method="post">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Atención Podologica</h3>
                    </div>
                    <div class="panel-body">


                        <!--Estos 2 datos deben viajar desde los hipervinculos-->
                        <%
                            if (u != null) {
                        %>
                        <input type="hidden" name="usuario" value="<%= u.getId()%>">
                        <%
                            }
                        %>
                        <input type="hidden" name="ficha" value="">
                        
                        <div class="form-group col-md-3">
                            <label for="presionArterial">Presión Arterial:</label><br>
                            <input  type="number" step="any" name="txtPersionArterial">
                        </div>
                        
                        <div class="form-group col-md-3">
                            <label for="pulsoRadial">Pulso Radial:</label><br> 
                            <input type="number" name="txtPulsoRadial">
                        </div>
                        
                        <div class="form-group col-md-3">
                            <label for="peso">Peso:</label><br> 
                            <input type="number" step="any" name="txtPeso"><br><br>
                        </div>
                        
                        <div class="form-group col-md-3">
                            <label for="pulsopedioDerecho">Pulso Pedio Derecho:</label><br> 
                            <input type="number" name="txtPulsoPedioDerecho">
                        </div>
                        
                        <div class="form-group col-md-4">
                            <label for="pulsopedioIzquierdo">Pulso Pedio Izquierdo:</label><br> 
                            <input type="number" name="txtPulsoPedioIzquierdo">
                        </div>
                        
                        <div class="form-group col-md-4">
                            <label for="podalDerecho">T° Podal Derecho:</label><br> 
                            <input type="number" step="any" name="txtTemperaturaPodalDerecho">
                        </div>
                        
                        <div class="form-group col-md-4">
                            <label for="podalIzquierdo">T° Podal Izquierdo:</label><br>
                            <input type="number" step="any" name="txtTemperaturaPodalIzquierdo">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Sensibilidad Pie Derecho:</label>
                            <input type="checkbox" value="true" name="chkSensPieDerecho">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Sensibilidad Pie Izquierdo:</label> 
                            <input type="checkbox" value="true" name="chkSensPieIzquierdo">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Curación:</label> 
                            <input type="checkbox" value="true" name="chkCuracion">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Resecado:</label> 
                            <input type="checkbox" value="true" name="chkResecado">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Enucleación:</label> 
                            <input type="checkbox" value="true" name="chkEnucleacion">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Devastado Ungueal:</label> 
                            <input type="checkbox" value="true" name="chkDevastadoUngueal">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Masoterapia o Masaje:</label> 
                            <input type="checkbox" value="true" name="chkMaso">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Espiculoectomía:</label> 
                            <input type="checkbox" value="true" name="chkEspiculoectomia">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Analgesia:</label> 
                            <input type="checkbox" value="true" name="chkAnalgesia">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Colocacion Acrilico:</label> 
                            <input type="checkbox" value="true" name="chkColAcri">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Colocacion Banda Molecular:</label> 
                            <input type="checkbox" value="true" name="chkColBandaMolecular">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Colocacion Puente:</label> 
                            <input type="checkbox" value="true" name="chkColPuente">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Tratamiento Ortonixia:</label> 
                        <select name="cboTratamientoOrtonixia">
                            <%
                                for (TratamientoOrtonixia to : new Data().getTratamientoOrtonoxia()) {
                                    out.println("<option value='" + to.getId() + "'>" + to.getNombre() + "</option>");
                                }
                            %>
                        </select>
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Colocacion Policarboxilato:</label>
                            <input type="checkbox" value="true" name="chkColPolicarboxilato">
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label>Observaciones:</label><br>
                            <textarea name="txtObsAtencionPodo"></textarea>
                        </div>
                        
                        
                        <br><br>
                   
                    <center class="form-group col-md-12">
                        <button type="submit" class="btn btn-primary btn-lg" value="RegistrarFicha">Registrar Atención</button>
                        <a type="button" class="btn btn-primary btn-lg" href="buscarPaciente.jsp">Volver</a>
                    </center>
                 
                </div>
            </form>
        </div>
    </body>
</html>
