using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


public partial class Views_Consultas_Pagos : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) { return; }

        try
        {
            ConsultasController consultasController = new ConsultasController();
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
                IEnumerable<PagosTdPagos> pagos;
                pagos = consultasController.GetPagosEfectuados(session.cardcode, Convert.ToDateTime(txtDate1.Text), Convert.ToDateTime(txtDate2.Text));

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
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        try
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;

                //dataItem["DocDate"].Text = Convert.ToDateTime(dataItem["DocDate"].Text).ToShortDateString();
                dataItem["DocTotal"].Text = Convert.ToDouble(dataItem["DocTotal"].Text).ToString("N4");
                dataItem["SumApplied"].Text = Convert.ToDouble(dataItem["SumApplied"].Text).ToString("N4");
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
            ConsultasController consultasController = new ConsultasController();
            SessionInfoModel session = new SessionInfoModel();

            session = (SessionInfoModel)Session["SessionInfo"];
            IEnumerable<PagosTdPagos> pagos;
            pagos = consultasController.GetPagosEfectuados(session.cardcode, Convert.ToDateTime(txtDate1.Text), Convert.ToDateTime(txtDate2.Text));

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

}