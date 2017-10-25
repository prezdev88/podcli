<%-- 
    Document   : inicioSesion
    Created on : 25-oct-2017, 13:32:36
    Author     : Edunaldo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio Sesión</title>
    </head>
    <body>
        <h1>Inicio Sesión</h1>
        <form action="iniciarSesion.do" method="post"> 
            
            <input type="text" name="txtRut">
            <input type="submit" value="Inicio Sesión">
        </form>
        <%
            Error e = (Error)request.getSession().getAttribute("error");
            if(e != null){
                out.println(e.getMessage());
            }

        %>
    </body>
</html>
