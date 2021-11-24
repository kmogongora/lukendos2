<%-- 
    Document   : registroEgreso
    Created on : 22/09/2021, 5:24:39 p. m.
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
            int id  = Integer.parseInt(request.getParameter("txtId"));
            String tipoEgreso = request.getParameter("radTipoEgreso");
            int idCategoriaEgreso = Integer.parseInt(request.getParameter("selCategoriaEgreso"));
            String fechaEgreso = request.getParameter("dtpFechaEgreso");
            double valorEgreso = Double.parseDouble(request.getParameter("txtValorEgreso"));
            String descripcion = request.getParameter("txtDescripcion");
            int idUsuario = 1;
            String accion = request.getParameter("btnSubmit");
            Egreso spend = null;
            
            if (accion.equals("Agregar")) {
                spend = new Egreso(tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario);
            }
            else if (accion.equals("Actualizar")){
                spend = new Egreso(id, tipoEgreso, idCategoriaEgreso, fechaEgreso, valorEgreso, descripcion, idUsuario);
            }                   
            
            ColeccionEgreso colection = new ColeccionEgreso();
            boolean guardado = colection.guardarNuevoEgreso(spend);
            if (guardado == true) {
                response.sendRedirect("presupuesto.jsp");
            }
            else {
                out.println("Información de Egreso no se guardó.");
            }           
        %>
    </body>
</html>
