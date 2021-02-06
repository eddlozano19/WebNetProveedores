using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PedidosModel
/// </summary>
public class PedidosModel
{
    public int DocNumPedido { get; set; }
    public int DocEntryPedido { get; set; }
    public string DocCurPedido { get; set; }
    public double DocTotalPedido { get; set; }
    public string DocTypePedido { get; set; }
    public DateTime DocDate { get; set; }
}