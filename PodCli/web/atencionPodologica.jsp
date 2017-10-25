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
    
    Usuario u = (Usuario)session.getAttribute("usuario");
    
    if(u == null){
        request.getSession().setAttribute("error", new Error("Debe Ingresar Rut"));
        response.sendRedirect("index.jsp");
    }
%>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Atencion Podologica</h1>
        
        <form action="" method="post">
            <!--Estos 2 datos deben viajar desde los hipervinculos-->
            <%
                if(u != null){
                %>
                    <input type="hidden" name="usuario" value="<%= u.getId() %>">
            <%
                }
            %>
            <input type="hidden" name="ficha" value="">
            
            Presión Arterial: <input type="number" step="any" name="txtPersionArterial">
            Pulso Radial: <input type="number" name="txtPulsoRadial">
            Peso: <input type="number" step="any" name="txtPeso">
            Pulso Pedio Derecho: <input type="number" name="txtPulsoPedioDerecho">
            Pulso Pedio Izquierdo: <input type="number" name="txtPulsoPedioIzquierdo">
            Sensibilidad Pie Derecho: <input type="checkbox" value="true" name="chkSensPieDerecho">
            Sensibilidad Pie Izquierdo: <input type="checkbox" value="true" name="chkSensPieIzquierdo">
            T° Podal Derecho: <input type="number" step="any" name="txtTemperaturaPodalDerecho">
            T° Podal Izquierdo: <input type="number" step="any" name="txtTemperaturaPodalIzquierdo">
            Curación: <input type="checkbox" value="true" name="chkCuracion">
            Resecado: <input type="checkbox" value="true" name="chkResecado">
            Enucleación: <input type="checkbox" value="true" name="chkEnucleacion">
            Devastado Ungueal: <input type="checkbox" value="true" name="chkDevastadoUngueal">
            Masoterapia o Masaje: <input type="checkbox" value="true" name="chkMaso">
            Espiculoectomía: <input type="checkbox" value="true" name="chkEspiculoectomia">
            Analgesia: <input type="checkbox" value="true" name="chkAnalgesia">
            Colocacion Acrilico: <input type="checkbox" value="true" name="chkColAcri">
            Colocacion Banda Molecular: <input type="checkbox" value="true" name="chkColBandaMolecular">
            Colocacion Puente: <input type="checkbox" value="true" name="chkColPuente">
            Tratamiento Ortonixia: 
            <select name="cboTratamientoOrtonixia">
                <%
                for(TratamientoOrtonixia to : new Data().getTratamientoOrtonoxia()){
                    out.println("<option value='"+to.getId()+"'>"+to.getNombre()+"</option>");
                }
                %>
            </select>
            Colocacion Policarboxilato: <input type="checkbox" value="true" name="chkColPolicarboxilato">
            Observaciones: <textarea name="txtObsAtencionPodo"></textarea>
            
            
            <input type="submit" value="Registar Atencion">
            
        </form>
    </body>
</html>
