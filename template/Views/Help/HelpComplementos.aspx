<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HelpComplementos.aspx.cs" Inherits="Views_Help_HelpComplementos" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Aplicación Web Proveedores integrado a SAP Business One.</title>
    <meta name="description" content="Aplicación Web Proveedores integrado a SAP Business One.">
    <meta name="author" content="eddlozano.com">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="../../Content/img/cropped-favicon-180x180.png" sizes="180x180">
    <link rel="icon" href="../../Content/img/cropped-favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="../../Content/img/cropped-favicon-32x32.png" sizes="16x16" type="image/png">
    <meta name="msapplication-TileImage" content="../../Content/img/cropped-favicon-270x270.png" />
    <link rel="icon" type="image/x-icon" href="../../Content/img/favicon.png">


    <link rel="stylesheet" href="../../Content/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../Content/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../../Content/css/site.css" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-md navbar-light bg-blue">
            <a class="navbar-brand">LM</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="../Dashboard/Default.aspx"><i class="fas fa-tachometer-alt mr-2"></i> Dashboard <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Facturas/Registrar.aspx"><i class="fas fa-file-invoice mr-2"></i> Ingresar factura</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Pagos/Complemento.aspx"> <i class="fas fa-money-check-alt mr-2"></i>Complemento de pago</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-chart-bar mr-2"></i>Consultar</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                            <a class="dropdown-item" href="../Consultas/Pedidos.aspx"><i class="fas fa-shopping-cart mr-2"></i>Pedidos de compra.</a>
                            <a class="dropdown-item" href="../Consultas/Entradas.aspx"><i class="fas fa-truck mr-2"></i>Entradas de mercancía.</a>
                            <a class="dropdown-item" href="../Consultas/Facturas.aspx"><i class="fas fa-file-invoice mr-2"></i>Facturas pendientes de pago.</a>
                            <a class="dropdown-item" href="../Consultas/Pagos.aspx"><i class="fas fa-file-invoice-dollar mr-2"></i>Facturas pagadas.</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Identity/Account/Logout/Default.aspx"><i class="fas fa-sign-out-alt mr-2"></i> Cerrar sesión</a>
                    </li>
                </ul>
            </div>
        </nav>

         <main role="main" class="container pt-4">
             <div class="input-group" style="background-color:#d9d9d9;">
                <a class="nav-link nav-link-sty font-italic" href="HelpFacturas.aspx"><b>Cómo ingresar una factura.</b></a>
                <a class="nav-link nav-link-sty font-italic" href="HelpComplementos.aspx"><b>Cómo ingresar un complemento.</b></a>
                <a class="nav-link nav-link-sty font-italic" href="HelpConsultar.aspx"><b>Cómo consultar documentos.</b></a>
                <a class="nav-link nav-link-sty" href="PreguntasFrecuentes.aspx"><b>Preguntas frecuentes.</b></a>
            </div>

            <div class="card bg-light shadow rounded">
                <h5 class="card-header">Cómo ingresar un complemento de pago</h5>
                <div class="card-body">
                    <h6 class="card-title">Paso 1:</h6>
                    <p class="card-text">En la <b class="font-italic">barra de navegación</b> en la parte superior dar clic en la opción <b>Complemento de pago</b>.</p>
                    
                    <h6 class="card-title">Paso 2:</h6>
                    <p class="card-text">En la sección <b class="font-italic">1. Seleccionar un pago</b> en la tabla donde se muestra el listado de los pagos deberá seleccionar (marcar/check) un solo pago al cual se le adjuntará el complemento.</p>
                    <p class="card-text">Si el pago que busca no se encuentra en el listado de los pagos deberá seleccionar un rango de fecha para consultar los pagos.</p>
                    
                    
                    <h6 class="card-title">Paso 3:</h6>
                    <p class="card-text">Dar clic en la sección <b class="font-italic">3. Seleccionar un archivo XML</b>, deberá buscar y seleccionar su archivo XML que representa el complemento de su pago que se adjuntará al pago seleccionado. Para buscar y seleccionar su archivo dar clic en el botón <b>Select</b>.</p>
                    <p class="card-text">
                        El archivo que seleccione, debe tener la estructura valida de un archivo XML timbrado fiscalmente.<br />
                        El archivo deberá tener la extension .xml. El archivo no deberá de pesar más de 20KB.<br />
                        En caso que no se cumplan estás condiciones el sistema rechazará el archivo y no podrá adjuntar su complemento de pago.
                    </p>

                    <h6 class="card-title">Paso 4:</h6>
                    <p class="card-text">Una vez que selecciono su archivo XML deberá validarlo dando clic en el botón <b>Validar XML</b>.</p>
                    <p class="card-text">Al finalizar la validación se mostrará un mensaje informando si la validación es correcta o son incorrectas. <br />
                        Si las validaciones son incorrectas no podrá adjuntar su complemento de pago hasta que se corrija el archivo XML timbrado.
                    </p>
                    <p class="card-text">Las validaciones que se realizan las puede consultar en <a class="a-link" href="ValidacionesXML.aspx">Validaciones del XML timbrado</a>.</p>

                    <h6 class="card-title">Paso 5:</h6>
                    <p class="card-text">Si las validaciones al archivo XML son correctas deberá dar clic en el botón <b>Procesar complemnto</b>.</p>
                    <p class="card-text">El proceso de adjuntar su archivo XML al pago puede tardar unos segundos. Al Finalizar se mostrará el Folio/Número del documento del pago actualizado.</p>

                    <p><a href="../Pagos/Complemento.aspx" class="a-link">Complemento de pago</a></p>
                </div>
            </div>
            <div class="container pt-4 pb-5">

            </div>
        </main>

        <footer class="footer">
            <div class="container">
                <span class="text-muted">
                    Portal Web Proveedores <% Response.Write(Global.Version); %> - <small>Aplicación integrada a SAP Business One.</small>
                </span>
            </div>
        </footer>
    </form>

    <script src="../../Content/lib/jquery/dist/jquery-3.5.1.min.js"></script>
    <script src="../../Content/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../Content/js/site.js"></script>
</body>
</html>
