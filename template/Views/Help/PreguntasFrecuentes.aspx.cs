using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Help_PreguntasFrecuentes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) { return; }

        if (Session["SessionInfo"] == null || Session["SessionInfo"].ToString() == "")
            Response.Redirect("../Identity/Account/Login/Default.aspx", false);
    }
}