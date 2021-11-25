<%-- 
    Document   : metas
    Created on : 22/11/2021, 9:08:53 p. m.
    Author     : Carolina Bernal
--%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="logica.Metas"%>
<%@page import="logica.ColeccionMetas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>CUENTOMISLUKAS.COM/PAGINADEMETAS </title>
    <link rel="stylesheet" href="EstilosPP.css">
</head>
<body>
    <header class="block">
        <ul class="header-menu horizontal-list">
              <li>
                <a class="header-menu-tab" href=""><img class ="logo" src="imagenes_cuida/logomenu.png" width="310px" alt=""></a>
            </li>
            <li>

            <li>
                <a class="header-menu-tab" href="/mavenproject4/Home.jsp"><span class="fas fa-home"></span> INICIO</a>
            </li>
            <li>
                <a class="header-menu-tab" href="/mavenproject4/Ingresos.jsp"><span class="fas fa-wallet"></span> INGRESOS</a>
            </li>
               <li>
                <a class="header-menu-tab" href="/mavenproject4/presupuesto.jsp"><span class="fas fa-file-invoice-dollar"></span> EGRESOS</a>
            </li>
            <li>
                <a class="header-menu-tab" href="/mavenproject4/Ahorro.jsp"><span class="fas fa-piggy-bank"></span> AHORRO</a>
                <!--<a class="header-menu-number" href="#4">5</a>-->
            </li>
            <li>
                <a class="header-menu-tab" href="/mavenproject4/metas.jsp"><span class="fas fa-bullseye"></span> <u>METAS</u></a>
            </li>
            <li>
                <a class="header-menu-tab" href="#5"><span class="fas fa-user-cog"></span> CONFIGURACIÓN</a>
            </li>
        </ul>  
        
        <div class="profile-menu">
            <p>USUARIO <a href="#26"></a></p>
            <div class="profile-picture small-profile-picture">
                <img width="40px" alt="img usuario" src="imagenes_cuida/logoprot.png">
            </div>
            <p><a href="index.jsp">Salir</a></p>
        </div>
    </header>

    <!-- SECCIÓN DE METAS-->
    <div class="card-body">
        <hr style="color: #0056b2;" />
        <!--h1>METAS</h1>-->
    </div>
    
    <%
        String accion;
        int id = 0;
        String nombre = "";
        double valorTotal = 0.0;
        double valorParcial = 0.0;
        String fechaObjetiva = "";
        
        if(request.getParameter("accion") == null){
            id = 0;
        }
        else {
            id = Integer.parseInt(request.getParameter("id"));
            ColeccionMetas colMet = new ColeccionMetas();
            Metas mts = colMet.cargarUnaMeta(id);
            nombre = mts.getNombre();
            valorTotal = mts.getValorTotal();
            valorParcial = mts.getValorParcial();
            fechaObjetiva = mts.getFechaObjetiva();
        }      
    %>

    <div class="d-flex row justify-content-center">
        
        <div class="col-sm-7">
            <div class="card">
                <!-- Formulario para registrar proyeccion de Metas-->
                <form method="POST" action="registroMetas.jsp">
                    <div class="card-body">
                        <!-- Titulo de la sección de registro de Metas-->
                        <div class="form-group">
                            <h1 for="txtTituloEgresos" style="color:#1f253d"><i class="fas fa-bullseye"></i> REGISTRO DE METAS</h1>
                        </div>
                         
                        <hr style="color: #0056b2;" />
                        
                        <div class="text-center">
                            <span>
                                En esta sección podrás registrar y planear diferentes objetivos según tus prioridades y de esta manera realizar un plan de ahorros para poder alcanzar cada uno de ellos.
                                Recuerda que para poder registrar una meta deberas tener en cuenta tu valor residual mensual luego de hacer un cruce entre los ingresos y egresos y además tu plan de ahorros.
                            </span>
                        </div>
                      
                        <hr style="color: #0056b2;" />
                        <!-- ID de la Meta-->
                        <div class="row mb-3 row justify-content-center">
                            <label for="txtIdMetas" class="col-form-label col-sm-4 "><i class="fas fa-barcode"></i> Codigo de la Meta</label>
                            <input type="text" class="form-control col-sm-5" id="txtIdMetas" name="txtIdMetas" value="<%= id %>" readonly>
                        </div>
                        <!-- Nombre-->
                        <div class="row mb-3 row justify-content-center">
                            <label for="txtNombre" class="col-form-label col-sm-4 "><i class="fas fa-file-alt"></i> Nombre</label>
                            <input type="text" class="form-control col-sm-5" id="txtNombre" name="txtNombre" value="<%= nombre %>"  placeholder="Nombre corto">
                        </div>             
                        <!-- Valor Total de la Meta-->
                        <div class="row mb-3 row justify-content-center">
                            <label for="txtValorTotalMeta" class="col-form-label col-sm-4 "><i class="fas fa-dollar-sign"></i> Valor Total</label>
                            <input type="text" class="form-control col-sm-5" id="txtValorTotalMeta" name="txtValorTotalMeta" value="<%= valorTotal %>" required placeholder="Valor">
                        </div> 
                        <!-- Valor ahorrado para la Meta-->
                        <div class="row mb-3 row justify-content-center">
                            <label for="txtValorParcialMeta" class="col-form-label col-sm-4 "><i class="fas fa-money-bill-wave"></i> Dinero Ahorrado</label>
                            <input type="text" class="form-control col-sm-5" id="txtValorParcialMeta" name="txtValorParcialMeta" value="<%= valorParcial %>" required placeholder="Valor">
                        </div> 
                        <!-- Fecha Objetiva de la Meta-->
                        <div class="row mb-3 row justify-content-center">
                            <label for="dtpFechaObjetivaMeta" class="col-form-label col-sm-4"><i class="far fa-calendar-alt"></i> Fecha Objetiva</label>
                            <input type="date" class="form-control col-sm-5" id="dtpFechaObjetivaMeta" name="dtpFechaObjetivaMeta" value="<%= fechaObjetiva %>" required>
                        </div> 
                        
                        <!-- Sección de botones-->
                        <div class="card-footer row justify-content-center">
                            <div>
                                <input type="submit" id="btnSubmit" name="btnSubmit" value="Agregar" class="btn btn-success">
                                <input type="submit" id="btnSubmit" name="btnSubmit" value="Actualizar" class="btn btn-info">
                            </div>
                        </div>
                    </div>
                </form>    
            </div> 
        </div>
        
    </div>
    
    <!-- LINEA SEPARADORA-->
    <div class="card-body">
        <hr style="color: #0056b2;" />
        <!--h1>METAS</h1>-->
    </div>
    
    
     <!-- SECCIÓN METAS REGISTRADAS-->
    <div  class="row justify-content-center">
            <div class="col-xl-8">
                <% 
                    DecimalFormat df = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
                    ColeccionMetas objetivos = new ColeccionMetas();
                    boolean hayDatos = objetivos.cargarMetas();
                    if (hayDatos) {
                        for (Metas goals : objetivos.getLista()) {%>
                <div class="card" style="border-radius: 7px;">              
                    <div class="card-content">               
                        <div class="card-body">                   
                            <div class="media d-flex">
                                <%
                                    //Obtener la fecha actual
                                    Date fechaActual = new Date();
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                                    //Calcular los días restantes entre la fecha actual y la fecha objetiva
                                    Calendar cal1 = new GregorianCalendar();
                                    Calendar cal2 = new GregorianCalendar();
                                    long diasRestantes = 0;

                                    cal1.setTime(fechaActual);
                                    Date fechaLimite = sdf.parse(goals.getFechaObjetiva());
                                    cal2.setTime(fechaLimite);

                                    diasRestantes = ((fechaLimite.getTime() - fechaActual.getTime()) / (1000 * 60 * 60 * 24));

                                %>
                                <div class="media-body text-left">
                                    <h3 class="success row-ms-2"><%= goals.getNombre()%></h3>
                                    <label>Fecha Objetiva: </label> <span><%= goals.getFechaObjetiva()%></span> <br>
                                    <label>Días Restantes: </label> <span><%= diasRestantes %></span> <br>
                                    <label>Dinero Ahorrado: </label> <span>$<%= df.format(goals.getValorParcial())%></span> <label>de </label> <span>$<%= df.format(goals.getValorTotal())%></span>
                                </div>
                            </div>
                            <%
                                DecimalFormat porciento = new DecimalFormat("##.#");
                                double progresoMeta = (goals.getValorParcial() * 100) / goals.getValorTotal();
                            %>    
                            <div class="progress" style="height: 15px;">
                                <%
                                if (progresoMeta <= 25) { %>
                                <div class="progress-bar bg-danger" role="progressbar" style="width: <% out.print(progresoMeta); %>%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="<%out.print(progresoMeta); %>"><% out.print(porciento.format(progresoMeta)); %>%</div>
                                <%    } else if (progresoMeta > 25 && progresoMeta <= 50) { %>
                                <div class="progress-bar bg-warning" role="progressbar" style="width: <% out.print(progresoMeta); %>%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="<%out.print(progresoMeta); %>"><% out.print(porciento.format(progresoMeta)); %>%</div>
                                <%    } else if (progresoMeta > 50 && progresoMeta <= 75) {%>
                                <div class="progress-bar bg-info" role="progressbar" style="width: <% out.print(progresoMeta); %>%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="<%out.print(progresoMeta); %>"><% out.print(porciento.format(progresoMeta)); %>%</div>
                                <%    } else {%>
                                <div class="progress-bar bg-success" role="progressbar" style="width: <% out.print(progresoMeta); %>%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="<%out.print(progresoMeta); %>"><% out.print(porciento.format(progresoMeta)); %>%</div>
                                <%    } %>
                            </div>
                        </div>
                    </div>
                </div>      
                <% } %>
                <% } else {%>
                <div class="row justify-content-center media-body text-left">
                    <h3 class="success " style="">Sin metas registradas</h3>
                </div>
                <% }%>
            </div>
    </div>

</body>
</html>