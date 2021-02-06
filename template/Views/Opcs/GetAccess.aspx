<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetAccess.aspx.cs" Inherits="Views_Opcs_GetAccess" %>
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
                        <a class="nav-link" href="../Home/Default.aspx"><i class="fas fa-home mr-2"></i> Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../Identity/Account/Login/Default.aspx"><i class="fas fa-sign-in-alt mr-2"></i> Acceso</a>
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
        <div aria-live="polite" aria-atomic="true" class="msg-toast">
            <div id="toastSuccess" class="toast" data-delay="5000" data-autohide="true">
                <div class="toast-header text-white bg-green">
                    <i class="far fa-comment-dots"></i> &nbsp;&nbsp;
                    <strong class="mr-auto">Proveedores Web</strong>
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body">
                    <asp:Label ID="lblMessageSuccess" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <main role="main" class="container pt-3">

            <div class="text-center">
                <h1>Aplicación Web Proveedores</h1>
            </div>

            <div class="container pt-5">
                <div class="row">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-6">
                        <div class="card shadow rounded">
                            <div class="card-body">
                                <h5 class="card-title">Solicitar sus datos de acceso</h5>
                                <span class="card-text">Ingrese su correo electrónico.<br /> &nbsp;</span>
                                <input runat="server" type="email" id="EMail" class="form-control" placeholder="Correo electrónico" required autofocus>
                                <br />
                                <asp:Button ID="btnSolicitar" runat="server" CssClass="btn btn-info btn-block" Text="Solicitar" OnClick="btnSolicitar_Click" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" />
                            </div>
                            <div class="card-footer text-muted">
                                <small class="">
                                    Recuerde que el correo electrónico debe de estar registrado en nuestro sistema. Para cualquier duda comunicarse con su asesor.
                                </small>
                            </div>
                        </div><!--/card-->
                    </div>
                    <div class="col-md-3">
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
    <% if (lblMessageError.Text != "")
        { %>
    <script>
        $('#toastError').toast('show');
    </script>
    <%} %>
    <% if (lblMessageSuccess.Text != "")
        { %>
    <script>
        $('#toastSuccess').toast('show');
    </script>
    <%} %>
</body>
</html>
