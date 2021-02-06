using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for GetAccessController
/// </summary>
public class GetAccessController
{
    private readonly string urlApi;
    private readonly HttpClient httpClient;

    public GetAccessController()
    {
        this.urlApi = Global.urlApi;
        this.httpClient = new HttpClient();
    }

    public string SolicitarAcceso(string E_Mail)
    {
        var json = JsonConvert.SerializeObject(new ProveedorCardCode { E_Mail = E_Mail });
        var bodyContent = new StringContent(json, Encoding.UTF8, "application/json");

        var response = httpClient.PostAsync(urlApi + "SendMail", bodyContent).Result;

        var responContent = response.Content.ReadAsStringAsync().Result;
        return responContent;
    }

}

public class ProveedorCardCode
{
    public string E_Mail { get; set; }
}