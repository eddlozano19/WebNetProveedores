<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrar.aspx.cs" Inherits="Views_Facturas_Registrar" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--Registrar facturas proveedores page--%>
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
    <link rel="stylesheet" href="../../Content/lib/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" />
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
        <main role="main" class="container pt-4">
            <ol class="breadcrumb p-2 bg-green">
                <li class="breadcrumb-item text-white"><small><% Response.Write((string)Session["SessionCardCode"]); %></small></li>
                <li class="breadcrumb-item text-white"><small><% Response.Write((string)Session["SessionCardName"]); %></small></li>
            </ol>
            <div class="card bg-light shadow rounded">
                <div class="card-header text-white bg-blue">Registrar factura</div>
                <div class="card-body">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <asp:Button ID="btnPaso1" runat="server" Text="1. Seleccionar un pedido" CssClass="nav-link active" OnClick="btnPaso1_Click" />
                        </li>
                        <li class="nav-item" role="presentation">
                            <asp:Button ID="btnPaso2" runat="server" Text="2. Seleccionar los producto a facturar" CssClass="nav-link active" OnClick="btnPaso2_Click" />
                        </li>
                        <li class="nav-item" role="presentation">
                            <asp:Button ID="btnPaso3" runat="server" Text="3. Seleccionar archivo XML" CssClass="nav-link active" OnClick="btnPaso3_Click" />
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <asp:Panel ID="Panel1" runat="server">
                            <br />
                            <p class="font-italic">Primeramente deberá de seleccionar su pedido de compra a facturar.</p>
                            <div class="table-responsive no-padding">
                                <telerik:RadGrid ID="RadGridPedidos" runat="server" CssClass="" AutoGenerateColumns="false" OnItemDataBound="RadGridPedidos_ItemDataBound">
                                    <MasterTableView AllowMultiColumnSorting="false">
                                        <Columns>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="50">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="false" Enabled="true" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="DocNumPedido" HeaderText="No.Pedido" DataField="DocNumPedido">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DocTypePedido" HeaderText="Clase de artículo/servicio" DataField="DocTypePedido">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DocDate" HeaderText="Fecha entrada" DataField="DocDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DocCurPedido" HeaderText="Moneda" DataField="DocCurPedido" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DocTotalPedido" HeaderText="Total" DataField="DocTotalPedido" DataFormatString="{0:###,##0.0000}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DocEntryPedido" HeaderText="No.Interno" DataField="DocEntryPedido" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="Smaller" ItemStyle-Font-Size="Smaller">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div> <!-- #table-responsive -->
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server" style="height:650px;">
                            <br />
                            <p class="font-italic">Selccione una o más partidas a facturar.</p>
                            <div class="form-group">
                                <asp:Button ID="btnSelectAll" runat="server" Text="Seleccionar todo" CssClass="btn btn-default btn-sm text-underline" OnClick="btnSelectAll_Click" />
                                <asp:Button ID="btnUnselect" runat="server" Text="Deseleccionar todo" CssClass="btn btn-default btn-sm text-underline" OnClick="btnUnselect_Click" />
                            </div>
                            <div class="table-responsive no-padding">
                                <telerik:RadGrid ID="RadGridPartidas" runat="server" CssClass="" AutoGenerateColumns="false" OnItemDataBound="RadGridPartidas_ItemDataBound">
                                    <MasterTableView AllowMultiColumnSorting="false">
                                        <GroupByExpressions>
                                            <telerik:GridGroupByExpression>
                                                <SelectFields>
                                                    <telerik:GridGroupByField FieldAlias="No.Pedido" FieldName="DocNumPedido" 
                                                        HeaderValueSeparator=" : "></telerik:GridGroupByField>
                                                </SelectFields>
                                                <GroupByFields>
                                                    <telerik:GridGroupByField FieldName="DocNumPedido"></telerik:GridGroupByField>
                                                </GroupByFields>
                                            </telerik:GridGroupByExpression>
                                        </GroupByExpressions>
                                        <Columns>
                                            <telerik:GridTemplateColumn HeaderStyle-Width="50">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="false" Enabled="true" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="DocNum" HeaderText="No.Entrada" DataField="DocNum">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="LineNum" HeaderText="Línea" DataField="LineNum">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="ItemCode" HeaderText="Artículo" DataField="ItemCode">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="Dscription" HeaderText="Descripción" DataField="Dscription">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="Quantity" HeaderText="Cantidad" DataField="Quantity" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="OpenCreQty" HeaderText="Cantidad Abierta" DataField="OpenCreQty" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="Price" HeaderText="Precio" DataField="Price" DataFormatString="{0:###,##0.0000}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DiscPrcnt" HeaderText="Descuento" DataField="DiscPrcnt" DataFormatString="{0:###,##0.00}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="LineTotal" HeaderText="Total" DataField="LineTotal" DataFormatString="{0:###,##0.0000}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="VatPrcnt" HeaderText="IVA" DataField="VatPrcnt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="VatSumLine" HeaderText="Impuesto" DataField="VatSumLine" DataFormatString="{0:###,##0.0000}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="Currency" HeaderText="Moneda" DataField="Currency" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DocType" HeaderText="" DataField="DocType" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DocEntry" HeaderText="No.Interno" DataField="DocEntry" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="Smaller" ItemStyle-Font-Size="Smaller">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DocEntryPedido" HeaderText="xxx" DataField="DocEntryPedido"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="Smaller" ItemStyle-Font-Size="Smaller">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div> <!-- #table-responsive -->
                        </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server">
                            <br />
                            <p class="font-italic">Seleccione su archivo XML y proceda con la validación.</p>
                            <div class="row">
                                <div class="col-md">
                                    <small class="text-muted">El archivo debe ser en formato XML (.xml).</small>
                                    <br/>
                                    <small class="text-muted">El archivo no debe superar los 20KB.</small>
                                    <div class="form-group">
                                        <small>Seleccionar archivo</small>
                                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions=".xml" MaxFileSize="20000" MaxFileInputsCount="1" >
                                        </telerik:RadAsyncUpload>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblXmlFile" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="btnValidar" runat="server" Text="Validar XML" CssClass="btn btn-info" OnClick="btnValidar_Click" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" />
                                        <asp:Button ID="btnProcesar" runat="server" Text="Crear factura" CssClass="btn btn-info" OnClick="btnProcesar_Click" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" />
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div id="AlertXMLError" runat="server" class="alert alert-danger" role="alert">
                                        <asp:Label ID="lblMessageXmlError" runat="server"></asp:Label>
                                    </div>
                                    <div id="AlertSuccess" runat="server" class="alert alert-success" role="alert">
                                        <asp:Label ID="lblMessageCreate" runat="server"></asp:Label>
                                        <br />
                                        <asp:Button ID="btnNuevaFactura" runat="server" Text="Ingresar nueva factura" CssClass="btn btn-outline-secondary" OnClick="btnNuevaFactura_Click" />
                                    </div>
                                </div>
                            </div><!-- row -->
                        </asp:Panel>
                    </div> <!-- tab-content-->
                </div>
            </div> <!--card-->
            <asp:Label ID="lblHidePathXML" runat="server"></asp:Label>
            <asp:Label ID="lblHideUUIDXML" runat="server"></asp:Label>
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
    <script src="../../Content/lib/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
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
