<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidacionesXML.aspx.cs" Inherits="Views_Help_ValidacionesXML" %>
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
            <div class="card bg-light shadow rounded">
                <h5 class="card-header">Validaciones que se realizan al XML timbrado</h5>
                <div class="card-body">
                    
                    <h6 class="card-title">Validaciones:</h6>
                    <p class="card-text"> Validacion de fecha de timbrado: <br />
                        - La fecha de su XML deberá de estar timbrada dentro del mes actual y una tolerancia de 5 dias del mes siguiente. <br />
                    </p>

                    <p class="card-text"> Validacion del timpo de comprobante: <br />
                        - El tipo de comprobante de su XML timbrado deberá ser de tipo <b>I</b> para el caso de la factura y de tipo <b>P</b> para el caso del complemento de pago. <br />
                    </p>

                    <p class="card-text"> Validacion de la forma de pago: <br />
                        - La forma de pago de su XML timbrado deberá ser la acordada o pactada con las condiciones del acuerdo de compra.
                    </p>

                    <p class="card-text"> Validacion del metodo de pago: <br />
                        - El metodo de pago de su XML timbrado deberá ser la acordada o pactada con las condiciones del acuerdo de compra.
                    </p>

                    <p class="card-text"> Validacion del RFC emisor: <br />
                        - El RFC emisor de su XML timbrado deberá coincidir con el que tenemos registrado en nuestro sistema. Para evitar errores verificarlo con su asesor de compra.
                    </p>

                    <p class="card-text"> Validacion del RFC receptor: <br />
                        - El RFC receptor de su XML timbrado deberá coincidir con el que tenemos registrado en nuestro sistema. Para evitar errores verificarlo con su asesor de compra.
                    </p>

                    <p class="card-text"> Validacion del Uso de CFDI: <br />
                        - El Uso de CFDI de su XML timbrado deberá ser el acordado o pactado con las condiciones del acuerdo de compra.
                    </p>

                    <p class="card-text"> Validacion del total y precios: <br />
                        - El total de su XML timbrado deberá ser el acordado o pactado con las condiciones del acuerdo de compra en base a la orden de compra que se coloca y en base a los productos/servicios que son entregados.
                    </p>

                    <p class="card-text"> Validacion del UUID: <br />
                        - El UUID de su XML timbrado no puede registrarse más de 2 veces al momento de crear su factura o de adjuntar su complemento de pago.
                    </p>

                    <p class="card-text"> Validacion del SAT: <br />
                        - Su XML timbrado deberá contar con la estructura correcta dictada por el SAT.
                    </p>
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
