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
        <title>JSP Page</title>
    </head>
    <body>
        <form action="registrarAtencion.do" method="post">

            <%
                Data d = new Data();
                String idFicha = request.getParameter("idFicha");
            %>
            <h3 >Atención Podológica de <%= d.getNombreBy(idFicha) %></h3>

           

                                        <input type="hidden"    name="usuario"  value="<%=u.getId()%>">
                                        <input type="hidden"    name="ficha"    value="<%=idFicha%>">
            Presión Arterial:           <input type="number"    step="any"      name="presion" required="">
            Pulso Radial:               <input type="number"    name="pulso"    required="">
            Peso:                       <input type="number"    step="any"      name="peso" required="">
            Pulso Pedio Derecho:        <input type="number"    name="ppd"      required="">
            Pulso Pedio Izquierdo:      <input type="number"    name="ppi"      required=""><br><br>
                                        <input type="checkbox"  value="true"    name="spd">Sensibilidad Pie Derecho:<br>   
                                        <input type="checkbox"  value="true"    name="spi"> Sensibilidad Pie Izquierdo: <br>
            T° Podal Derecho:           <input type="number"    step="any"      name="tpd" required="">
            T° Podal Izquierdo:         <input type="number"    step="any"      name="tpi" required=""><br><br>
                                        <input type="checkbox"  value="true"    name="curacion">Curación: <br>                  
                                        <input type="checkbox"  value="true"    name="resecado">Resecado:  <br>                 
                                        <input type="checkbox"  value="true"    name="enu">Enucleación:   <br>             
                                        <input type="checkbox"  value="true"    name="devastado">Devastado Ungueal: <br>         
                                        <input type="checkbox"  value="true"    name="maso">Masoterapia o Masaje:  <br>     
                                        <input type="checkbox"  value="true"    name="epi">Espiculoectomía:  <br>          
                                        <input type="checkbox"  value="true"    name="anal">Analgesia:          <br>        
                                        <input type="checkbox"  value="true"    name="acri">Colocacion Acrilico:   <br>     
                                        <input type="checkbox"  value="true"    name="cbm">Colocacion Banda Molecular: <br>
                                        <input type="checkbox"  value="true"    name="cpuente">Colocacion Puente:   <br>       

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

            <input class="btn btn-outline-primary" type="submit" value="Registar Atencion">
        </form>
        <a href="buscarPaciente.jsp">Volver</a>
    </body>
</html>
