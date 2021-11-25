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
    <title>CUENTOMISLUKAS.COM/PAGINAPRESUPUESTO </title>
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
                <a class="header-menu-tab" href="/mavenproject4/presupuesto.jsp"><span class="fas fa-file-invoice-dollar"></span> <u>EGRESOS</u></a>
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

    
   
    <!-- SECCIÓN DE EGRESOS-->
    <div class="card-body">
        <hr style="color: #0056b2;" />
        <!--h1>EGRESOS</h1>-->
    </div>
    
    <%
        String accion;
        int id = 0;
        String tipoEgreso = "";
        int idCategoriaEgreso = 0;
        String fechaEgreso = "";
        double valorEgreso = 0.0;
        String descripcion = ""; 
        
        if(request.getParameter("accion") == null){
            id = 0;
        }
        else {
            id = Integer.parseInt(request.getParameter("id"));
            ColeccionEgreso  coleccion = new ColeccionEgreso();
            Egreso spend = coleccion.cargarUnEgreso(id);
            tipoEgreso = spend.getTipoEgreso();
            idCategoriaEgreso = spend.getIdCategoriaEgreso();
            fechaEgreso = spend.getFechaEgreso();
            valorEgreso = spend.getValorEgreso();
            descripcion = spend.getDescripcion();
        }      
    %>

    <div class="d-flex">
        <div class="col-sm-5">
            <div class="card">
                <!-- Formulario para registrar Egresos-->
                <form method="POST" action="registroEgreso.jsp">
                    <div class="card-body">
                        <!-- Titulo de la sección de registro de Egresos-->
                        <div class="form-group">
                            <h1 for="txtTituloEgresos" style="color:#1f253d"><i class="fas fa-hand-holding-usd"></i> Registro de Egresos</h1>
                        </div>
 
                        <hr style="color: #0056b2;" />
                        <!-- ID del Egreso-->
                        <div class="row mb-3">
                            <label for="txtId" class="col-form-label col-sm-5 "><i class="fas fa-barcode"></i> Codigo de Egreso</label>
                            <input type="text" class="form-control col-sm-6" id="txtId" name="txtId" value="<%= id %>" readonly>
                        </div>
                        <!-- Tipo de Egresos-->                     
                        <div class="row mb-3">
                            <label for="txtTipoEgreso" class="col-form-label col-sm-5 "><i class="fas fa-thumbtack"></i> Tipo de Egreso</label>
                                <div class="form-check col-sm-2 mt-2">
                                    <input class="form-check-input" type="radio" name="radTipoEgreso" id="radDisponibilidad1" value="Fijo" <%= tipoEgreso.equals("Fijo") ? "checked" : "" %>>
                                    <label class="form-check-label" for="radTipoEgreso1">Fijo</label>
                                </div>
                                <div class="form-check col-sm-2 mt-2">
                                    <input class="form-check-input" type="radio" name="radTipoEgreso" id="radDisponibilidad2" value="Variable" <%= tipoEgreso.equals("Variable") ? "checked" : "" %>>
                                    <label class="form-check-label" for="radTipoEgreso2">Variable</label>
                                </div>
                        </div>
                        <!-- Categoria de los Egresos-->
                        <div class="row mb-3">
                            <label for="selCategoriaEgreso" class="col-form-label col-sm-5"><i class="fas fa-list-ol"></i> Categoria</label>
                            <%ColeccionEgreso colection = new ColeccionEgreso();
                            TreeMap<Integer, String> Categoria = colection.getCategoriaEgresos();
                            %>
                            <select class="form-control col-sm-6" id="selCategoriaEgreso" name="selCategoriaEgreso">
                                <option selected value=""></option>
                                <% for (Map.Entry<Integer, String> entrada : Categoria.entrySet()) { %>
                                <option <%= entrada.getKey()== idCategoriaEgreso ? "selected" : "" %> value="<%= entrada.getKey() %>"><%= entrada.getValue() %></option>
                                <% } %>
                            </select>
                        </div>
                        <!-- Fecha del registro del Egreso-->
                        <div class="row mb-3">
                            <label for="dtpFechaEgreso" class="col-form-label col-sm-5"><i class="far fa-calendar-alt"></i> Fecha del Egreso</label>
                            <input type="date" class="form-control col-sm-6" id="dtpFechaEgreso" name="dtpFechaEgreso" value="<%= fechaEgreso %>" required>
                        </div>
                        <!-- Valor del Egreso-->
                        <div class="row mb-3">
                            <label for="txtValorEgreso" class="col-form-label col-sm-5 "><i class="fas fa-dollar-sign"></i> Valor</label>
                            <input type="text" class="form-control col-sm-6" id="txtValorEgreso" name="txtValorEgreso" value="<%= valorEgreso %>" required placeholder="Valor">
                        </div>   
                        <!-- Descripción-->
                        <div class="row mb-3">
                            <label for="txtDescripcion" class="col-form-label col-sm-5 "><i class="fas fa-microphone"></i> Descripción</label>
                            <input type="text" class="form-control col-sm-6" id="txtDescripcion" name="txtDescripcion" value="<%= descripcion %>"  placeholder="Descripción breve">
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

        <!-- Tabla Lista Egresos-->
        <div class="col-sm-7 ml-auto" >
            <div class="card">
                <div class="card-body">
                <!-- Titulo contenedor-->
                    <div class="d-flex col-sm-5">
                        <h1 style="color:#1f253d"><i class="far fa-list-alt"></i> Listado de Egresos</h1>
                    </div>
                    <%
                        String fecha1 = (request.getParameter("dtpFechaDesde") == null) ? "" : request.getParameter("dtpFechaDesde");
                        String fecha2 = (request.getParameter("dtpFechaHasta") == null) ? "" : request.getParameter("dtpFechaHasta");
                    %>
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
                                    <th>Acciones</th>                    
                                </tr>
                            </thead>
                            <%  DecimalFormat df = new DecimalFormat( "#,##0.00", new DecimalFormatSymbols(new Locale("pt", "BR")));
                                ColeccionEgreso egres = new ColeccionEgreso();
                                boolean isDate;
                                if (fecha1.equals("") && fecha2.equals("")){
                                    isDate = egres.cargarEgreso();
                                }
                                else{
                                    isDate = egres.cargarGastosPorFiltro(fecha1, fecha2);
                                }                     
                                Double sumTotalEgreso = 0.0;
                                sumTotalEgreso = egres.totalEgreso();
                            %>
                            <tbody>
                                <% if (isDate) { %>
                                <% for (Egreso spend : egres.getLista()) {%>
                                <tr>
                                    <tr>
                                        <td scope="row"><%= spend.getId()%></td>
                                        <td class=""><%= spend.getTipoEgreso()%></td>
                                        <td><%= egres.getCategoriaEgreso(spend.getIdCategoriaEgreso())%></td>
                                        <td><%= spend.getFechaEgreso()%></td>
                                        <td><%= spend.getDescripcion()%></td>
                                        <td>$<%= df.format(spend.getValorEgreso()) %></td>
                                        <td class="d-flex">
                                            <a href="presupuesto.jsp?accion=editar&id=<%= spend.getId()%>"><button type="button" class="btn btn-success"><i class="fas fa-pencil-alt"></i></button></a>
                                            <a href="eliminacionEgreso.jsp?id=<%= spend.getId()%>"><button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button></a>
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
                        <!-- Total de Egresos-->
                        <div class="col-sm-3 ml-auto">
                            <label style="font-size:16px">TOTAL EGRESOS</label>
                            <input type="text" id="txtTotalEgresos" name="txtTotalEgresos" class="form-control font-weight-bold" value="$<%= df.format(sumTotalEgreso) %>"  readonly>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
