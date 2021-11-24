<%-- 
    Document   : validarctr
    Created on : 11/11/2021, 3:20:10 p. m.
    Author     : Carolina Bernal
--%>

<%@page import="logica.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            UsuarioDAO dao = new UsuarioDAO();
            Usuario us = new Usuario();
            int r;
            
            String accion = request.getParameter("accion");
        
            if(accion.equals("Ingresar")){
            String usu = request.getParameter("txtUser");
            String contra= request.getParameter("txtPass");
            us.setNombreUsuario(usu);
            us.setClaveAcceso(contra);
            r = dao.validar(us);
            if (r==1) {
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            } else{
                 request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
       %>
    </body>
</html>
