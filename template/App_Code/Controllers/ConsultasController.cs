using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;


/// <summary>
/// Summary description for ConsultasController
/// </summary>
public class ConsultasController
{
    private readonly string urlApi;
    private readonly HttpClient httpClient;

    public ConsultasController()
    {
        this.urlApi = Global.urlApi;
        this.httpClient = new HttpClient();
    }


    public IEnumerable<PedidosTdModel> GetPedidosAbiertos(string cardcode)
    {
        var response = httpClient.GetAsync(this.urlApi + "opor/OporGet/" + cardcode, HttpCompletionOption.ResponseHeadersRead).Result;
        
        if(response.IsSuccessStatusCode)
        {
            var result = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<IEnumerable<PedidosTdModel>>(result);
        }
        else
        {
            return null;
        }
    }

    public IEnumerable<EntradasTdModel> GetEntradasAbiertos(string cardcode)
    {
        var response = httpClient.GetAsync(this.urlApi + "opdn/OpdnGet/" + cardcode, HttpCompletionOption.ResponseHeadersRead).Result;
        if (response.IsSuccessStatusCode)
        {
            var result = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<IEnumerable<EntradasTdModel>>(result);
        }
        else
        {
            return null;
        }
    }

    public IEnumerable<FacturasTdModel> GetFacturasAbiertas(string cardcode)
    {
        var response = httpClient.GetAsync(this.urlApi + "opch/" + cardcode, HttpCompletionOption.ResponseHeadersRead).Result;
        if (response.IsSuccessStatusCode)
        {
            var result = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<IEnumerable<FacturasTdModel>>(result);
        }
        else
        {
            return null;
        }
    }

    public IEnumerable<PagosTdPagos> GetPagosEfectuadosOvpm(string cardcode, DateTime date1, DateTime date2)
    {
        string url = this.urlApi + "ovpm/OvpmGet/" + cardcode + "/" + date1.Date.ToString("yyyy-MM-dd") + "/" + date2.Date.ToString("yyyy-MM-dd");
        var response = httpClient.GetAsync(url, HttpCompletionOption.ResponseHeadersRead).Result;
        if (response.IsSuccessStatusCode)
        {
            var result = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<IEnumerable<PagosTdPagos>>(result);
        }
        else
        {
            return null;
        }
    }
    public IEnumerable<PagosTdPagos> GetPagosEfectuados(string cardcode, DateTime date1, DateTime date2)
    {
        string url = this.urlApi + "ovpm/OvpmVpm2Get/" + cardcode + "/" + date1.Date.ToString("yyyy-MM-dd") + "/" + date2.Date.ToString("yyyy-MM-dd");
        var response = httpClient.GetAsync(url, HttpCompletionOption.ResponseHeadersRead).Result;
        if (response.IsSuccessStatusCode)
        {
            var result = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<IEnumerable<PagosTdPagos>>(result);
        }
        else
        {
            return null;
        }
    }



    /// <summary>
    /// Obtener los pedidos vinculados a las entregas listos para facturar.
    /// </summary>
    /// <param name="cardcode"></param>
    /// <returns></returns>
    public IEnumerable<PedidosModel> GetPedidos(string cardcode)
    {
        string url = this.urlApi + "opor/OporOpdnGet/" + cardcode;
        var response = httpClient.GetAsync(url, HttpCompletionOption.ResponseHeadersRead).Result;
        if (response.IsSuccessStatusCode)
        {
            var result = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<IEnumerable<PedidosModel>>(result);
        }
        else
        {
            return null;
        }
    }

    /// <summary>
    /// Obtener las partidas de las entradas de mercancia vinculadas a los pedidos.
    /// </summary>
    /// <param name="cardcode"></param>
    /// <returns></returns>
    public IEnumerable<EntradasLineModel> GetPartidas(string docnums)
    {
        string url = this.urlApi + "opdn/OpdnPdn1OporGet/" + docnums;
        var response = httpClient.GetAsync(url, HttpCompletionOption.ResponseHeadersRead).Result;
        if (response.IsSuccessStatusCode)
        {
            var result = response.Content.ReadAsStringAsync().Result;

            return JsonConvert.DeserializeObject<IEnumerable<EntradasLineModel>>(result);
        }
        else
        {
            return null;
        }
    }

}