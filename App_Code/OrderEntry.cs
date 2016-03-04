using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderEntry
/// </summary>
public class OrderEntry
{
	public int SeqNo { get; set; }
	public string CustName { get; set; }
	public int Qty { get; set; }
	public string Style { get; set; }
	public string Size { get; set; }
	public string Color { get; set; }
	public DateTime Date { get; set; }
	public int Cancel { get; set; }
	public int Filled { get; set; }


	public OrderEntry()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}