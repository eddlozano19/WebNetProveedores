using Newtonsoft.Json;
using SAPbobsCOM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Dashboard_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) { return; }

        lblMessageError.Text = "";

        SessionInfoModel session = new SessionInfoModel();
        if (Session["SessionInfo"] == null || Session["SessionInfo"].ToString() == "")
        {
            Response.Redirect("../Identity/Account/Login/Default.aspx", false);
        }
        else
        {
            session = (SessionInfoModel)Session["SessionInfo"];

            this.ConsultarInfo();
        }
    }

    protected void ConsultarInfo()
    {
        try
        {
            lblMessageError.Text = "";


            ConsultasController consultas = new ConsultasController();
            SessionInfoModel session = new SessionInfoModel();

            session = (SessionInfoModel)Session["SessionInfo"];

            IEnumerable<PedidosModel> facturas = consultas.GetPedidos(session.cardcode);
            txtFacturas.Text = facturas != null ? facturas.ToList().Count.ToString() : "0";

            string date1 = Convert.ToDateTime(DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-01").ToShortDateString();
            string date2 = Convert.ToDateTime(DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month).ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Year.ToString()).ToShortDateString();
            IEnumerable<PagosTdPagos> pagos = consultas.GetPagosEfectuadosOvpm(session.cardcode, Convert.ToDateTime(date1), Convert.ToDateTime(date2));
            txtPagos.Text = pagos != null ? pagos.ToList().Count.ToString() : "0";

            IEnumerable<PedidosTdModel> pedidos = consultas.GetPedidosAbiertos(session.cardcode);
            txtPedidos.Text = pedidos != null ? pedidos.ToList().Count.ToString() : "0";


            facturas = null;
            pagos = null;
            pedidos = null;
            consultas = null;

            //throw new System.ArgumentException("Example message error: Parameter cannot be null", "original");
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }

}