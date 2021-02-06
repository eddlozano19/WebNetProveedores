<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pedidos.aspx.cs" Inherits="Views_Consultas_Pedidos" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--Consultar Pedidos abiertos page--%>
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
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

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

        <main role="main" class="container pt-2">
            <ol class="breadcrumb p-2 bg-green">
                <li class="breadcrumb-item text-white"><small><% Response.Write((string)Session["SessionCardCode"]); %></small></li>
                <li class="breadcrumb-item text-white"><small><% Response.Write((string)Session["SessionCardName"]); %></small></li>
            </ol>

            <div class="card bg-light shadow rounded">
                <div class="card-header text-white bg-blue">Pedidos de compra abiertos</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <telerik:RadGrid ID="RadGrid1" runat="server" CssClass="" AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound">
                            <MasterTableView AllowMultiColumnSorting="true">
                                <Columns>
                                    <telerik:GridBoundColumn UniqueName="DocEntry" HeaderText="No.Interno" DataField="DocEntry" HeaderStyle-Width="80">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="DocNum" HeaderText="No.Pedido" DataField="DocNum" HeaderStyle-Width="80">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="DocDate" HeaderText="Fecha" DataField="DocDate">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="DocDueDate" HeaderText="Fecha entrega" DataField="DocDueDate">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="NumAtCard" HeaderText="No.Ref.del acreedor" DataField="NumAtCard">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="DocCur" HeaderText="Moneda" DataField="DocCur">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="SubTotal" HeaderText="SubTotal" DataField="SubTotal" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="VatSum" HeaderText="Impuesto" DataField="VatSum" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn UniqueName="DocTotal" HeaderText="Total del documento" DataField="DocTotal" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="true" />
                            </ClientSettings>
                        </telerik:RadGrid>
                    </div>
                </div>
            </div> <!--card-->
        </main>

        <footer class="footer">
            <div class="container">
                <span class="text-muted">
                    Portal Web Proveedores <% Response.Write(Global.Version); %> - <small>Aplicación integrada a SAP Business One.</small> &nbsp;
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
        $('.toast').toast('show');
    </script>
    <%} %>
</body>
</html>
