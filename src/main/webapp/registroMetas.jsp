<%-- 
    Document   : registroMetas
    Created on : 22/11/2021, 9:07:32 p. m.
    Author     : Carolina Bernal
--%>

<%@page import="logica.Metas"%>
<%@page import="persistencia.MetasDAO"%>
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
            String id = request.getParameter("txtIdMetas");
            String nombre = request.getParameter("txtNombre");  
            double valorTotal = Double.parseDouble(request.getParameter("txtValorTotalMeta"));
            double valorParcial = Double.parseDouble(request.getParameter("txtValorParcialMeta"));
            String fechaObjetiva = request.getParameter("dtpFechaObjetivaMeta");
            int idUsuario = 1;
            String accion = request.getParameter("btnSubmit");
            Metas objetivo = null;
            
            if (accion.equals("Agregar")) {
                objetivo = new Metas(nombre, valorTotal, valorParcial, fechaObjetiva, idUsuario);
            }
            else if (accion.equals("Actualizar")){
                int idMeta = Integer.parseInt(id);
                objetivo = new Metas(idMeta,nombre, valorTotal, valorParcial, fechaObjetiva, idUsuario);
            }                   
            
            ColeccionMetas goals = new ColeccionMetas();
            boolean guardado = goals.guardarNuevaMeta(objetivo);
            if (guardado == true) {
                response.sendRedirect("metas.jsp");
            }
            else {
                out.println("La información de la meta no se guardó.");
            }           
        %>
    </body>
</html>