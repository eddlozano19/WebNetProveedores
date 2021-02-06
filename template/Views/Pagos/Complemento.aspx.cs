using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


public partial class Views_Pagos_Complemento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessageError.Text = "";

        if (IsPostBack) { return; }

        try
        {
            ComplementosController complementoController = new ComplementosController();
            SessionInfoModel session = new SessionInfoModel();

            if (Session["SessionInfo"] == null || Session["SessionInfo"].ToString() == "")
            {
                Response.Redirect("../Identity/Account/Login/Default.aspx", false);
            }
            else
            {
                txtDate1.Text = Convert.ToDateTime(DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-01").ToShortDateString();
                txtDate2.Text = Convert.ToDateTime(DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month).ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Year.ToString()).ToShortDateString();

                session = (SessionInfoModel)Session["SessionInfo"];
                IEnumerable<PagosModel> pagos;
                pagos = complementoController.GetPagosEfectuados(session.cardcode, Convert.ToDateTime(txtDate1.Text), Convert.ToDateTime(txtDate2.Text));

                if (pagos != null)
                {
                    RadGrid1.DataSource = pagos;
                    RadGrid1.DataBind();
                }
                else
                {
                    RadGrid1.DataSource = null;
                    RadGrid1.DataBind();
                }

                Panel1.Visible = true;
                Panel2.Visible = false;
                btnPaso1Tab.BackColor = System.Drawing.Color.FromArgb(180, 192, 216);
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

    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessageSuccess.Text = "";
            lblMessageError.Text = "";
            lblDocNum.Text = "";

            ComplementosController complementoController = new ComplementosController();
            SessionInfoModel session = new SessionInfoModel();

            session = (SessionInfoModel)Session["SessionInfo"];
            IEnumerable<PagosModel> pagos;
            pagos = complementoController.GetPagosEfectuados(session.cardcode, Convert.ToDateTime(txtDate1.Text), Convert.ToDateTime(txtDate2.Text));

            if (pagos != null)
            {
                RadGrid1.DataSource = pagos;
                RadGrid1.DataBind();
            }
            else
            {
                RadGrid1.DataSource = null;
                RadGrid1.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }
    protected bool ValidarCheckBoxRadGrid()
    {
        try
        {
            int count = 0;
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGrid1.Items)
            {
                if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                    count++;
            }

            if (count > 1)
            {
                lblMessageError.Text = "Debe selccionar un solo pago.";
                foreach (Telerik.Web.UI.GridDataItem dataitem in RadGrid1.Items)
                    (dataitem.FindControl("CheckBox1") as CheckBox).Checked = false;

                return false;
            }
            else
            {
                foreach (Telerik.Web.UI.GridDataItem dataitem in RadGrid1.Items)
                {
                    if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                        lblDocNum.Text = dataitem["DocNum"].Text;
                }

                return true;
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
            return false;
        }
    }

    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        try
        {
            lblMessageSuccess.Text = "";
            lblMessageError.Text = "";
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;

                dataItem["DocDate"].Text = Convert.ToDateTime(dataItem["DocDate"].Text).ToShortDateString();
                dataItem["DocTotal"].Text = Convert.ToDouble(dataItem["DocTotal"].Text).ToString("N4");
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            //lblMessageSuccess.Text = "";
            //lblMessageError.Text = "";
            //lblDocNum.Text = "";

            //this.ValidarCheckBoxRadGrid();
            //throw new System.ArgumentException("Click activado del checkbox");
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void RadAsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        try
        {
            lblMessageError.Text = "";
            lblMessageSuccess.Text = "";
            //lblXmlFile.Text = e.File.FileName;
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
            lblMessageError.Text = "";
            lblMessageSuccess.Text = "";
            lblMessageXmlError.Text = "";
            AlertXMLError.Visible = false;
            
            double docTotal = 0;
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGrid1.Items)
                if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                    docTotal = Convert.ToDouble(dataitem["DocTotal"].Text);

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

                            InfoXML info = new InfoXML { cardcode = session.cardcode, docnum = int.Parse(lblDocNum.Text), doctotal = docTotal, typedocument = "PA", xml = result.path };
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
                        else
                        {
                            lblMessageError.Text = "Debe seleccionar un archivo XML.";
                            lblXmlFile.Text = "";
                        }
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

            int docEntry = 0;
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGrid1.Items)
                if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                    docEntry = int.Parse(dataitem["DocEntry"].Text);

            SessionInfoModel session = new SessionInfoModel();
            ComplementosController complementos = new ComplementosController();

            session = (SessionInfoModel)Session["SessionInfo"];

            PagosModel pagos = new PagosModel
            {
                CardCode = session.cardcode,
                CardName = session.cardname,
                DocCurr = "",
                DocDate = "",
                DocEntry = docEntry,
                DocNum = int.Parse(lblDocNum.Text),
                DocTotal = 0,
                lmUUID = lblHideUUIDXML.Text,
                lmAttachXML = lblHidePathXML.Text
            };

            SAPB1Result result1 = complementos.UpdateOvpm(pagos);
            if (result1 != null)
            {
                if (result1.Status == "Error")
                {
                    lblMessageError.Text = result1.Messages;
                }
                else
                {
                    lblMessageSuccess.Text = result1.Messages;
                    lblMessageCreate.Text = result1.Messages;
                    AlertSuccess.Visible = true;

                    btnPaso1Tab.Enabled = false;
                    btnPaso2Tab.Enabled = false;

                    btnValidar.Enabled = false;
                    btnProcesar.Enabled = false;
                }
            }
            else
            {
                lblMessageSuccess.Text = "Ocurrio un problema al intentar procesar el archivo XML.";
            }
            complementos = null;
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void btnPaso1Tab_Click(object sender, EventArgs e)
    {
        lblMessageSuccess.Text = "";
        lblMessageError.Text = "";

        Panel1.Visible = true;
        Panel2.Visible = false;
        btnPaso1Tab.BackColor = System.Drawing.Color.FromArgb(180, 192, 216);
        btnPaso2Tab.BackColor = System.Drawing.Color.Transparent;
    }
    protected void btnPaso2Tab_Click(object sender, EventArgs e)
    {
        lblMessageSuccess.Text = "";
        lblMessageError.Text = "";

        int count = 0;
        foreach (Telerik.Web.UI.GridDataItem dataitem in RadGrid1.Items)
        {
            if ((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                count++;
        }

        if (count > 1 || count == 0)
        {
            lblMessageError.Text = "Debe selccionar un solo pago.";
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGrid1.Items)
                (dataitem.FindControl("CheckBox1") as CheckBox).Checked = false;
        }
        else
        {
            foreach (Telerik.Web.UI.GridDataItem dataitem in RadGrid1.Items)
                if((dataitem.FindControl("CheckBox1") as CheckBox).Checked == true)
                    lblDocNum.Text = dataitem["DocNum"].Text;

            Panel1.Visible = false;
            Panel2.Visible = true;
            btnPaso1Tab.BackColor = System.Drawing.Color.Transparent;
            btnPaso2Tab.BackColor = System.Drawing.Color.FromArgb(180, 192, 216);
        }
    }

    protected void btnNuevoPago_Click(object sender, EventArgs e)
    {
        Response.Redirect("Complemento.aspx", false);
    }
}