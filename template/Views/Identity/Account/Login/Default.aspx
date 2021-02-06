<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Views_Identity_Account_Login_Default" %>
<%--Login page--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <title>Aplicación Web Proveedores integrado a SAP Business One.</title>
    <meta name="description" content="Aplicación Web Proveedores integrado a SAP Business One.">
    <meta name="author" content="eddlozano.com">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="../../../../Content/img/cropped-favicon-180x180.png" sizes="180x180">
    <link rel="icon" href="../../../../Content/img/cropped-favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="../../../../Content/img/cropped-favicon-32x32.png" sizes="16x16" type="image/png">
    <meta name="msapplication-TileImage" content="../../../../Content/img/cropped-favicon-270x270.png" />
    <link rel="icon" type="image/x-icon" href="../../../../Content/img/favicon.png">

    <link rel="stylesheet" href="../../../../Content/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../../../Content/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../../../../Content/css/site.css" />
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
                        <a class="nav-link" href="../../../Home/Default.aspx"><i class="fas fa-home mr-2"></i> Inicio <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <div aria-live="polite" aria-atomic="true" class="msg-toast">
            <div id="toastError" class="toast" data-delay="5000" data-autohide="true">
                <div class="toast-header text-white bg-red">
                    <i class="far fa-comment-dots"></i> &nbsp;&nbsp;
                    <strong class="mr-auto">Proveedores Web</strong>
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body">
                    <asp:Label ID="lblMessageError" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <main role="main" class="">
            <div class="text-center mt-5">
                <h1>Aplicación Web Proveedores</h1>
            </div>

            <div class="form-signin mt-2">
                <div class="card shadow rounded">
                    <div class="card-header bg-blue">
                        <h4 class="text-white">Acceso a la plataforma</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="CardCode" class="sr-only">Código de proveedor</label>
                            <input runat="server" type="text" id="CardCode" class="form-control" placeholder="Código de proveedor" required autofocus>
                        </div>
                        <div class="form-group">
                            <label for="Password" class="sr-only">Contraseña</label>
                            <input runat="server" type="password" id="Password" class="form-control" placeholder="Contraseña" required>
                        </div>
                        <div class="form-group">
                            <%--<button class="btn btn-outline-info btn-block" type="submit">Ingresar</button>--%>
                            <asp:Button ID="btnIngresar" runat="server" CssClass="btn btn-outline-info btn-block" Text="Ingresar" OnClick="btnIngresar_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="container text-center text-muted pt-4">
                <br />
                <small>No cuenta con sus datos de acceso a nuestra plataforma, <a class="a-link" href="../../../Opcs/GetAccess.aspx">solicita el acceso</a>.</small>
                <br />
                <small>Tienes alguna duda, comunicate con <a class="a-link" href="#">nosostros</a>.</small>
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

    <script src="../../../../Content/lib/jquery/dist/jquery-3.5.1.min.js"></script>
    <script src="../../../../Content/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../../../Content/lib/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="../../../../Content/js/site.js"></script>
    <% if (lblMessageError.Text != "")
        { %>
    <script>
        $('.toast').toast('show');
    </script>
    <%} %>
</body>
</html>
