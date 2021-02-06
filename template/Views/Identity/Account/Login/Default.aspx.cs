using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Identity_Account_Login_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) { return; }
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessageError.Text = "";
            SessionController sessionController = new SessionController();
            SessionInfoModel session = new SessionInfoModel();
            SessionContent content = new SessionContent { CardCode = Request.Form["CardCode"], Password = Request.Form["Password"] };

            session = sessionController.SignIn(content);

            if (session != null)
            {
                Session["SessionInfo"] = session;
                Session["SessionCardCode"] = session.cardcode;
                Session["SessionCardName"] = session.cardname;

                Response.Redirect("../../../Dashboard/Default.aspx", false);
            }
            else
            {
                Session["SessionInfo"] = "";
                Session["SessionCardCode"] = "";
                Session["SessionCardName"] = "";
                lblMessageError.Text = sessionController.messageError;
            }
        }
        catch (Exception ex)
        {
            lblMessageError.Text = ex.Message;
        }
    }
}