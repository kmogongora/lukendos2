<%-- 
    Document   : registro_ctrl
    Created on : 19/09/2021, 1:27:17 a. m.
    Author     : Carolina Bernal
--%>
<%@page import="logica.Usuario"%>
<%@page import="logica.ColeccionRegistro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body>
        <%
        String id = request.getParameter("txtId");
            String documento = request.getParameter("txtDocumento");
            String nombre = request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String fechaNacimiento = request.getParameter("txtFechaNacimiento");
            int idGenero = Integer.parseInt(request.getParameter("radGenero"));
            String email = request.getParameter("txtEmail");
            String usuario = request.getParameter("txtUsuario");
            String clave = request.getParameter("txtPassword");
            String estado = "Activo";
            int rol = 3;
            
            String accion = request.getParameter("btnSubmit");
            if (accion.equals("REGISTRAR NUEVO USUARIO")) {
                Usuario user = new Usuario(documento, nombre, apellido, fechaNacimiento, idGenero, email, usuario, clave, estado, rol);
                ColeccionRegistro coleccion = new ColeccionRegistro();
                boolean guardado = coleccion.guardarUsuario(user);
                if (guardado == true) {
        %>
        <div class="alert alert-success" role = "alert"> 
            A simple success alert—check it out! 
        </div> 
        <%
                    
                    response.sendRedirect("index.jsp");
                } else {
                    out.println("Informacion de usuario no se guardo, intentalo de nuevo o contacta a servicio tecnico");
                }
            }
        %>
    </body>
</html>
