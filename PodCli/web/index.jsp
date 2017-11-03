<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>JSP Page</title>
    </head>

    <body>
        <h1>Atencion Podológica</h1>
        <p>Bienvenid@ al sistema de atención podológica de Santo Tomás Rancagua.
            Para comenzar escriba su rut y luego presione Entrar</p>

        <form action="iniciarSesion.do" method="post">
            <input id="rut" type="text" name="rut" placeholder="EJ: 12345678-k" required="">                                        
            <input type="submit" value="Entrar">
        </form>
        <%
            Error e = (Error) request.getSession().getAttribute("error");
            if (e != null) {
                out.println(e.getMessage());
                request.getSession().removeAttribute("error");
            }

        %>
    </body>
</html>
