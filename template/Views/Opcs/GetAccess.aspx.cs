using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Opcs_GetAccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session["SessionInfo"] = "";
        Session["SessionCardCode"] = "";
        Session["SessionCardName"] = "";
    }

    protected void btnSolicitar_Click(object sender, EventArgs e)
    {
        try
        {
            if (Request.Form["EMail"] != "")
            {
                GetAccessController controller = new GetAccessController();
                string response = controller.SolicitarAcceso(Request.Form["EMail"]);
                if(response != null)
                {
                    if (response != "OK")
                        lblMessageError.Text = response;
                    else
                    {
                        lblMessageSuccess.Text = "En breve recibira un correo con sus datos de acceso.";
                        btnSolicitar.Enabled = false;
                    }
                }
                controller = null;
            }
            else
            {
                lblMessageError.Text = "Debe de ingresar un correo valido.";
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }
}