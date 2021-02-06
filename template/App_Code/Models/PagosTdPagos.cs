using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PagosTdPagos
/// </summary>
public class PagosTdPagos
{
    public string DocEntry { get; set; }
    public string DocNum { get; set; }
    public string CardCode { get; set; }
    public string CardName { get; set; }
    public string DocDate { get; set; }
    public string CounterRef { get; set; }
    public string DocCurr { get; set; }
    public string CashSum { get; set; }
    public string CheckSum { get; set; }
    public string TrsfrSum { get; set; }
    public string DocTotal { get; set; }
    public string FormaPago { get; set; }
    public string NoFacturaInterno { get; set; }
    public string NoFactura { get; set; }
    public string SumApplied { get; set; }
}