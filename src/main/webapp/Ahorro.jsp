<%-- 
    Document   : presupuesto
    Created on : 21/09/2021, 4:15:56 p. m.
    Author     : Carolina Bernal
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="logica.Ahorro"%>
<%@page import="logica.ColeccionAhorro"%>
<%@page import="logica.Egreso"%>
<%@page import="logica.ColeccionEgreso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>CUENTOMISLUKAS.COM/AHORRO </title>
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
                    <a class="header-menu-tab" href="/mavenproject4/Ahorro.jsp"><span class="fas fa-piggy-bank"></span><u> AHORRO</u></></a>
                    <!--<a class="header-menu-number" href="#4">5</a>-->
                </li>
                <li>
                    <a class="header-menu-tab" href="#5"><span class="fas fa-bullseye"></span> METAS</a>
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



        <!-- SECCIÓN DE AHORROS-->
        <div class="card-body">
            <hr style="color: #0056b2;" />
            <!--h1>AHORROS</h1>-->
        </div>

        <%
            String accion;
            int id = 0;
            String fechaAhorro = "";
            double valorAhorro = 0.0;
            String descripcion = "";

            if (request.getParameter("accion") == null) {
                id = 0;
            } else {
                id = Integer.parseInt(request.getParameter("id"));
                ColeccionAhorro coleccion = new ColeccionAhorro();
                Ahorro spend = coleccion.cargarUnAhorro(id);
                fechaAhorro = spend.getFechaAhorro();
                valorAhorro = spend.getValorAhorro();
                descripcion = spend.getDescripcion();
            }


        %>

        <div class="d-flex">
            <div class="col-sm-6">
                <div class="card">
                    <!-- Formulario para registrar Ahorros-->
                    <form method="POST" action="registroAhorro.jsp">
                        <div class="card-body">
                            <!-- Titulo de la sección de registro de Ahorros-->
                            <div class="form-group">
                                <h1 for="txtTituloAhorros" style="color:#1f253d"><span class="fas fa-piggy-bank"></span></i> Fondo de Emergencias</h1>

                                <p style="color:#1f253d; font-size: 14px; text-align: justify"> La sección ahorros te ayudará a mantener tu FONDO DE EMRGENCIAS, este es un ahorro que podras usar en caso de un accidente
                                    enfermedad, perdida de empleo o daños en electrodomesticos y/o vivienda, El valor ideal de tu fondo de emergencias esta entre 3 y 7 veces tus egresos mensuales
                                    te ayudaremos calculando esta cifra.</p>
                                <hr style="color: #0056b2;" />
                            </div>
                            <!-- FONDO IDEAL VS ACTUAL-->
                            <%  DecimalFormat dfe = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
                                ColeccionEgreso egres2 = new ColeccionEgreso();
                                boolean isDatee = egres2.cargarEgreso();
                                Double sumTotalEgreso = 0.0;
                                sumTotalEgreso = egres2.totalEgreso();
                            %>

                            <div class="form-group">
                                <!-- Valor Recomendado-->
                                <div class="row mb-3">
                                    <label for="valorActual" class="col-form-label col-sm-5 "><i class="fas fa-bullseye"></i> Valor recomendado:</label>
                                    <input type="text" class="form-control col-sm-6" id="valorRecomendado" name="valorActual" value="$<%= dfe.format(sumTotalEgreso * 7)%>" readonly>
                                </div>
                                <%
                                    String fecha1 = (request.getParameter("dtpFechaDesde") == null) ? "" : request.getParameter("dtpFechaDesde");
                                    String fecha2 = (request.getParameter("dtpFechaHasta") == null) ? "" : request.getParameter("dtpFechaHasta");

                                    DecimalFormat df = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
                                    ColeccionAhorro egres = new ColeccionAhorro();
                                    boolean isDate;
                                    if (fecha1.equals("") && fecha2.equals("")) {
                                        isDate = egres.cargarAhorro();
                                    } else {
                                        isDate = egres.cargarAhorrosPorFiltro(fecha1, fecha2);
                                    }
                                    Double sumTotalAhorro = 0.0;
                                    sumTotalAhorro = egres.totalAhorro();

                                    DecimalFormat E_B_F = new DecimalFormat("##.#");
                                    double ahorroBarra = (sumTotalAhorro * 100) / (sumTotalEgreso * 7);%>

                                <!-- Valor Actual-->
                                
                                <div class="row mb-3">
                                    <label for="valorActual" class="col-form-label col-sm-5 "><i class="fas fa-piggy-bank"></i> Valor Actual:</label>
                                    <% if (ahorroBarra < 30) {%>

                                    <input type="valorActual" style="color:#dc3545;" class="form-control col-sm-6" id="valorActual" name="valorActual" value="$<%= dfe.format(sumTotalAhorro)%>" readonly>
                                    <%} else {
                                        if (ahorroBarra >= 30 && ahorroBarra < 70) {%>
                                    <input type="valorActual" style="color:#ffc107;" class="form-control col-sm-6" id="valorActual" name="valorActual" value="$<%= dfe.format(sumTotalAhorro)%>" readonly>
                                    <%

                                    } else {
                                    %>

                                    <input type="valorActual" style="color:#28a745;" class="form-control col-sm-6" id="valorActual" name="valorActual" value="$<%= dfe.format(sumTotalAhorro)%>" readonly>
                                    <%  }
                                        }
                                    %>

                                </div>
                            </div>
                            <!-- Barras indicadoras ahorro -->
                            <div class="form-group">
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
                            <hr>
                            
                            <!-- ID del Ahorro-->
                            <div class="row mb-3">
                                <label for="txtId" class="col-form-label col-sm-5 "><i class="fas fa-barcode"></i> Codigo de Movimiento</label>
                                <input type="text" class="form-control col-sm-6" id="txtId" name="txtId" value="<%= id%>" readonly>
                            </div>


                            <!-- Fecha del registro del Ahorro-->
                            <div class="row mb-3">
                                <label for="dtpFechaAhorro" class="col-form-label col-sm-5"><i class="far fa-calendar-alt"></i> Fecha del Movimiento</label>
                                <input type="date" class="form-control col-sm-6" id="dtpFechaAhorro" name="dtpFechaAhorro" value="<%= fechaAhorro%>" required>
                            </div>
                            
                            <!-- Agregar o Retirar -->
                            <div class="row mb-3">
                                <label for="addOrDraw" class="col-form-label col-sm-5"><i class="fas fa-calculator"></i> Tipo de Movimiento</label> 
                                <select class="form-select col-sm-6" aria-label=AgregarORetirar">
                                    <option selected>Agregar</option>
                                    <option value="2">Retirar</option>
                                </select>
                            </div>

                            <!-- Valor del Ahorro-->
                            <div class="row mb-3">
                                <label for="txtValorAhorro" class="col-form-label col-sm-5 "><i class="fas fa-dollar-sign"></i> Valor</label>
                                <input type="text" class="form-control col-sm-6" id="txtValorAhorro" name="txtValorAhorro" value="<%= valorAhorro%>" required placeholder="Valor">
                            </div>   
                            <!-- Descripción-->
                            <div class="row mb-3">
                                <label for="txtDescripcion" class="col-form-label col-sm-5 "><i class="fas fa-microphone"></i> Descripción</label>
                                <input type="text" class="form-control col-sm-6" id="txtDescripcion" name="txtDescripcion" value="<%= descripcion%>"  placeholder="Descripción breve">
                            </div>
                            <!-- Sección de botones-->
                            <div class="card-footer">
                                <div>
                                    <input type="submit" id="btnSubmit" name="btnSubmit" value="Agregar" class="btn btn-success">
                                    <input type="submit" id="btnSubmit" name="btnSubmit" value="Actualizar" class="btn btn-info">
                                </div>
                            </div>
                        </div>
                    </form>    
                </div> 
            </div>

            <!-- Tabla Lista Ahorros-->
            <div class="col-sm-6 ml-auto" >
                <div class="card">
                    <div class="card-body">
                        <!-- Titulo contenedor-->
                        <div class="d-flex col-sm-5">
                            <h1 style="color:#1f253d"><i class="far fa-list-alt"></i> Lista de Movimientos</h1>
                        </div>

                        <hr style="color: #0056b2;" />
                        <!-- Sección de filtro-->
                        <form method="GET" action = "presupuesto.jsp">
                            <div class="form-group d-flex">
                                <div class="mb-3 col-sm-6 d-flex">
                                    <label for="lblFechaFiltro" class="col-form-label col-sm-2">De </label>
                                    <input type="date" class="form-control col-sm-7" id="dtpFechaDesde" name="dtpFechaDesde" >
                                    <label for="lblFehaFiltro" class="col-form-label col-sm-2"> A </label>
                                    <input type="date" class="form-control col-sm-7" id="dtpFechaHasta" name="dtpFechaHasta" >
                                    <label for="lblFehaFiltro" class="col-form-label col-sm-1"></label>
                                    <button type="button" class="btn btn-success"><i class="fas fa-search"></i></button>
                                </div> 
                            </div>
                        </form> 

                        <!-- Tabla para mostrar los registros de Ahorros-->
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Fecha</th>
                                    <th>Descripción</th>
                                    <th>Valor</th>
                                    <th>Acciones</th>                    
                                </tr>
                            </thead>

                            <tbody>
                                <% if (isDate) { %>
                                <% for (Ahorro spend : egres.getLista()) {%>
                                <tr>
                                <tr>
                                    <td scope="row"><%= spend.getId()%></td>

                                    <td><%= spend.getFechaAhorro()%></td>
                                    <td><%= spend.getDescripcion()%></td>
                                    <td>$<%= df.format(spend.getValorAhorro())%></td>
                                    <td class="d-flex">
                                        <a href="presupuesto.jsp?accion=editar&id=<%= spend.getId()%>"><button type="button" class="btn btn-success"><i class="fas fa-pencil-alt"></i></button></a>
                                        <a href="eliminacionAhorro.jsp?id=<%= spend.getId()%>"><button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button></a>
                                    </td>
                                </tr>
                                <% } %>
                                <% } else { %>
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
                        <!-- Total de Ahorros-->
                        <div class="col-sm-4 ml-auto">
                            <label style="font-size:16px">TOTAL AHORRADO</label>
                            <input type="text" id="txtTotalAhorros" name="txtTotalAhorros" class="form-control font-weight-bold" value="$<%= df.format(sumTotalAhorro)%>"  readonly>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
