<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.FichaSelect"%>
<%@page import="model.bd.Respuesta"%>
<%@page import="model.bd.Data"%>
<%@page import="model.bd.EstadoCivil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <%
            Usuario u = (Usuario) request.getSession().getAttribute("usuario");

            if (u == null) {
                request.getSession().setAttribute("error", new Error("Debe Ingresar Rut"));
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Ver Ficha</title>
    </head>
    <body>
        <%
            Data d = new Data();

            String rut = request.getParameter("rut");
            FichaSelect f = d.getFicha(rut);
        %>


        <h1><%=f.getNombrePaciente()%></h1>


        <h1>Antecedentes Personales</h1>
        Rut: <input type="text" name="txtRut" value="<%= f.getRut()%>" readonly><br>
        Nombre: <input type="text" name="txtNombre" value="<%= f.getNombrePaciente()%>" readonly><br>
        Fecha Nacimiento: <input type="date" name="txtFechaNacimineto" value="<%= f.getFecha()%>" readonly><br>
        Domicilio: <textarea name="txtDomicilio" readonly><%= f.getDomicilio()%></textarea><br>
        Estado Civil: <input type="text" value="<%= f.getEstado_civil()%>" readonly><br>
        Actividad: <input type="text" name="txtActividad" value="<%= f.getActividad()%>" readonly><br>
        Telefonos:  <input type="text" name="txtTelefonos" value="<%= f.getFono()%>" readonly><br>
        Fecha de Registro: <input value="<%= f.getFecha_ficha() %>" readonly><br>

             

        <h1>Antecedentes Morbidos</h1>
        HTA: <input type="text" value="<%= f.getHta()%>" readonly><br>
        D.M: <input type="text" value="<%= f.getDm()%>" readonly><br>
        Tipo: <input type="text" value=" <%
            String tipo = f.getTipoDiabetes();

            if (tipo.equals("0")) {
                out.println("N/A");
            } else {
                out.println(tipo);
            }

                     %>" readonly><br>  
        Años Evolución: <input type="number" name="txtAnioEvolucion" value="<%= f.getAnioEvolucion()%>" readonly><br>
        Paciente Mixto:<input type="text" value="<%=(f.getPacienteMixto() ? "SI" : "NO")%>" readonly><br>
        Control:<input type="text" value="<%=(f.getControl() ? "SI" : "NO")%>" readonly><br>                    
        Farmacoterapia: <textarea name="txtFarmacoterapia" readonly><%= f.getFarmacoterapia()%></textarea><br>
        Otras Patologías y Farmacoterapia: <textarea name="txtOtrasPatologíasYFarmacoterapia" readonly><%= f.getOtrasPatologicas()%></textarea><br>
        Alteraciones Ortopédicas: <textarea name="txtAlteracionesOrtopédicas" readonly><%= f.getAlteracionesOrtopedicas()%></textarea><br>
        Habitos Nocivos: <textarea name="txtHabitosNocivos" readonly><%= f.getHabitos_nocivos()%></textarea><br>
                        

        <h1>Examen Físico General</h1>
            
        Talla: <input type="number" step="any" name="txtTalla" value="<%= f.getTalla()%>" readonly><br> 
        IMC: <input type="number" step="any" name="txtIMC" value="<%= f.getImc()%>" readonly><br> 
        Amputación: <input type="text" value="<%=(f.getAmputacion() ? "SI" : "NO")%>" readonly><br> 
        Ubicación Amputación: <input type="text" name="txtUbicacionAmputacion" value="<%= f.getUbicacion_Amputacion()%>"readonly><br> 
        N° Calzado: <input type="number" name="txtNumCalzado" value="<%= f.getNro_Calzando()%>" readonly><br> 
        Varices Extremo Inferior: <input type="text" value="<%= (f.getVarices() ? "SI" : "NO")%>" readonly><br> 
        Heridas:<input type="text" value="<%= (f.getHeridas() ? "SI" : "NO")%>" readonly><br> 
        Ubicación Heridas: <input type="text" name="txtUbicacionHeridas" value="<%= f.getUbicacion_Heridas()%>" readonly><br> 
        Tipo: <input type="text" name="txtTipoHeridas" value="<%= f.getTipo_Heridas()%>" readonly><br> 
        Tratamiento:<input type="text" value="<%= (f.getTratamiento() ? "SI" : "NO")%>" readonly><br> 
        Nevos: <input class="form-control" type="text" value="<%= (f.getNevos() ? "SI" : "NO")%>" readonly><br> 
        Ubicación Nevos: <input type="text" name="txtUbicacionNevos" value="<%= f.getUbicacion_nevos()%>" readonly><br> 
        Máculas:<input type="text" value="<%= (f.getMaculas() ? "SI" : "NO")%>" readonly><br> 
        Tipo: <input type="text" name="txtTipoMaculas" value="<%= f.getTipo_Maculas()%>" readonly><br> 
             
        <a href="buscarPaciente.jsp">Volver</a>
        
    </body>
</html>
