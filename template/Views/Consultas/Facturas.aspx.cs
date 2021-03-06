﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


public partial class Views_Consultas_Facturas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) { return; }

        try
        {
            lblMessageError.Text = "";
            ConsultasController consultasController = new ConsultasController();
            SessionInfoModel session = new SessionInfoModel();

            if (Session["SessionInfo"] == null || Session["SessionInfo"].ToString() == "")
            {
                Response.Redirect("../Identity/Account/Login/Default.aspx", false);
            }
            else
            {
                session = (SessionInfoModel)Session["SessionInfo"];

                IEnumerable<FacturasTdModel> facturas;
                facturas = consultasController.GetFacturasAbiertas(session.cardcode);

                if (facturas != null)
                {
                    RadGrid1.DataSource = facturas;
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

    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        try
        {
            lblMessageError.Text = "";
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;

                dataItem["DocDate"].Text = Convert.ToDateTime(dataItem["DocDate"].Text).ToShortDateString();
                dataItem["DocDueDate"].Text = Convert.ToDateTime(dataItem["DocDueDate"].Text).ToShortDateString();

                dataItem["VatSum"].Text = Convert.ToDouble(dataItem["VatSum"].Text).ToString("N4");
                dataItem["DocTotal"].Text = Convert.ToDouble(dataItem["DocTotal"].Text).ToString("N4");
                dataItem["SubTotal"].Text = Convert.ToDouble(dataItem["SubTotal"].Text).ToString("N4");
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }
}