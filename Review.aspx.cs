using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Review : System.Web.UI.Page
{
    public Shirt_Order so { get; set; }
    int custID = 0;

    protected void ShowControls (bool show)
    {
        ShirtOrderRepeater.Visible = show;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowControls(false);
            InitializeDDLNames();
        }
    }
    protected void btnReview_Click(object sender, EventArgs e)
    {
        custID = Convert.ToInt32(ddlNames.SelectedValue);
        lblcustID.Text = custID.ToString();
        ChangeOrderDisplay(custID);

    }
    protected void ddlNames_SelectedIndexChanged(object sender, EventArgs e)
    {
        int n = ddlNames.SelectedIndex;
        int cust = Convert.ToInt32(ddlNames.SelectedValue);
        ChangeOrderDisplay(n);

    }
    protected void ChangeOrderDisplay(int iD)
    {
        this.so = Shirt_Order.LoadFromShirtsDB(iD);
        this.ShirtOrderRepeater.DataSource = new Shirt_Order[] { this.so };
        this.ShirtOrderRepeater.DataBind();
        ShowControls(true);
    }
    protected void InitializeDDLNames()
    {
        string MRMISGADBConn = ConfigurationManager.ConnectionStrings["MRMISGADBConnect"].ToString();
        MRMISGADB db = new MRMISGADB(MRMISGADBConn);
        string pName = "";
        var sorder =
            from o in db.Shirts
            where (o.Cancel == 0 && o.Filled == 0)
            join c in db.Customers on o.CustID equals c.CustID
            orderby c.Name
            select new { o.Seq, c.CustID, c.Name, o.Qty, o.Style, o.Size, o.Color, o.Cancel, o.TimeStamp, o.Filled };

        ListItem all = new ListItem();
        all.Text = "All";
        all.Value = "0";
        ddlNames.Items.Add(all);
        foreach (var item in sorder)
        {
            if (item.Name.Trim() != pName)
            {
                ListItem customer = new ListItem();
                customer.Text = item.Name;
                customer.Value = item.CustID.ToString().Trim();
                ddlNames.Items.Add(customer);
                pName = item.Name.Trim();
            }
        }



    }
}