using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PagosModel
/// </summary>
public class PagosModel
{
    public int DocEntry { get; set; }
    public int DocNum { get; set; }
    public string DocDate { get; set; }
    public string CardCode { get; set; }
    public string CardName { get; set; }

    public string DocCurr { get; set; }
    public double DocTotal { get; set; }

    public string lmUUID { get; set; }
    public string lmAttachXML { get; set; }
}