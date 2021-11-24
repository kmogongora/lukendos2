<%-- 
    Document   : eliminaconEgreso
    Created on : 29/09/2021, 5:25:46 p. m.
    Author     : Carolina Bernal
--%>
<%@page import="persistencia.EgresoDAO"%>
<%@page import="logica.Egreso"%>
<%@page import="logica.ColeccionEgreso"%>
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
            ColeccionEgreso colEgreso =  new ColeccionEgreso();
            
            boolean eliminado = colEgreso.eliminarEgresoExistente(id);
            if (eliminado == true) {
                response.sendRedirect("presupuesto.jsp");
            }
            else {
                out.println("Información de Egreso no se guardó.");
            }
        %>
    </body>
</html>
