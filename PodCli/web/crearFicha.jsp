<%-- 
    Document   : crearPaciente
    Created on : 24-oct-2017, 14:12:35
    Author     : Edunaldo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Ficha</title>
    </head>
    <body>
        <h1>Ficha Clinica</h1><br>
        <h3>Antecedentes Personales</h3><br>

        <form action="crearFicha.do" method="post">
            Nombre: <input type="text" name="txtNombre">
            Fecha Nacimiento: <input type="date" name="txtFechaNacimineto">
            Domicilio: <textarea name="txtDomicilio"></textarea>
            Rut: <input type="text" name="txtRut">
            <!-- LLenar este comboBox con estados civiles -->
            Estado Civil: <select name="cboEstadoCivil"></select> 
            Actividad: <input type="text" name="txtActividad">
            Telefonos:  <input type="text" name="txtTelefonos">

            <h3>Antecedentes Morbidos</h3><br>
            <!-- LLenar este comboBox con tablas respuesta desde la BD -->
            HTA: <select name="cboHTA"></select>
            <!-- LLenar este comboBox con tablas respuesta desde la BD -->
            D.M: <select name="cboDM"></select>
            Tipo:   
            <select name="cboTipo">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
            Años Evolución: <input type="number" name="txtAnioEvolucion">
            Paciente Mixto:
            <select name="cboPcteMixto">
                <option value="true">SI</option>
                <option value="false">No</option>
            </select>
            Control:
            <select name="cboControl">
                <option value="true">SI</option>
                <option value="false">No</option>
            </select>
            Farmacoterapia: <textarea name="txtFarmacoterapia"></textarea>
            Otras Patologías y Farmacoterapia: <textarea name="txtOtrasPatologíasYFarmacoterapia"></textarea>
            Alteraciones Ortopédicas: <textarea name="txtAlteracionesOrtopédicas"></textarea>
            Habitos Nocivos: <textarea name="txtHabitosNocivos"></textarea>
            
            <h3>Examen Fisicos General</h3>
            Talla: <input type="number" step="any" name="txtTalla">metros
            IMC: <input type="number" step="any" name="txtIMC">
            Amputación: 
            <select name="cboAmputacion">
                <option value="true">SI</option>
                <option value="false">No</option>
            </select>
            
            Ubicación: <input type="text" name="txtUbicacionAmputacion">
            
            N° Calzado: <input type="number" name="txtNumCalzado">
            
            Varices Extremo Inferior: 
            <select name="cboVaricesExtremoInferior">
                <option value="true">SI</option>
                <option value="false">No</option>
            </select>
            
            Heridas:
            <select name="cboHeridas">
                <option value="true">SI</option>
                <option value="false">No</option>
            </select>
            
            Ubicación: <input type="text" name="txtUbicacionHeridas">
            Tipo: <input type="text" name="txtTipoHeridas">
            Tratamiento:
            <select name="cboTratamiento">
                <option value="true">SI</option>
                <option value="false">No</option>
            </select>
            
            Nevos: 
            <select name="cboNevos">
                <option value="true">SI</option>
                <option value="false">No</option>
            </select>
            
            Ubicación: <input type="text" name="txtUbicacionNevos">
            
            Máculas:
            <select name="cboMaculas">
                <option value="true">SI</option>
                <option value="false">No</option>
            </select>
            
            Tipo: <input type="text" name="txtTipoMaculas">
            
            <input type="submit" value="Registrar Ficha">
        </form>
    </body>
</html>
