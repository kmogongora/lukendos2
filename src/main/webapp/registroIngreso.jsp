<%-- 
    Document   : registroEgreso
    Created on : 22/09/2021, 5:24:39 p. m.
    Author     : Carolina
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
            int id  = Integer.parseInt(request.getParameter("txtId"));
            String tipoIngreso = request.getParameter("radTipoIngreso");
            int idCategoriaIngreso = Integer.parseInt(request.getParameter("selCategoriaIngreso"));
            String fechaIngreso = request.getParameter("dtpFechaIngreso");
            double valorIngreso = Double.parseDouble(request.getParameter("txtValorIngreso"));
            String descripcion = request.getParameter("txtDescripcion");
            int idUsuario = 1;
            String accion = request.getParameter("btnSubmit");
            Ingreso spend = null;
            
            
            if (accion.equals("Agregar")) {
                spend = new Ingreso(tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario);
            }
            else if (accion.equals("Actualizar")){
                spend = new Ingreso(id, tipoIngreso, idCategoriaIngreso, fechaIngreso, valorIngreso, descripcion, idUsuario);
            }                   
            
            ColeccionIngreso colection = new ColeccionIngreso();
            boolean guardado = colection.guardarNuevoIngreso(spend);
            if (guardado == true) {
                response.sendRedirect("Ingresos.jsp");
            }
            else {
                out.println("Información de Egreso no se guardó.");
            }           
        %>
        <a href="Ingresos.jsp"><button type="submit" class="btn btn-primary" id="btnSubmit">Volver a los Ingresos</button></a>
    </body>
</html>
