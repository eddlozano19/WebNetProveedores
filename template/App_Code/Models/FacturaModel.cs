using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FacturaModel
/// </summary>
public class FacturaModel
{
    public int DocNumPedido { get; set; }
    public int DocEntryPedido { get; set; }
    public int DocEntry { get; set; }
    public int DocNum { get; set; }
    public string SeriesName { get; set; }
    public string DocType { get; set; }
    public string CardCode { get; set; }
    public string CardName { get; set; }
    public string DocDate { get; set; }
    public string DocDueDate { get; set; }
    public string NumAtCard { get; set; }
    public string DocCur { get; set; }
    public string Rounding { get; set; }
    public string Comments { get; set; }
    public string Address2 { get; set; }
    public double RoundDif { get; set; }
    public double SubTotal { get; set; }
    public double VatSum { get; set; }
    public double DocTotal { get; set; }


    public int LineNum { get; set; }
    public string ItemCode { get; set; }
    public string Dscription { get; set; }
    public double Quantity { get; set; }
    public double OpenQty { get; set; }
    public double OpenCreQty { get; set; }
    public double Price { get; set; }
    public double DiscPrcnt { get; set; }
    public string Currency { get; set; }
    public string unitMsr { get; set; }
    public string WhsCode { get; set; }
    public double VatPrcnt { get; set; }
    public string ShipDate { get; set; }
    public int SlpCode { get; set; }
    public string FreeTxt { get; set; }
    public double LineTotal { get; set; }
    public double VatSumLine { get; set; }


    public string lmUUID { get; set; }
    public string lmAttachXML { get; set; }

}