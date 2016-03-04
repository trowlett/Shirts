using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Collections.ObjectModel;

/// <summary>
/// Summary description for Shirt_Order
/// </summary>
public class Shirt_Order
{
	private Collection<OrderEntry> orders = new Collection<OrderEntry>();

	public Collection<OrderEntry> Orders
	{
		get
		{
			return this.orders;
		}
	}

	public static Shirt_Order LoadFromShirtsDB(Int32 CustID)
	{
		string MRMISGADBConn = ConfigurationManager.ConnectionStrings["MRMISGADBConnect"].ToString();
		MRMISGADB db = new MRMISGADB(MRMISGADBConn);

		Shirt_Order target = new Shirt_Order();
		var sorder =
			from o in db.Shirts
			where (o.Cancel == 0 && o.Filled == 0)
			join c in db.Customers on o.CustID equals c.CustID
			orderby c.Name
			select new { o.Seq, c.CustID, c.Name, o.Qty, o.Style, o.Size, o.Color, o.Cancel, o.TimeStamp, o.Filled };

		foreach (var item in sorder)
		{
			if ((CustID == 0) ^ (CustID == item.CustID))
			{
				OrderEntry oe = new OrderEntry()
				{
					SeqNo = item.Seq,

					CustName = item.Name,
					Qty = item.Qty,
					Style = item.Style,
					Size = item.Size,
					Color = item.Color,
					Cancel = item.Cancel,
					Filled= item.Filled,
					Date = item.TimeStamp
				};

				target.orders.Add(oe);
			}
		}
		return target;
	}
	public Shirt_Order()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}