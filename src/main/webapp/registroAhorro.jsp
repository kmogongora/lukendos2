<%-- 
    Document   : registroAhorro
    Created on : 22/09/2021, 5:24:39 p. m.
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
            int id  = Integer.parseInt(request.getParameter("txtId"));
            String fechaAhorro = request.getParameter("dtpFechaAhorro");
            double valorAhorro = Double.parseDouble(request.getParameter("txtValorAhorro"));
            String descripcion = request.getParameter("txtDescripcion");
            int idUsuario = 1;
            String accion = request.getParameter("btnSubmit");
            Ahorro spend = null;
            
            if (accion.equals("Agregar")) {
                spend = new Ahorro(fechaAhorro, valorAhorro, descripcion, idUsuario);
            }
            else if (accion.equals("Actualizar")){
                spend = new Ahorro(id, fechaAhorro, valorAhorro, descripcion, idUsuario);
            }                   
            
            ColeccionAhorro colection = new ColeccionAhorro();
            boolean guardado = colection.guardarNuevoAhorro(spend);
            if (guardado == true) {
                response.sendRedirect("Ahorro.jsp");
            }
            else {
                out.println("Información de Ahorro no se guardó.");
            }           
        %>
    </body>
</html>
