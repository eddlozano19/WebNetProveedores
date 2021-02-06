<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Views_Home_Default" %>
<%--Home main page--%>
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
                        <a class="nav-link" href="Default.aspx"><i class="fas fa-home mr-2"></i> Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Identity/Account/Login/Default.aspx"><i class="fas fa-sign-in-alt mr-2"></i> Acceso</a>
                    </li>
                </ul>
            </div>
        </nav>
        <main role="main" class="container pt-3">

            <div class="text-center">
                <h1>Aplicación Web Proveedores</h1>
                <p class="lead">
                    Ponemos a su disposición nuestra plataforma Web para el ingreso de sus facturas y de sus complementos de pago a nuestro sistema. También podrá consultar información relevante de nuestro sistema.
                </p>
                <p><b><a class="a-link" href="../Identity/Account/Login/Default.aspx">Ingresar a la plataforma</a></b></p>
            </div>

            <div class="container pt-5">
                <div class="row">
                    <div class="col">
                        <div class="card shadow rounded">
                            <div class="card-body">
                                <h5 class="card-title">Facturas de proveeores</h5>
                                <p class="card-text">Con nuestra plataforma usted podrá crear su factura en nuestro sistema y programarla a pago una vez que realice la entrega del producto o servicio.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card shadow rounded">
                            <div class="card-body">
                                <h5 class="card-title">Complementos de pago</h5>
                                <p class="card-text">Con nuestra plataforma usted podrá adjuntar su complemento de pago y vincularlo a los pagos efectuados en nuestro sistema.<br /> &nbsp;</p>
                            </div>
                        </div>
                    </div>
                </div><!--row-->
            </div><!--container-->

            <div class="container pt-3 pb-5">
                <div class="row">
                    <div class="col">
                        <div class="card shadow rounded">
                            <div class="card-body">
                                <h5 class="card-title">Facturas pendientes de pago</h5>
                                <p class="card-text">Con nuestra plataforma usted podrá consultar sus facturas que esten pendiente de pago.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card shadow rounded">
                            <div class="card-body">
                                <h5 class="card-title">Facturas pagadas</h5>
                                <p class="card-text">Con nuestra plataforma usted podrá consultar sus facturas que estan pagadas en nuestro sistema.</p>
                            </div>
                        </div>
                    </div>
                </div><!--row-->
            </div><!--container-->

            <div class="container pt-3 pb-5">
               
            </div><!--container-->

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
