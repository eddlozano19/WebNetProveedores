using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Policy;
using System.Text;
using System.Web;
using Telerik.Web.UI;
using Telerik.Web.UI.AsyncUpload;

/// <summary>
/// Summary description for ComplementosController
/// </summary>
public class ComplementosController
{
    private readonly string urlApi;
    private readonly HttpClient httpClient;

    public ComplementosController()
    {
        this.urlApi = Global.urlApi;
        this.httpClient = new HttpClient();
    }


    public IEnumerable<PagosModel> GetPagosEfectuados(string cardcode, DateTime date1, DateTime date2)
    {
        string url = this.urlApi + "ovpm/OvpmGet/" + cardcode + "/" + date1.Date.ToString("yyyy-MM-dd") + "/" + date2.Date.ToString("yyyy-MM-dd");
        var response = httpClient.GetAsync(url, HttpCompletionOption.ResponseHeadersRead).Result;
        if (response.IsSuccessStatusCode)
        {
            var result = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<IEnumerable<PagosModel>>(result);
        }
        else
        {
            return null;
        }
    }


    public SAPB1Result UpdateOvpm(PagosModel pagos)
    {
        var json = JsonConvert.SerializeObject(pagos);
        var bodyContent = new StringContent(json, Encoding.UTF8, "application/json");

        var response = httpClient.PostAsync(urlApi + "ovpm/UpdateOvpm/", bodyContent).Result;

        var responContent = response.Content.ReadAsStringAsync().Result;
        return JsonConvert.DeserializeObject<SAPB1Result>(responContent);
    }

}

public class SAPB1Result
{
    public string Status { get; set; }
    public string Messages { get; set; }
}

