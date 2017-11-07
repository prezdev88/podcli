<%@page import="model.bd.Paciente"%>
<%@page import="model.bd.TratamientoOrtonixia"%>
<%@page import="model.bd.AtencionPodologicaSelect"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="validar.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver atención</title>
    </head>
    <body>
        <%
            Data d = new Data();

            String idAtencionPod = request.getParameter("idAntPod");
            String idPaciente = request.getParameter("idPaciente");
            
            AtencionPodologicaSelect a = d.getAtencionPodologicaBy(idAtencionPod);
            Paciente p = d.getPaciente(idPaciente);
        %>
        
        <div>
            <h1><%= p.getNombre() %></h1>
            <h2>Atención podológica</h2>
            <h4><%= Data.getFormattedDate(a.getFecha(), true) %></h4>
        </div>
        <div>

            Presión Arterial:           <input type="number" step="any" value="<%= a.getPresion()%>" name="presion" readonly><br>
            Pulso Radial:               <input type="number" value="<%= a.getPulsoRadial()%>" name="pulso" readonly><br>
            Peso:                       <input type="number" step="any" value="<%= a.getPeso()%>" name="peso" readonly><br>
            Pulso Pedio Derecho:        <input type="number" name="ppd" value="<%= a.getPulsoPedio_d()%>" readonly><br>
            Pulso Pedio Izquierdo:      <input type="number" name="ppi" value="<%= a.getPulsoPedio_i()%>" readonly><br>
            Sensibilidad Pie Derecho:   <input value="<%=(a.isSens_d()?"Si":"No")%>" readonly> <br>   
            Sensibilidad Pie Izquierdo: <input value="<%=(a.isSens_i()?"Si":"No")%>" readonly> <br>
            T° Podal Derecho:           <input type="number" step="any" value="<%= a.gettPoda1_d()%>" name="tpd" readonly><br>
            T° Podal Izquierdo:         <input type="number" step="any" value="<%= a.gettPoda1_i()%>" name="tpi" readonly><br>
            Curación:                   <input value="<%=(a.isCuracion()?"Si":"No")%>" readonly> <br>                  
            Resecado:                   <input value="<%=(a.isResecado()?"Si":"No")%>" readonly> <br>                 
            Enucleación:                <input value="<%=(a.isEnucleacion()?"Si":"No")%>" readonly> <br>             
            Devastado Ungueal:          <input value="<%=(a.isDevastado()?"Si":"No")%>" readonly> <br>         
            Masoterapia o Masaje:       <input value="<%=(a.isMaso()?"Si":"No")%>" readonly> <br>     
            Espiculoectomía:            <input value="<%=(a.isEspiculoectomia()?"Si":"No")%>" readonly> <br>          
            Analgesia:                  <input value="<%=(a.isAnalgesia()?"Si":"No")%>" readonly> <br>        
            Colocacion Acrilico:        <input value="<%=(a.isColocacionAcrilico()?"Si":"No")%>" readonly> <br>     
            Colocacion Banda Molecular: <input value="<%=(a.isBandaMolecular()?"Si":"No")%>" readonly> <br>
            Colocacion Puente:          <input value="<%=(a.isColocacionPuente()?"Si":"No")%>" readonly> <br>       
            Tratamiento Ortonixia:      <input type="text" readonly value="<%=a.getTratamientoOrtonixia()%>"><br>
            Colocacion Policarboxilato: <input value="<%=(a.isPoli()?"Si":"No")%>"readonly> <br>
            Observaciones:              <textarea name="obs" readonly><%= a.getObservaciones()%></textarea>
        </div>
        
        <%%>
        <form action="historicoAtencion.jsp" method="post">
            <input type="hidden" name="idPaciente" value="<%=idPaciente%>">
            <input type="submit" value="Volver">
        </form>
    </body>
</html>
