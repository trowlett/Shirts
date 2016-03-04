using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Order
/// </summary>
public class Order
{
	public int CustomerID;
	public bool IsNewCustomer;
//	public string requiredColor = "Bimini";
	private Customers NewCustomer;
 
	protected bool CheckForRequiredShirt(int cid)
	{
        int custID = cid;
        string requiredColor = ConfigurationManager.AppSettings["DefaultShirtColor"].ToString();
		bool ok = false;
		string MRMISGADBConn = ConfigurationManager.ConnectionStrings["MRMISGADBConnect"].ToString();
		MRMISGADB db = new MRMISGADB(MRMISGADBConn);
		var item = db.Shirts.FirstOrDefault(s => s.CustID == cid && s.Color == requiredColor);
//        Shirts item = db.Shirts.FirstOrDefault(s => s.CustID == custID && s.Color == requiredColor);
//        var item = from s in db.Shirts
//                   where (s.CustID == custID && s.Color == requiredColor)
//                   select s;
		if (item != null)
		{
			ok = true;
		}
		return ok;
	}

	public bool addOrder(string ln, string fn, int qty, string style, string size, string color)
	{
		bool result = false;
        string requiredColor = ConfigurationManager.AppSettings["DefaultShirtColor"].ToString();

		// get member id
		MrTimeZone tz = new MrTimeZone();
		IsNewCustomer = getCustomerID(ln, fn);

		// validate that member has ordered at least one bimini blue shirt
		bool hasRequiredShirt = CheckForRequiredShirt(CustomerID);
		
		
		// if so add order to database and return true

		int newSeq = 0;
		string MRMISGADBConn = ConfigurationManager.ConnectionStrings["MRMISGADBConnect"].ToString();
		MRMISGADB db = new MRMISGADB(MRMISGADBConn);
		var shirtOrders = db.Shirts.Count();
        newSeq = db.Shirts.Count() + 1;

//		newSeq++;

		Shirts shirt = new Shirts()
		{
			Seq = newSeq,
			CustID = CustomerID,
			Qty = qty,
			Style = style,
			Size = size,
			Color = color,
			TimeStamp = tz.eastTimeNow(),
			Cancel = 0
		};
		if (shirt.Color == requiredColor)
		{
			db.Shirts.InsertOnSubmit(shirt);
			db.SubmitChanges();
			if (IsNewCustomer)
			{
				addCustomerToDB();
			}
			result = true;

		}
		else
		{
			if (hasRequiredShirt)
			{
				db.Shirts.InsertOnSubmit(shirt);
				db.SubmitChanges();
				result = true;
			}
			else
			{
				result = false;
			}
		}

		return result;
	}

	protected bool getCustomerID(string ln, string fn)
	{
		bool _newCustomer = false;
		string keyName = ln + ", " + fn;
		string MRMISGADBConn = ConfigurationManager.ConnectionStrings["MRMISGADBConnect"].ToString();
		MRMISGADB db = new MRMISGADB(MRMISGADBConn);
		int custcnt = 0;
        int lastCust = 0;
		var customerCount =
		   from c in db.Customers
		   orderby c.CustID
           select c;
//		   select new { c.CustID, c.Name };
        if (customerCount != null)
        {
            foreach (var item in customerCount)
            {
                //			custcnt=item.CustID;
                lastCust = item.CustID;             // get Highest customer ID in Database
            }
        }

		var query =
			from p in db.Customers
			where p.Name == keyName
			select p;

		Customers customer = query.FirstOrDefault();     // Lookup Player in Players Database
		if (customer != null)
		{
			custcnt = customer.CustID;
			_newCustomer = false;
		}
		else
		{
			custcnt = lastCust + 1;
			NewCustomer = new Customers()
			{
				CustID = custcnt,
				Name = keyName,
				Lname = ln,
				Fname = fn
			};
			_newCustomer = true;
		}
		CustomerID = custcnt;
		return _newCustomer;
	}

	private void addCustomerToDB()
	{
		int cid = NewCustomer.CustID;
		string MRMISGADBConn = ConfigurationManager.ConnectionStrings["MRMISGADBConnect"].ToString();
		MRMISGADB db = new MRMISGADB(MRMISGADBConn);
		var item = db.Customers.FirstOrDefault(c => c.CustID == cid);
		if (item == null)
		{
			db.Customers.InsertOnSubmit(NewCustomer);
			db.SubmitChanges();
		}

	}

	public Order()
	{
		//
		// TODO: Add constructor logic here
		//
		CustomerID = 99;
	}
}