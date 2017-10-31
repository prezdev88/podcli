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
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <!--<h1>Atencion Podologica</h1>-->

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

                        Presión Arterial: <input  type="number" step="any" name="txtPersionArterial">
                        Pulso Radial: <input type="number" name="txtPulsoRadial">
                        Peso: <input type="number" step="any" name="txtPeso"><br><br>
                        Pulso Pedio Derecho: <input type="number" name="txtPulsoPedioDerecho">
                        Pulso Pedio Izquierdo: <input type="number" name="txtPulsoPedioIzquierdo"><br><br>
                        Sensibilidad Pie Derecho: <input type="checkbox" value="true" name="chkSensPieDerecho">
                        Sensibilidad Pie Izquierdo: <input type="checkbox" value="true" name="chkSensPieIzquierdo"><br><br>
                        T° Podal Derecho: <input type="number" step="any" name="txtTemperaturaPodalDerecho">
                        T° Podal Izquierdo: <input type="number" step="any" name="txtTemperaturaPodalIzquierdo"><br><br>
                        Curación: <input type="checkbox" value="true" name="chkCuracion">
                        Resecado: <input type="checkbox" value="true" name="chkResecado">
                        Enucleación: <input type="checkbox" value="true" name="chkEnucleacion">
                        Devastado Ungueal: <input type="checkbox" value="true" name="chkDevastadoUngueal"><br><br>
                        Masoterapia o Masaje: <input type="checkbox" value="true" name="chkMaso">
                        Espiculoectomía: <input type="checkbox" value="true" name="chkEspiculoectomia">
                        Analgesia: <input type="checkbox" value="true" name="chkAnalgesia">
                        Colocacion Acrilico: <input type="checkbox" value="true" name="chkColAcri"><br><br>
                        Colocacion Banda Molecular: <input type="checkbox" value="true" name="chkColBandaMolecular">
                        Colocacion Puente: <input type="checkbox" value="true" name="chkColPuente">
                        Tratamiento Ortonixia: 
                        <select name="cboTratamientoOrtonixia">
                            <%
                                for (TratamientoOrtonixia to : new Data().getTratamientoOrtonoxia()) {
                                    out.println("<option value='" + to.getId() + "'>" + to.getNombre() + "</option>");
                                }
                            %>
                        </select>
                        <br><br>
                        Colocacion Policarboxilato: <input type="checkbox" value="true" name="chkColPolicarboxilato">
                        Observaciones: <textarea name="txtObsAtencionPodo"></textarea>

                        <br><br>
                        <div class="form-group" class="row  justify-content-xl-center">
                            <br><br>
                            <input class="btn btn-outline-primary" type="submit" value="Registar Atencion">
                        </div>



                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
