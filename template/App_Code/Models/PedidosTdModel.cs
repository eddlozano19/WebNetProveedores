﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PedidosTdModel
/// </summary>
public class PedidosTdModel
{
    public string DocEntry { get; set; }
    public string DocNum { get; set; }
    public string DocType { get; set; }
    public string DocDate { get; set; }
    public string DocDueDate { get; set; }
    public string CardCode { get; set; }
    public string CardName { get; set; }
    public string NumAtCard { get; set; }
    public string DocCur { get; set; }
    public string DocRate { get; set; }
    public string Rounding { get; set; }
    public string RoundDif { get; set; }
    public string SubTotal { get; set; }
    public string VatSum { get; set; }
    public string DocTotal { get; set; }
}