using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


public partial class Views_Facturas_Registrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessageError.Text = "";

        if (IsPostBack) { return; }

        try
        {
            if (Session["SessionInfo"] == null || Session["SessionInfo"].ToString() == "")
            {
                Response.Redirect("../Identity/Account/Login/Default.aspx", false);
            }
            else
            {
                SessionInfoModel session = new SessionInfoModel();
                ConsultasController consultas = new ConsultasController();
                session = (SessionInfoModel)Session["SessionInfo"];

                IEnumerable<PedidosModel> pedidos = consultas.GetPedidos(session.cardcode);
                if(pedidos!= null)
                {
                    RadGridPedidos.DataSource = pedidos;
                    RadGridPedidos.DataBind();
                }

                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
                btnPaso1.BackColor = System.Drawing.Color.FromArgb(180, 192, 216);
                btnProcesar.Enabled = false;
                AlertXMLError.Visible = false;
                AlertSuccess.Visible = false;

                lblHidePathXML.Visible = false;
                lblHideUUIDXML.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void RadGridPedidos_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        try
        {
            lblMessageSuccess.Text = "";
            lblMessageError.Text = "";
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;

                dataItem["DocDate"].Text = Convert.ToDateTime(dataItem["DocDate"].Text).ToShortDateString();
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void btnPaso1_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessageSuccess.Text = "";
            lblMessageError.Text = "";

            btnPaso1.BackColor = System.Drawing.Color.FromArgb(180, 192, 216);
            btnPaso2.BackColor = System.Drawing.Color.Transparent;
            btnPaso3.BackColor = System.Drawing.Color.Transparent;
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void btnPaso2_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessageSuccess.Text = "";
            lblMessageError.Text = "";

            bool selected = false;
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPedidos.Items)
            {
                if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                {
                    selected = true;
                    break;
                }
                else
                    selected = false;
            }

            if (selected)
            {
                // valida que solo se seleccione documentos de articulos o de servicio, no se pude combinar o es uno o es el otro.
                bool _servicio = false;
                bool _articulo = false;
                foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPedidos.Items)
                {
                    if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                    {
                        if (dataitem["DocTypePedido"].Text == "Artículo") { _articulo = true; }
                        if (dataitem["DocTypePedido"].Text == "Servicio") { _servicio = true; }
                    }
                }

                if (_articulo && _servicio)
                {
                    lblMessageError.Text = "Solamente debe seleccionar documentos de clase artículo o de servicio, no puede combinar clases de documentos.";
                }
                else
                {
                    string DocNums = "";
                    foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPedidos.Items)
                    {
                        if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                            DocNums += dataitem["DocNumPedido"].Text + ",";
                    }
                    DocNums = DocNums.Remove(DocNums.Length - 1);

                    ConsultasController consultas = new ConsultasController();

                    IEnumerable<EntradasLineModel> entradas = consultas.GetPartidas(DocNums);
                    if (entradas != null)
                    {
                        RadGridPartidas.DataSource = entradas;
                        RadGridPartidas.DataBind();

                        btnPaso1.BackColor = System.Drawing.Color.Transparent;
                        btnPaso2.BackColor = System.Drawing.Color.FromArgb(180, 192, 216);
                        btnPaso3.BackColor = System.Drawing.Color.Transparent;
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                    }
                }
            }
            else
            {
                lblMessageError.Text = "Debe seleccionar un pedido de compra.";
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void btnSelectAll_Click(object sender, EventArgs e)
    {
        foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPartidas.Items)
            if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == false)
                (dataitem.FindControl("CheckBox1") as CheckBox).Checked = true;
    }
    protected void btnUnselect_Click(object sender, EventArgs e)
    {
        foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPartidas.Items)
            if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                (dataitem.FindControl("CheckBox1") as CheckBox).Checked = false;
    }
    protected void RadGridPartidas_ItemDataBound(object sender, GridItemEventArgs e)
    {
        try
        {
            lblMessageError.Text = "";
            lblMessageSuccess.Text = "";
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void btnPaso3_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessageSuccess.Text = "";
            lblMessageError.Text = "";

            bool selected = false;
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPedidos.Items)
            {
                if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                {
                    selected = true;
                    break;
                }
                else
                    selected = false;
            }

            if (selected)
            {
                selected = false;
                foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPartidas.Items)
                {
                    if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                    {
                        selected = true;
                        break;
                    }
                    else
                        selected = false;
                }

                if (selected)
                {
                    btnPaso1.BackColor = System.Drawing.Color.Transparent;
                    btnPaso2.BackColor = System.Drawing.Color.Transparent;
                    btnPaso3.BackColor = System.Drawing.Color.FromArgb(180, 192, 216);
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = true;
                }
                else
                {
                    lblMessageError.Text = "Debe seleccionar una o más partidas de las entadas.";
                }
            }
            else
            {
                lblMessageError.Text = "Debe seleccionar un pedido de compra.";
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void btnValidar_Click(object sender, EventArgs e)
    {
        try
        {
            lblHidePathXML.Text = "";
            lblHideUUIDXML.Text = "";
            lblMessageSuccess.Text = "";
            lblMessageError.Text = "";
            lblMessageXmlError.Text = "";
            AlertXMLError.Visible = false;

            int docNum = 0;
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPedidos.Items)
                if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                    docNum = int.Parse(dataitem["DocNumPedido"].Text);

            double lineTotal = 0;
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPartidas.Items)
                if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                {
                    lineTotal += Convert.ToDouble(dataitem["LineTotal"].Text) + Convert.ToDouble(dataitem["VatSumLine"].Text);
                }

            if (RadAsyncUpload1.UploadedFiles.Count > 0)
            {
                foreach (UploadedFile file in RadAsyncUpload1.UploadedFiles)
                {
                    if (file.FileName != "")
                    {
                        XMLController xmlController = new XMLController();
                        UploadResult result = xmlController.UploadFiles(file);
                        if (result.count > 0)
                        {
                            SessionInfoModel session = new SessionInfoModel();
                            session = (SessionInfoModel)Session["SessionInfo"];

                            InfoXML info = new InfoXML { cardcode = session.cardcode, docnum = docNum, doctotal = lineTotal, typedocument = "FA", xml = result.path };
                            XMLResult xmlResult = xmlController.GetResultXML(info);

                            if (xmlResult.Status == "Error")
                            {
                                AlertXMLError.Visible = true;
                                lblMessageXmlError.Text = xmlResult.Messages;
                                lblXmlFile.Text = "";
                            }
                            else
                            {
                                lblHidePathXML.Text = result.path;
                                lblHideUUIDXML.Text = xmlResult.UUID;
                                lblXmlFile.Text = file.FileName;
                                lblMessageSuccess.Text = xmlResult.Messages;
                                btnProcesar.Enabled = true;
                            }
                        }
                    }
                    else
                    {
                        lblMessageError.Text = "Debe seleccionar un archivo XML.";
                        lblXmlFile.Text = "";
                    }
                }
            }
            else
            {
                lblMessageError.Text = "Debe seleccionar un archivo XML.";
                lblXmlFile.Text = "";
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void btnProcesar_Click(object sender, EventArgs e)
    {
        try
        {
            AlertSuccess.Visible = false;
            lblMessageCreate.Text = "";
            lblMessageSuccess.Text = "";
            lblMessageError.Text = "";

            if(lblHideUUIDXML.Text != "")
            {
                SessionInfoModel session = new SessionInfoModel();
                List<FacturaModel> facturas = new List<FacturaModel>();

                session = (SessionInfoModel)Session["SessionInfo"];

                foreach (Telerik.Web.UI.GridDataItem dataitem in RadGridPartidas.Items)
                    if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                    {
                        facturas.Add(new FacturaModel {
                            DocNumPedido = 0,
                            DocEntryPedido = int.Parse(dataitem["DocEntryPedido"].Text),
                            DocEntry = int.Parse(dataitem["DocEntry"].Text),
                            DocNum = int.Parse(dataitem["DocNum"].Text),
                            SeriesName = "",
                            DocType = dataitem["DocType"].Text,
                            CardCode = session.cardcode,
                            CardName = session.cardname,
                            DocDate = "",
                            DocDueDate = "",
                            NumAtCard = "",
                            DocCur = dataitem["Currency"].Text,
                            Rounding = "",
                            Comments = "",
                            Address2 = "",
                            RoundDif = 0,
                            SubTotal = 0,
                            VatSum = 0,
                            DocTotal = 0,
                            LineNum = int.Parse(dataitem["LineNum"].Text),
                            ItemCode = dataitem["ItemCode"].Text,
                            Dscription = dataitem["Dscription"].Text,
                            Quantity = Convert.ToDouble(dataitem["Quantity"].Text),
                            OpenQty = 0,
                            OpenCreQty = Convert.ToDouble(dataitem["OpenCreQty"].Text),
                            Price = Convert.ToDouble(dataitem["Price"].Text),
                            DiscPrcnt = Convert.ToDouble(dataitem["DiscPrcnt"].Text),
                            Currency = dataitem["Currency"].Text,
                            unitMsr = "",
                            WhsCode = "",
                            VatPrcnt = Convert.ToDouble(dataitem["VatPrcnt"].Text),
                            ShipDate = "",
                            SlpCode = 0,
                            FreeTxt = "",
                            LineTotal = Convert.ToDouble(dataitem["LineTotal"].Text),
                            VatSumLine = Convert.ToDouble(dataitem["VatSumLine"].Text),
                            lmUUID = lblHideUUIDXML.Text,
                            lmAttachXML = lblHidePathXML.Text
                        });
                    }

                if (facturas.Count > 0)
                {
                    FacturasController facturasController = new FacturasController();
                    SAPB1Result result = facturasController.CreateOpch(facturas);
                    if(result.Status == "Ok")
                    {
                        lblMessageSuccess.Text = result.Messages;
                        lblMessageCreate.Text = result.Messages;
                        AlertSuccess.Visible = true;

                        btnPaso1.Enabled = false;
                        btnPaso2.Enabled = false;
                        btnPaso3.Enabled = false;

                        btnValidar.Enabled = false;
                        btnProcesar.Enabled = false;

                    }
                    else
                    {
                        lblMessageError.Text = result.Messages;
                    }
                    facturasController = null;
                }
                else
                {
                    lblMessageError.Text = "Ocurrio un problema al intentar recuerar la información de las partidas seleccionadas.";
                }
            }
            else
            {
                lblMessageError.Text = "Ocurrio un problema con la validación del archivo XML.";
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void btnNuevaFactura_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registrar.aspx", false);
    }
}