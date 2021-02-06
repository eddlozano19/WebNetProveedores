using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Global
/// </summary>
public class Global
{
    public static string Version = System.Web.Configuration.WebConfigurationManager.AppSettings["Version"].ToString();

    public static string urlApi = System.Web.Configuration.WebConfigurationManager.AppSettings["urlApi"].ToString();

    public static string urlApiTest = System.Web.Configuration.WebConfigurationManager.AppSettings["urlApiTest"].ToString();

    public static string UploadPath = HttpContext.Current.Request.PhysicalApplicationPath + @"uploads\";

}