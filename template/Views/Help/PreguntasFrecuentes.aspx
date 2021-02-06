<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PreguntasFrecuentes.aspx.cs" Inherits="Views_Help_PreguntasFrecuentes" %>
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
                <h5 class="card-header">Preguntas frecuentes</h5>
                <div class="card-body">
                    
                    <h6 class="card-title">Al intentar ingresar mi factura como se que número de pedido voy a facturar ?</h6>
                    <p class="card-text">Los números de pedidos serán proporcionados por su asesor de compras después de llegar a un acuerdo para realizar la compra.</p>
                    
                    <h6 class="card-title">Al intentar ingresar mi factura no aparece mi número de pedido que necesito facturar ?</h6>
                    <p class="card-text">Los números de pedidos serán proporcionados por su asesor de compras después de llegar a un acuerdo para realizar la compra.</p>

                    <h6 class="card-title">Al intentar ingresar mi factura, en el listado de partidas (producto/servicio) no encuentro una de las partidas ?</h6>
                    <p class="card-text">Si no encuentra una de las partidas o la cantidad de una de ellas no coincide, recuerde que solamente puede factura lo que se ve reflejado en nuestro sistema. Deberá de revisar la evidencia del documento de entrada proporcionado al momento que usted realiza la entrega del producto/servicio. Y su factura deberá ser por la cantidad correcta.</p>
                    <p class="card-text">Si le hace falta realizar la entrega de alguno de los productos/servicios deberá de finaliar dicha entrega y su factura contar con las partidas y cantidas entregadas.</p>

                    <h6 class="card-title">Cuando se valida mi XML timbrado el sistema me dice: La fecha del XML no está dentro del mes actual.</h6>
                    <p class="card-text">La fecha de su XML deberá de estar timbrada dentro del mes actual y una tolerancia de 5 dias del mes siguiente. Si no cumple esta condición el sistema no permite crear su factura o adjuntar su complemento de pago.</p>
                    <p class="card-text">En estos casos la solución es que deberá refacturar para poder cumplir con las condiciones de validación.</p>

                    <h6 class="card-title">Cuando se valida mi XML timbrado el sistema me dice: El RFC receptor del XML no corresponde.</h6>
                    <p class="card-text">El RFC receptor en su XML timbrado debe de ser el correcto. Verificarlo con su asesor de compras.</p>
                    <p class="card-text">En estos casos la solución es que deberá refacturar para poder cumplir con las condiciones de validación.</p>

                    <h6 class="card-title">Cuando se valida mi XML timbrado el sistema me dice: El total del XML debe de ser igual a {x} o tener una direncia de {x}. sobre los importes de las partidas seleccionadas.</h6>
                    <p class="card-text">Su XML timbrado deberá de cumplir con las condiciones de precios acordadas al momento de la compra.</p>
                    <p class="card-text">En estos casos la solución es que deberá refacturar para poder cumplir con las condiciones de validación.</p>
                    
                    <h6 class="card-title">Cuando se valida mi XML timbrado el sistema me dice: El UUID del XML ya se encuentra registrado en nuestro sistema.</h6>
                    <p class="card-text">No puede subir el mismo XML más de 2 veces. Si ya registro una factura o un complemento de pago, no puede usar el mismo XML timbrado para registrar otra.</p>
                    <p class="card-text">En estos casos la solución es que deberá refacturar para poder cumplir con las condiciones de validación.</p>

                    <h6 class="card-title">Cuando se valida mi XML timbrado el sistema me dice: N 601: La expresión impresa proporcionada no es válida.</h6>
                    <p class="card-text">El XML timbrado se valida con los servicios del SAT para verificar que la estructura del XML tenga el formato correcto de timbrado.</p>
                    <p class="card-text">En estos casos la solución es que deberá refacturar para poder cumplir con las condiciones de validación.</p>

                    <h6 class="card-title">Cuando se valida mi XML timbrado el sistema me dice: N 602: Comprobante no encontrado.</h6>
                    <p class="card-text">El XML timbrado se valida con los servicios del SAT y en este caso el mensaje indica que el timbrado de su XML aún no esta en la base de datos del SAT.</p>
                    <p class="card-text">En estos casos la solución es esperar unas horas hasta que se vea reflejado en la base de datos del SAT.</p>

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
