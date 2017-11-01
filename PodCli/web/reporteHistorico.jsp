<%@page import="model.bd.DatosReporteUso"%>
<%@page import="java.util.List"%>
<%@page import="model.bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte</title>
        <!-- Esto es del calendario JQUERY -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- Esto es del calendario JQUERY -->
        <script>
            $(function () {
                $("#fecIni").datepicker();
                $("#fecIni").datepicker({
                    dateFormat: "dd-mm-yy"
                });

                // Getter
                var dateFormat = $("#fecIni").datepicker("option", "dateFormat");

                // Setter
                $("#fecIni").datepicker("option", "dateFormat", "dd 'de' MM 'de' yy");
                
                
                $("#fecFin").datepicker();
                $("#fecFin").datepicker({
                    dateFormat: "dd-mm-yy"
                });

                // Getter
                var dateFormat = $("#fecFin").datepicker("option", "dateFormat");

                // Setter
                $("#fecFin").datepicker("option", "dateFormat", "dd 'de' MM 'de' yy");
            });
        </script>
        
        <script>
            // español
            $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '<Ant',
                nextText: 'Sig>',
                currentText: 'Hoy',
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

        </script>
    </head>
    <body>
        <h1>Reporte histórico</h1>
        <form action="reporteHistorico.jsp" method="post">
            <input id="fecIni" name="fecIni" required="">
            <input id="fecFin" name="fecFin" required="">
            <input type="submit" value="Procesar" name="btnProcesar">
        </form>
        
        <%
        if(request.getParameter("btnProcesar") != null){
            Data d = new Data();
            String fecIni = request.getParameter("fecIni");
            String fecFin = request.getParameter("fecFin");
            
            String[] vectFecha = fecIni.split(" de ");
            String fecIniFormated = vectFecha[2] + "-" + d.getMes(vectFecha[1].toLowerCase()) + "-" + vectFecha[0];
            
            vectFecha = fecFin.split(" de ");
            String fecFinFormated = vectFecha[2] + "-" + d.getMes(vectFecha[1].toLowerCase()) + "-" + vectFecha[0];
            
            List<DatosReporteUso> datos = d.getDatosReporteUso(fecIniFormated, fecFinFormated);
        %>
        Desde el [<b><%=fecIni%></b>] hasta el [<b><%=fecFin%></b>]
        <table>
            <tr>
                <th>Rut</th>
                <th>Nombre</th>
                <th>Nº Fichas</th>
                <th>Nº Atenciones</th>
            </tr>
            
            
          <%for (DatosReporteUso dru : datos) {%>
            <tr>
                <td><%= dru.getRut() %></td>
                <td><%= dru.getNombre()%></td>
                <td><%= dru.getCantidadFichas()%></td>
                <td><%= dru.getCantidadAtencionesPodologicas() %></td>
            </tr>
          <%}
          
        } // cierre del if%>
           
        </table>
        
        <a href="crearFicha.jsp">Volver</a>
    </body>
</html>
