<%@page import="model.bd.FichaSelect"%>
<%@page import="model.bd.Respuesta"%>
<%@page import="model.bd.Data"%>
<%@page import="model.bd.EstadoCivil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link 
            rel="stylesheet" 
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
            integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
            crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        
        <title>Ver Ficha</title>
    </head>
    <body>
        <%
            Data d = new Data();

            String rut = request.getParameter("rut");
            FichaSelect f = d.getFicha(rut);
        %>
        

        <div class="container">
            <h1><%= f.getNombrePaciente()%></h1>
            <div class="col-md-12">
                <button type="button" class="btn btn-success col-md-12" data-toggle="collapse" data-target="#antecedentes">
                    Antecedentes Personales
                </button>
            </div>

            <div class="col-md-12 collapse" id="antecedentes">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-title">
                        Antecedentes Personales
                    </div>
                    <div class="panel-body">
                        <div class="col-md-6">
                            Rut: <input class="form-control" type="text" name="txtRut" value="<%= f.getRut()%>">
                            Nombre: <input class="form-control" type="text" name="txtNombre" value="<%= f.getNombrePaciente()%>">
                            Fecha Nacimiento: <input class="form-control" type="date" name="txtFechaNacimineto" value="<%= f.getFecha()%>">
                            Domicilio: <textarea class="form-control" name="txtDomicilio"><%= f.getDomicilio()%></textarea>
                        </div>
                        <div class="col-md-6">
                            Estado Civil: <input class="form-control" type="text" value="<%= f.getEstado_civil()%>"> 
                            Actividad: <input class="form-control" type="text" name="txtActividad" value="<%= f.getActividad()%>">
                            Telefonos:  <input class="form-control" type="text" name="txtTelefonos" value="<%= f.getFono()%>">
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-title">
                        Antecedentes Morbidos
                    </div>
                    <div class="panel-body">
                        <div class="col-md-6">
                            HTA: <input class="form-control" type="text" value="<%= f.getHta()%>">
                            D.M: <input class="form-control" type="text" value="<%= f.getDm()%>">
                            Tipo: <input class="form-control" type="text" value="<%
                                String tipo = f.getTipoDiabetes();

                                if (tipo.equals("0")) {
                                    out.println("N/A");
                                } else {
                                    out.println(tipo);
                                }

                                         %>">   
                            Años Evolución: <input class="form-control form-control-sm" type="number" name="txtAnioEvolucion" value="<%= f.getAnioEvolucion()%>">
                            Paciente Mixto:<input class="form-control" type="text" value="<%=(f.getPacienteMixto() ? "SI" : "NO")%>">
                            Control:<input class="form-control" type="text" value="<%=(f.getControl() ? "SI" : "NO")%>">
                        </div>
                        <div class="col-md-6">
                            Farmacoterapia: <textarea class="form-control" name="txtFarmacoterapia"><%= f.getFarmacoterapia()%></textarea>
                            Otras Patologías y Farmacoterapia: <textarea class="form-control" name="txtOtrasPatologíasYFarmacoterapia"><%= f.getOtrasPatologicas()%></textarea>
                            Alteraciones Ortopédicas: <textarea class="form-control" name="txtAlteracionesOrtopédicas"><%= f.getAlteracionesOrtopedicas()%></textarea>
                            Habitos Nocivos: <textarea class="form-control" name="txtHabitosNocivos"><%= f.getHabitos_nocivos()%></textarea>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading panel-title">
                        Examen Físico General
                    </div>
                    <div class="panel-body">
                        <div class="col-md-6">
                            Talla: <input class="form-control" type="number" step="any" name="txtTalla" value="<%= f.getTalla()%>">
                            IMC: <input class="form-control" type="number" step="any" name="txtIMC" value="<%= f.getImc()%>">
                            Amputación: <input class="form-control" type="text" value="<%=(f.getAmputacion() ? "SI" : "NO")%>">
                            Ubicación Amputación: <input class="form-control" type="text" name="txtUbicacionAmputacion" value="<%= f.getUbicacion_Amputacion()%>">
                            N° Calzado: <input class="form-control" type="number" name="txtNumCalzado" value="<%= f.getNro_Calzando()%>">
                            Varices Extremo Inferior: <input class="form-control" type="text" value="<%= (f.getVarices() ? "SI" : "NO")%>">
                            Heridas:<input class="form-control" type="text" value="<%= (f.getHeridas() ? "SI" : "NO")%>">
                        </div>
                        <div class="col-md-6">
                            Ubicación Heridas: <input class="form-control" type="text" name="txtUbicacionHeridas" value="<%= f.getUbicacion_Heridas()%>">
                            Tipo: <input class="form-control" type="text" name="txtTipoHeridas" value="<%= f.getTipo_Heridas()%>">
                            Tratamiento:<input class="form-control" type="text" value="<%= (f.getTratamiento() ? "SI" : "NO")%>">
                            Nevos: <input class="form-control" type="text" value="<%= (f.getNevos() ? "SI" : "NO")%>">
                            Ubicación Nevos: <input class="form-control" type="text" name="txtUbicacionNevos" value="<%= f.getUbicacion_nevos()%>">
                            Máculas:<input class="form-control" type="text" value="<%= (f.getMaculas() ? "SI" : "NO")%>">
                            Tipo: <input class="form-control" type="text" name="txtTipoMaculas" value="<%= f.getTipo_Maculas()%>">
                        </div>
                    </div>
                </div>
            </div>
             
           
                        <center><a type="button" class="btn btn-primary btn-lg" href="buscarPaciente.jsp">Volver</a></center>
        
        </div>

                        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
