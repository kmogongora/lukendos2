<%-- 
    Document   : eliminacionMetas
    Created on : 24/11/2021, 1:57:13 p. m.
    Author     : Carolina Bernal
--%>

<%@page import="persistencia.MetasDAO"%>
<%@page import="logica.Metas"%>
<%@page import="logica.ColeccionMetas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            ColeccionMetas colectMet =  new ColeccionMetas();
            
            boolean eliminado = colectMet.eliminarMetaExistente(id);
            if (eliminado == true) {
                response.sendRedirect("metas.jsp");
            }
            else {
                out.println("Información de Egreso no se guardó.");
            }
        %>
    </body>
</html>
