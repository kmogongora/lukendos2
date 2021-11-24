<%-- 
    Document   : eliminaconAhorro
    Created on : 29/09/2021, 5:25:46 p. m.
    Author     : Carolina Bernal
--%>
<%@page import="persistencia.AhorroDAO"%>
<%@page import="logica.Ahorro"%>
<%@page import="logica.ColeccionAhorro"%>
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
            ColeccionAhorro colAhorro =  new ColeccionAhorro();
            
            boolean eliminado = colAhorro.eliminarAhorroExistente(id);
            if (eliminado == true) {
                response.sendRedirect("Ahorro.jsp");
            }
            else {
                out.println("Información de Ahorro no se guardó.");
            }
        %>
    </body>
</html>
