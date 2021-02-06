using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using Telerik.Web.UI;

/// <summary>
/// Summary description for XMLController
/// </summary>
public class XMLController
{
    private readonly string urlApi;
    private readonly HttpClient httpClient;


    public XMLController()
    {
        this.urlApi = Global.urlApi;
        this.httpClient = new HttpClient();
    }


    public UploadResult UploadFiles(UploadedFile files)
    {
        var httClient = new HttpClient();
        var formData = new MultipartFormDataContent();

        byte[] fileXML;
        using (var reader = new BinaryReader(files.InputStream))
        {
            fileXML = reader.ReadBytes(int.Parse(files.ContentLength.ToString()));
        }

        formData.Add(new StreamContent(new MemoryStream(fileXML)), "files", files.FileName);

        var response = httpClient.PostAsync(urlApi + "upload/", formData).Result;

        if (response.IsSuccessStatusCode)
        {
            UploadResult result = JsonConvert.DeserializeObject<UploadResult>(response.Content.ReadAsStringAsync().Result);
            return result;
        }
        else
        {
            string message = response.Content.ReadAsStringAsync().Result;
            return new UploadResult { count = 0, size = 0, name = message, path = "" };
        }
    }

    public XMLResult GetResultXML(InfoXML info)
    {
        var json = JsonConvert.SerializeObject(info);
        var bodyContent = new StringContent(json, Encoding.UTF8, "application/json");

        var response = httpClient.PostAsync(urlApi + "xml/", bodyContent).Result;

        if (response.IsSuccessStatusCode)
        {
            var responContent = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<XMLResult>(responContent);
        }
        else
        {
            var responContent = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<XMLResult>(responContent);
        }
    }
}


public class UploadResult
{
    public int count { get; set; }
    public long size { get; set; }
    public string name { get; set; }
    public string path { get; set; }
}

public class InfoXML
{
    public string xml { get; set; }
    public string typedocument { get; set; }
    public int docnum { get; set; }
    public double doctotal { get; set; }
    public string cardcode { get; set; }
}

public class XMLResult
{
    public string Status { get; set; }
    public string Messages { get; set; }
    public string UUID { get; set; }
}