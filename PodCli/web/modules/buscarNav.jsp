<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String texto = request.getParameter("txtBuscar");

if(texto == null){
    texto = "";
}
%>

<ul class="nav navbar-nav navbar-right">
    <li>
        <form class="navbar-form pull-right" role="search" action="buscarPaciente.jsp" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Buscar por run o nombre" name="txtBuscar" required="" value="<%=texto%>">
            </div>
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
        </form>
    </li>
</ul>