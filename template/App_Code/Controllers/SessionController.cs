using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

/// <summary>
/// Summary description for SessionController
/// </summary>
public class SessionController
{
    private readonly string urlApi;
    private readonly HttpClient httpClient;
    public string messageError;

    public SessionController()
    {
        this.urlApi = Global.urlApi;
        this.httpClient = new HttpClient();
    }


    public SessionInfoModel SignIn(SessionContent content)
    {
        var json = JsonConvert.SerializeObject(content);
        var bodyContent = new StringContent(json, Encoding.UTF8, "application/json");

        var response = httpClient.PostAsync(urlApi + "session/SignIn/", bodyContent);
        var result = response.Result;

        if(result.IsSuccessStatusCode)
        {
            var responContent = result.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<SessionInfoModel>(responContent);
        }
        else
        {
            messageError = result.Content.ReadAsStringAsync().Result;
            return null;
        }
    }

}

public class SessionContent
{
    public string CardCode { get; set; }
    public string Password { get; set; }
}