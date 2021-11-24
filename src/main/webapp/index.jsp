<%-- 
    Document   : login
    Created on : 19/09/2021, 1:24:27 a. m.
    Author     : Carolina Bernal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logica.ColeccionRegistro"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- titulo pestaÃ±a  -->
        <title>CUIDOMISLUKAS.COM/LOGIN</title>
        <!-- aÃ±adir logo  -->
        <link rel="icon" href="imagenes_cuida/logopeque§o.jpg" type="image/jpg">
        <link href="EstilosLog.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="login-wrap">
            <div class="login-html">
                <!-- cracion de dos tablas una de ingreso y otra de registro   -->  
                <!-- ingreso -->
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Ingresar </label>
                <!-- registro  -->
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">inscribirse</label>

                <!-- creacion formulario  -->

                <div class="login-form">
                    <form method="post" action="validarctr.jsp">
                        <div class="sign-in-htm">
                            <!-- Usuario  -->
                            <div class="group">
                                <label for="txtUser" class="label">Usuario</label>
                                <input id="txtUser" name="txtUser" type="text" class="input" required>
                            </div>
                            <!-- ContraseÃ±a  -->
                            <div class="group">
                                <label for="txtPass" class="label">Contraseña</label>
                                <input id="txtPass" name="txtPass" type="password" class="input" data-type="password" required>
                            </div>
                            <!--Mantenme registrado -->
                            <div class="group">
                                <input id="check" name="check" type="checkbox" class="check" checked>
                                <label for="check"><span class="icon"></span> Mantenerme registrado</label>
                            </div>
                             <!--  boton ingresar  -->
                            <div class="group">
                                <button type="submit" class="button" name="accion" value="Ingresar"> Ingresar</button>
                                <!--<input type="submit" class="button" value="Ingresar">  -->
                            </div>
                            <!-- logo -->
                            <div align="center"> <img class="logo" src="imagenes_cuida/logo.png" alt=""></div>
                           
                            <!--  olvidaste tu ContraseÃ±a  -->
                            <div class="foot-lnk">     
                                <a href="#forgot">¿OLVIDASTE TU ClAVE DE ACCESO?</a>   
                            </div>
                             <div class="hr"></div>
                        </div>
                    </form>

                    <!-- inicio tabla de REGISTRO-->
                    <form method="post" action="registro_ctrl.jsp">
                        <div class="sign-up-htm">
                             <!--Nombre-->
                            <div class="group">
                                <label for="txtNombre" class="label">Nombre</label>
                                <input id="txtNombre" name="txtNombre" type="text" class="input" required>
                            </div>
                            <!--Apellido-->
                            <div class="group">
                                <label for="txtApellido" class="label">Apellido</label>
                                <input id="txtApellido" name="txtApellido" type="text" class="input" required>
                            </div>
                            <!-- Documento-->
                            <div class="group">
                                <label for="txtDocumento" class="label">Documento</label>
                                <input id="txtDocumento" name="txtDocumento" type="text" class="input" required>
                            </div>
                           
                            <!--Fecha Nacimiento-->
                            <div class="group">
                                <label for="txtFechaNacimiento" class="label">Fecha de Nacimiento</label>
                                <input id="txtFechaNacimiento" name="txtFechaNacimiento" type="date" class="input" required>
                            </div>
                            <!-- Genero -->
                            <div class="group">
                                <label for="txtGenero" class="label">Genero</label>
                                <br>
                                <div class="radio"> 
                                    <input type="radio" class="Genero" name="radGenero" id="radGenero1" value="1" required>
                                    <label for="radGenero1">FEMENINO</label>
                                    <input type="radio" class="Genero" name="radGenero" id="radGenero2" value="2">
                                    <label for="radGenero2">MASCULINO</label>
                                    <input type="radio" class="Genero" name="radGenero" id="radGenero3" value="3">
                                    <label for="radGenero3">OTRO</label></div>
                            </div>
                            <br>
                            <!-- Email -->
                            <div class="group">
                                <label for="txtEmail" class="label">Correo Electronico</label>
                                <input id="txtEmail" name="txtEmail" type="text" class="input" required>
                            </div>
                            <!-- Usuario -->
                            <div class="group">
                                <label for="txtUsuario" class="label">Nombre de Usuario</label>
                                <input id="txtUsuario" name="txtUsuario" type="text" class="input" required>
                            </div>
                            <!-- Contraseña   -->
                            <div class="group">
                                <label for="txtPassword" class="label">Clave de Acceso</label>
                                <input id="txtPassword" name="txtPassword" type="password" class="input" data-type="password" required>
                            </div>
                            <!-- boton inscribirse  -->                       
                            <div class="group">
                                <input type="submit" class="button" id="btnSubmit" onclick="login()" name="btnSubmit" value="REGISTRAR NUEVO USUARIO">
                                <br>
                            <div class="foot-lnk"> 
                                    <a href="index.jsp">¿YA ESTAS REGISTRADO?</a>   
                            </div>

                            </div>
                    </form>    
                </div>
            </div>
        </div>
    </body>
</html>
