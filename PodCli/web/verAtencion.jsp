<%@page import="model.bd.TratamientoOrtonixia"%>
<%@page import="model.bd.AtencionPodologicaSelect"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Data d = new Data();

            String idAtencionPod = request.getParameter("idAntPod");
            
            AtencionPodologicaSelect a = d.getListaAtencionPodologicaPorID(idAtencionPod);
        %>
        <div>
            <div>
                <h3>Atención Podologica</h3>
            </div>
            <div>

                Presión Arterial:           <input type="number" step="any" value="<%= a.getPresion()%>" name="presion" readonly>
                Pulso Radial:               <input type="number" value="<%= a.getPulsoRadial()%>" name="pulso" readonly>
                Peso:                       <input type="number" step="any" value="<%= a.getPeso()%>" name="peso" readonly>
                Pulso Pedio Derecho:        <input type="number" name="ppd" value="<%= a.getPulsoPedio_d()%>" readonly>
                Pulso Pedio Izquierdo:      <input type="number" name="ppi" value="<%= a.getPulsoPedio_i()%>" readonly><br><br>
                <input type="checkbox" value="true" name="spd" readonly 
                       <% if (a.isSens_d()) {%>
                       checked="checked"
                       <%}%> 
                       >Sensibilidad Pie Derecho:<br>   
                <input type="checkbox" value="true" name="spi" readonly
                       <% if (a.isSens_i()) {%>
                       checked="checked"
                       <%}%> 
                       >Sensibilidad Pie Izquierdo: <br>

                T° Podal Derecho:           <input type="number" step="any" value="<%= a.gettPoda1_d()%>" name="tpd" readonly>
                T° Podal Izquierdo:         <input type="number" step="any" value="<%= a.gettPoda1_i()%>" name="tpi" readonly><br><br>

                <input type="checkbox" value="true" name="curacion" readonly
                       <% if (a.isCuracion()) {%>
                       checked="checked"
                       <%}%>>
                Curación: <br>                  
                <input type="checkbox" value="true" name="resecado" readonly
                       <% if (a.isResecado()) {%>
                       checked="checked"
                       <%}%>>
                Resecado:  <br>                 
                <input type="checkbox" value="true" name="enu" readonly
                       <% if (a.isEnucleacion()) {%>
                       checked="checked"
                       <%}%>>
                Enucleación:   <br>             
                <input type="checkbox" value="true" name="devastado" readonly
                       <% if (a.isDevastado()) {%>
                       checked="checked"
                       <%}%>>
                Devastado Ungueal: <br>         
                <input type="checkbox" value="true" name="maso" readonly
                       <% if (a.isMaso()) {%>
                       checked="checked"
                       <%}%>>
                Masoterapia o Masaje:  <br>     
                <input type="checkbox" value="true" name="epi" readonly
                       <% if (a.isEspiculoectomia()) {%>
                       checked="checked"
                       <%}%>>
                Espiculoectomía:  <br>          
                <input type="checkbox" value="true" name="anal" readonly
                       <% if (a.isAnalgesia()) {%>
                       checked="checked"
                       <%}%>>
                Analgesia:          <br>        
                <input type="checkbox" value="true" name="acri" readonly
                       <% if (a.isColocacionAcrilico()) {%>
                       checked="checked"
                       <%}%>>
                Colocacion Acrilico:   <br>     

                <input type="checkbox" value="true" name="cbm" readonly
                       <% if (a.isBandaMolecular()) {%>
                       checked="checked"
                       <%}%>>
                Colocacion Banda Molecular: <br>
                <input type="checkbox" value="true" name="cpuente" readonly
                       <% if (a.isColocacionPuente()) {%>
                       checked="checked"
                       <%}%>>
                Colocacion Puente:   <br>       

                <br>Tratamiento Ortonixia: 
                <select name="to" disabled>

                    <%
                        for (TratamientoOrtonixia to : new Data().getTratamientoOrtonoxia()) {
                            if (a.getTratamientoOrtonixia().equalsIgnoreCase(to.getNombre())) {
                                out.println("<option Selected value='" + to.getId() + "'>" + to.getNombre() + "</option>");
                            } else {
                                out.println("<option value='" + to.getId() + "'>" + to.getNombre() + "</option>");

                            }
                        }
                    %>

                </select>
                <br><br>
                <input type="checkbox" value="true" name="cpoli" readonly
                       <% if (a.isPoli()) {%>
                       checked="checked"
                       <%}%>>
                Colocacion Policarboxilato: 
                <br>Observaciones:              <textarea name="obs" readonly><%= a.getObservaciones()%></textarea>
            </div>
        </div>
    </body>
</html>
