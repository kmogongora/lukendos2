<%-- 
    Document   : Home
    Created on : 5/10/2021, 3:19:16 p. m.
    Author     : camilogongora
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="logica.Egreso"%>
<%@page import="logica.ColeccionEgreso"%>
<%@page import="logica.Ingreso"%>
<%@page import="logica.ColeccionIngreso"%>
<%@page import="logica.Ahorro"%>
<%@page import="logica.ColeccionAhorro"%>
<%@page import="logica.Calendario"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% Calendario mesActual = new Calendario();

%>



<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <title>CUENTOMISLUKAS.COM/HOME </title>
        <link rel="stylesheet" href="EstilosPP.css">
    </head>
    <body>
        <!-- MENU -->
        <header class="block">
            <ul class="header-menu horizontal-list">
                <li>
                    <a class="header-menu-tab" href=""><img class ="logo" src="imagenes_cuida/logomenu.png" width="310px" alt=""></a>
                </li>
                <li>

                <li>
                    <a class="header-menu-tab" href="/mavenproject4/Home.jsp"><span class="fas fa-home"></span> <u>INICIO</u></a>
                </li>
                <li>
                    <a class="header-menu-tab" href="/mavenproject4/Ingresos.jsp"><span class="fas fa-wallet"></span> INGRESOS</a>
                </li>
                <li>
                    <a class="header-menu-tab" href="/mavenproject4/presupuesto.jsp"><span class="fas fa-file-invoice-dollar"></span> EGRESOS</a>
                </li>
                <li>
                    <a class="header-menu-tab" href="/mavenproject4/Ahorro.jsp"><span class="fas fa-piggy-bank"></span> AHORRO</></a>
                    <!--<a class="header-menu-number" href="#4">5</a>-->
                </li>
                <li>
                    <a class="header-menu-tab" href="/mavenproject4/metas.jsp"><span class="fas fa-bullseye"></span> METAS</a>
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

        <br>
        <%  DecimalFormat df = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
            ColeccionIngreso ingres = new ColeccionIngreso();
            boolean isDate = ingres.cargarIngreso();
            Double sumTotalIngreso = 0.0;
            sumTotalIngreso = ingres.totalIngreso();

            DecimalFormat dfe = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
            ColeccionEgreso egres = new ColeccionEgreso();
            boolean isDatee = egres.cargarEgreso();
            Double sumTotalEgreso = 0.0;
            sumTotalEgreso = egres.totalEgreso();

            String fecha1 = (request.getParameter("dtpFechaDesde") == null) ? "" : request.getParameter("dtpFechaDesde");
            String fecha2 = (request.getParameter("dtpFechaHasta") == null) ? "" : request.getParameter("dtpFechaHasta");

            DecimalFormat df2 = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
            ColeccionAhorro egres2 = new ColeccionAhorro();
            boolean isDate2;
            if (fecha1.equals("") && fecha2.equals("")) {
                isDate = egres2.cargarAhorro();
            } else {
                isDate = egres2.cargarAhorrosPorFiltro(fecha1, fecha2);
            }
            Double sumTotalAhorro = 0.0;
            sumTotalAhorro = egres2.totalAhorro();

            DecimalFormat E_B_F = new DecimalFormat("##.#");
            double ahorroBarra = (sumTotalAhorro * 100) / (sumTotalEgreso * 7);


        %>






        <!-- NOMBRE DE USUARIO Y MES ACTUAL-->
        <div class="d-flex">
            <div class="col-sm-5" >
                <div class="row-ms-3">
                    <div class="card">
                        <div class="card-body">
                            <!-- Titulo contenedor-->
                            <div class="d-flex col-sm-10">
                                <h1 style="color:#1f253d"><i class="fas fa-user-astronaut"></i> <u>Pepe Bocadillo</u></h1>                        
                            </div>
                            <p style="color:#1f253d"> Resumen de <% out.print(mesActual.CalMes());%></p>
                            <hr style="color: #0056b2;" />

                            <!-- DINERO DISPONIBLE -->

                            <!-- Titulo contenedor-->
                            <div class="d-flex col-sm-12">
                                <h1 style="color:#1222a1"><i class="fas fa-money-check-alt"></i> Dinero Disponible </h1>
                            </div>


                            <table class="table" table-hover >
                                <input type="text" id="txtDiferencia" name="txtDiferencia" style="color:#1222a1" class="form-control font-weight-bold" value="$<%= df.format(sumTotalIngreso - sumTotalEgreso)%>"  readonly>

                                <!--BARRAS COMPARATIVAS INGRESOS VS EGRESOS-->

                                <%
                                    double egresoBarra = (sumTotalEgreso * 100) / sumTotalIngreso;%>
                                <% //out.print(egresoBarra); %>
                                <br>
                                <div class="progress">
                                    <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: <% out.print(egresoBarra); %>%" aria-valuenow="<%out.print(egresoBarra); %>" aria-valuemin="0" aria-valuemax="100">EGRESOS <% out.print(E_B_F.format(egresoBarra)); %>%</div>
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">INGRESOS</div>
                                </div>  

                            </table>


                            <!--BARRAS METAS-->
                            <h2 style="color:#1f253d"><span class="fas fa-bullseye"></span> Mis metas </h2>
                            <br>
                            <label>Ahorro para la Vespa</label>
                            <br>
                            <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 22%" aria-valuenow="22" aria-valuemin="0" aria-valuemax="100">22%</div>
                            </div>
                            <br>
                            <label>Regalo Cumple Mamá</label>
                            <br>
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 86%" aria-valuenow="86" aria-valuemin="0" aria-valuemax="100">86%</div>
                            </div>
                            <br>
                            <label>Viaje a Machu Picchu</label>        
                            <br>
                            <div class="progress">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">75%</div>
                            </div>
                            <br>
                            <hr>
                            <!-- Barras indicadoras ahorro -->
                            <div class="form-group">
                                <label>Fondo de Emergencias</label>  
                                <% if (ahorroBarra < 30) {%>

                                <div class="progress">
                                    <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="<% out.print(ahorroBarra);%> " aria-valuemin="0" aria-valuemax="100" style="width: <% out.print(ahorroBarra);%>%"><% out.print(E_B_F.format(ahorroBarra));%>%</div>
                                </div><br>
                                <p style="color:#1f253d; font-size: 14px; text-align: justify"><i class="fas fa-exclamation-triangle"></i> Tu Fondo de Emergencias se ecuentra muy bajo, recuerda que es importate agregar mas dinero para tener disponible en caso de emergencia.</p>
                                <%} else {
                                    if (ahorroBarra >= 30 && ahorroBarra < 70) { %>
                                <div class="progress">
                                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="<% out.print(ahorroBarra);%> " aria-valuemin="0" aria-valuemax="100" style="width: <% out.print(ahorroBarra);%>%"><% out.print(E_B_F.format(ahorroBarra));%>%</div>
                                </div><br>
                                <p style="color:#1f253d; font-size: 14px; text-align: justify"><i class="fas fa-thumbs-up"></i> Tu Fondo de Emergencias va por buen camino, ya casi logras la cifra ideal!.</p>
                                <%

                                } else {
                                %>

                                <div class="progress">
                                    <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="<% out.print(ahorroBarra);%> " aria-valuemin="0" aria-valuemax="100" style="width: <% out.print(ahorroBarra);%>%"><% out.print(E_B_F.format(ahorroBarra));%>%</div>
                                </div><br>
                                <p style="color:#1f253d; font-size: 14px; text-align: justify"><i class="far fa-laugh-beam"></i> Felicitaciones!, Tu Fondo de Emergencias se ecuentra en estado optimo, si embargo agregar un poco mas no le hará daño :D .</p>
                                <%  }
                                    }
                                %>
                            </div>
   
                        </div>
                    </div>
                </div>
            </div>






            <!--TABLA INGRESOS -->            
            <div class="col-sm-7 ml-auto" >
                <div class="card">
                    <div class="card-body">
                        <!-- Titulo contenedor-->
                        <div class="d-flex col-sm-5">
                            <h1 style="color:#1fc202"><i class="fas fa-tasks"></i> Listado de Ingresos</h1>
                        </div>
                        <hr style="color: #0056b2;" />
                        <!-- Sección de filtro-->                                    
                        <form method="GET" action = "Home.jsp">
                            <div class="form-group d-flex">
                                <div class="mb-3 col-sm-7 d-flex">
                                    <label for="lblFechaFiltro" class="col-form-label col-sm-2">De </label>
                                    <input type="date" class="form-control col-sm-7" id="txtFechaDesde" name="txtFechaDesde" >
                                    <label for="lblFehaFiltro" class="col-form-label col-sm-2"> A </label>
                                    <input type="date" class="form-control col-sm-7" id="txtFechaHasta" name="txtFechaHasta" >
                                    <label for="lblFehaFiltro" class="col-form-label col-sm-1"></label>
                                    <button type="button" id="btnFiltroIngreso" class="btn btn-success"><i class="fas fa-search"></i></button>
                                </div> 
                            </div>
                        </form> 
                        <!-- Tabla para mostrar los registros de Ingresos-->
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tipo</th>
                                    <th>Categoria</th>
                                    <th>Fecha</th>
                                    <th>Descripción</th>
                                    <th>Valor</th>
                                    <!--<th>Acciones</th>-->                    
                                </tr>
                            </thead>

                            <tbody>
                                <% if (isDate

                                
                                    ) { %>
                                <% for (Ingreso spend : ingres.getLista()) {%>
                                <tr>
                                <tr>
                                    <td scope="row"><%= spend.getId()%></td>
                                    <td class=""><%= spend.getTipoIngreso()%></td>
                                    <td><%= ingres.getCategoriaIngreso(spend.getIdCategoriaIngreso())%></td>
                                    <td><%= spend.getFechaIngreso()%></td>
                                    <td><%= spend.getDescripcion()%></td>
                                    <td>$<%= df.format(spend.getValorIngreso())%></td>
                                    <!--<td class="d-flex">
                                        <button type="button" class="btn btn-success"><i class="fas fa-pencil-alt"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                                    </td>-->
                                </tr>
                                <% } %>
                                <% }

                                
                                
                                else { %>
                                <tr>
                                    <td colspan="5">No hay datos</td>
                                </tr>
                                <% }%>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- Pie de pagina del contenedor-->
                    <div class="card-footer d-flex">


                        <!-- Total de Ingresos-->
                        <div class="col-sm-3 ml-auto">
                            <label style="font-size:16px">TOTAL INGRESOS</label>
                            <input type="text" id="txtTotalIngresos" style="color:#1fc202" name="txtTotalIngresos" class="form-control font-weight-bold" value="$<%= df.format(sumTotalIngreso)%>"  readonly>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>

        <!--TABLE EGRESOS -->

        <div class="col-sm-7 ml-auto" >
            <div class="card">
                <div class="card-body">
                    <!-- Titulo contenedor-->
                    <div class="d-flex col-sm-5">
                        <h1 style="color:#bd0202"><i class="far fa-list-alt"></i> Listado de Egresos</h1>
                    </div>
                    <hr style="color: #0056b2;" />
                    <!-- Sección de filtro-->                                    
                    <form method="GET" action = "Home.jsp">
                        <div class="form-group d-flex">
                            <div class="mb-3 col-sm-7 d-flex">
                                <label for="lblFechaFiltro" class="col-form-label col-sm-2">De </label>
                                <input type="date" class="form-control col-sm-7" id="dtpFechaDesde" name="dtpFechaDesde" >
                                <label for="lblFehaFiltro" class="col-form-label col-sm-2"> A </label>
                                <input type="date" class="form-control col-sm-7" id="dtpFechaHasta" name="dtpFechaHasta" >
                                <label for="lblFehaFiltro" class="col-form-label col-sm-1"></label>
                                <button type="button" id="btnFiltroEgreso" class="btn btn-success"><i class="fas fa-search"></i></button>
                            </div> 
                        </div>
                    </form> 
                    <!-- Tabla para mostrar los registros de Egresos-->
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Tipo</th>
                                <th>Categoria</th>
                                <th>Fecha</th>
                                <th>Descripción</th>
                                <th>Valor</th>
                                <!--<th>Acciones</th>-->                    
                            </tr>
                        </thead>

                        <tbody>
                            <% if (isDatee

                            
                                ) { %>
                            <% for (Egreso spend : egres.getLista()) {%>
                            <tr>
                            <tr>
                                <td scope="row"><%= spend.getId()%></td>
                                <td class=""><%= spend.getTipoEgreso()%></td>
                                <td><%= egres.getCategoriaEgreso(spend.getIdCategoriaEgreso())%></td>
                                <td><%= spend.getFechaEgreso()%></td>
                                <td><%= spend.getDescripcion()%></td>
                                <td>$<%= dfe.format(spend.getValorEgreso())%></td>
                                <!-- <td class="d-flex">
                                     <button type="button" class="btn btn-success"><i class="fas fa-pencil-alt"></i></button>
                                     <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                                 </td>-->
                            </tr>
                            <% } %>
                            <% }

                            
                            
                            else { %>
                            <tr>
                                <td colspan="5">No hay datos</td>
                            </tr>
                            <% }%>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Pie de pagina del contenedor-->
                <div class="card-footer d-flex">
                    <!-- Total de Egresos-->
                    <div class="col-sm-3 ml-auto">
                        <label style="font-size:16px" >TOTAL EGRESOS</label>
                        <input type="text" id="txtTotalEgresos" name="txtTotalEgresos" style="color:#bd0202" class="form-control font-weight-bold" value="$<%= df.format(sumTotalEgreso)%>"  readonly>

                    </div>
                </div>
            </div>
            <br>


        </div>
    </div>                








</body>
</html>
