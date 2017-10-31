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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <!--<h1>Atencion Podologica</h1>-->

        <div class="container">
            <form action="registrarAtencion.do" method="post">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Atención Podologica</h3>
                    </div>
                    <div class="panel-body">


                        <!--Estos 2 datos deben viajar desde los hipervinculos-->
                        <%
                            System.out.println("ID FICHA: "+request.getParameter("idFicha"));
                            if (u != null) {
                        %>
                        
                        
                        <%
                            }
                        %>
                                                    <input type="hidden" name="usuario" value="<%=u.getId()%>">
                                                    <input type="hidden" name="ficha" value="<%=request.getParameter("idFicha")%>">
                        Presión Arterial:           <input type="number" step="any" name="presion" required="">
                        Pulso Radial:               <input type="number" name="pulso" required="">
                        Peso:                       <input type="number" step="any" name="peso" required="">
                        Pulso Pedio Derecho:        <input type="number" name="ppd" required="">
                        Pulso Pedio Izquierdo:      <input type="number" name="ppi" required=""><br><br>
                                                    <input type="checkbox" value="true" name="spd">Sensibilidad Pie Derecho:<br>   
                                                    <input type="checkbox" value="true" name="spi"> Sensibilidad Pie Izquierdo: <br>
                        T° Podal Derecho:           <input type="number" step="any" name="tpd" required="">
                        T° Podal Izquierdo:         <input type="number" step="any" name="tpi" required=""><br><br>
                                                    <input type="checkbox" value="true" name="curacion">Curación: <br>                  
                                                    <input type="checkbox" value="true" name="resecado">Resecado:  <br>                 
                                                    <input type="checkbox" value="true" name="enu">Enucleación:   <br>             
                                                    <input type="checkbox" value="true" name="devastado">Devastado Ungueal: <br>         
                                                    <input type="checkbox" value="true" name="maso">Masoterapia o Masaje:  <br>     
                                                    <input type="checkbox" value="true" name="epi">Espiculoectomía:  <br>          
                                                    <input type="checkbox" value="true" name="anal">Analgesia:          <br>        
                                                    <input type="checkbox" value="true" name="acri">Colocacion Acrilico:   <br>     
                                                    <input type="checkbox" value="true" name="cbm">Colocacion Banda Molecular: <br>
                                                    <input type="checkbox" value="true" name="cpuente">Colocacion Puente:   <br>       
                        
                        <br>Tratamiento Ortonixia: 
                        <select name="to">
                            <%
                                for (TratamientoOrtonixia to : new Data().getTratamientoOrtonoxia()) {
                                    out.println("<option value='" + to.getId() + "'>" + to.getNombre() + "</option>");
                                }
                            %>
                        </select>
                        <br><br>
                        <input type="checkbox" value="true" name="cpoli">Colocacion Policarboxilato: 
                        <br>Observaciones:              <textarea name="obs"></textarea>

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
