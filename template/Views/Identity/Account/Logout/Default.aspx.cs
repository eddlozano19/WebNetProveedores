using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Identity_Account_Logout_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session["SessionInfo"] = "";
        Session["SessionCardCode"] = "";
        Session["SessionCardName"] = "";

        Response.Redirect("../../../Home/Default.aspx", false);
    }
}