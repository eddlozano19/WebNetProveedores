using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for FacturasController
/// </summary>
public class FacturasController
{
    private readonly string urlApi;
    private readonly HttpClient httpClient;


    public FacturasController()
    {
        this.urlApi = Global.urlApi;
        this.httpClient = new HttpClient();
    }


    public SAPB1Result CreateOpch(List<FacturaModel> facturas)
    {
        var json = JsonConvert.SerializeObject(facturas);
        var bodyContent = new StringContent(json, Encoding.UTF8, "application/json");

        var response = httpClient.PostAsync(urlApi + "opch", bodyContent).Result;

        var responContent = response.Content.ReadAsStringAsync().Result;
        return JsonConvert.DeserializeObject<SAPB1Result>(responContent);
    }

}
