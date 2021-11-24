<%-- 
    Document   : usuarios_lista
    Created on : 18/09/2021, 1:05:40 p. m.
    Author     : Carolina Bernal
--%>
<%@page import="logica.Usuario"%>
<%@page import="logica.ColeccionRegistro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>Lista de Usuarios</title>
    </head>
    <body>
        <div class="container mt-5"> 
            <h3 class="mb-3">Lista de Usuarios</h3>
            <hr>
            <div class="row">
                <form class="col-sm-10">
                    <div class="row mb-3">
                        <label for="txt1" class="col-form-label col-sm-2">Filtrar por nombre</label>
                        <input type="text" class="col-form-control col-sm-9" id="txt1" name="txt1" value="">
                        <button type="button" class="btn btn-light col-sm-1"><i class="bi bi-search"></i></button>                    
                    </div>
                </form>
                <a href="login.jsp" class="col-sm-2"><button type="submit" class="btn btn-primary" id="btnNuevo">Nuevo Usuario</button></a>
            </div>
            <form>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Documento</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Fecha Nacimiento</th>
                            <th scope="col">Género</th>
                            <th scope="col">Email</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Clave</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Rol</th>
                        </tr>
                    </thead>
                    <%
                        ColeccionRegistro coleccion = new ColeccionRegistro();
                        boolean hayDatos = coleccion.cargarUsuarios();
                    %>
                    <tbody>
                        <% if (hayDatos) { %>
                        <% for (Usuario user : coleccion.getLista()) {%>
                        <tr>
                            <td scope="row"><%= user.getId()%></td>
                            <td><%= user.getDocumento()%></td>
                            <td><%= user.getNombre()%></td>
                            <td><%= user.getApellido()%></td>
                            <td><%= user.getFechaNacimiento()%></td>
                            <td><%= coleccion.getGeneroUsuario(user.getIdGenero())%></td>
                            <td><%= user.getEmail()%></td>
                            <td><%= user.getNombreUsuario()%></td>
                            <td><%= user.getClaveAcceso()%></td>
                            <td><%= user.getEstado()%></td>
                            <td><%= coleccion.getTipoUsuario(user.getIdRol()) %></td>
                            <td>
                                <button type="button" class="btn btn-success"><i class="bi bi-pencil-fill"></i></button>
                                <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>
                        <% } %>
                        <% } else { %>
                        <tr>
                            <td colspan="5">No hay datos</td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
