<%-- 
    Document   : eliminaconIngreso
    Created on : 29/09/2021, 5:25:46 p. m.
    Author     : Carolina Bernal
--%>
<%@page import="persistencia.IngresoDAO"%>
<%@page import="logica.Ingreso"%>
<%@page import="logica.ColeccionIngreso"%>
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
            ColeccionIngreso colIngreso =  new ColeccionIngreso();
            
            boolean eliminado = colIngreso.eliminarIngresoExistente(id);
            if (eliminado == true) {
                response.sendRedirect("Ingresos.jsp");
            }
            else {
                out.println("Información de Ingreso no se guardó.");
            }
        %>
    </body>
</html>
