<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.bd.Usuario"%>
<%@page import="model.bd.Data"%>

<p class="navbar-text">
<%    
    Data d2 = new Data();
    Usuario user = (Usuario) request.getSession().getAttribute("usuario");
    out.println("["+ user.getNombre()+" - "+d2.getPerfil(user.getPerfil())+"]");
%>
</p>