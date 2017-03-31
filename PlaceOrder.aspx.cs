using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlaceOrder : System.Web.UI.Page
{
    public string MensRequiredShirtColor;
    public string WomensRequiredShirtColor;
    public string RequiredShirtColor;
    public string CustomerName;
    protected static string Proper(string s)
    {
        string txt = "";
        for (int i = 0; i < s.Length; i++)
        {
            if (i == 0)
            {
                txt = "" + (char)s[i];
                txt = txt.ToUpper();
            }
            else
            {
                string tmp = "" + (char)s[i];
                txt = txt + tmp.ToLower();
            }
        }
        return txt;
    }

    protected DateTime today = DateTime.Now;
    protected DateTime enddate = new DateTime(2013, 8, 30, 23, 59, 59);

    protected void Page_Load(object sender, EventArgs e)
    {
        enddate = Convert.ToDateTime(ConfigurationManager.AppSettings["ShirtDeadline"]);
            if (!IsPostBack)
            {
                resetDropDowns();
            }
        if (today.CompareTo(enddate) > 0)
        {
            btnSubmit.Enabled = false;
            lblNoOrders.Text = "<h2>Today is after "+enddate.ToLongDateString()+". Sorry no more orders are accepted.</h2>";
            OrderPanel.Visible = false;
                    }
        MensRequiredShirtColor = ConfigurationManager.AppSettings["MensDefaultShirtColor"].ToString();
        WomensRequiredShirtColor = ConfigurationManager.AppSettings["WomensDefaultShirtColor"].ToString();
        RequiredShirtColor = MensRequiredShirtColor;
    }

    protected void ddlShirt_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlShirt.SelectedIndex == 0)
        {
            resetDropDowns();
        }
        if (ddlShirt.SelectedIndex == 1)
        {
            ddlSizeMens.Enabled = true;
            ddlSizeMens.Visible = true;
            ddlColorMens.Enabled = true;
            ddlColorMens.Visible = true;
        }
        if (ddlShirt.SelectedIndex == 2)
        {
            ddlSizeLadies.Enabled = true;
            ddlSizeLadies.Visible = true;
            ddlColorLadies.Enabled = true;
            ddlColorLadies.Visible = true;
        }
    }

    protected void resetDropDowns()
    {
        ddlSizeLadies.Enabled = false;
        ddlSizeLadies.Visible = false;
        ddlSizeMens.Enabled = false;
        ddlSizeMens.Visible = false;
        ddlColorLadies.Enabled = false;
        ddlColorLadies.Visible = false;
        ddlColorMens.Enabled = false;
        ddlColorMens.Visible = false;
        ddlQty.SelectedIndex = 0;

    }

    protected void ddlQty_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int nameErr = 0;
        btnSubmit.Enabled = false;
        string color = "";
        string size = "";
        int qty = 0;
        string lname = Proper(tbLastName.Text.Trim());
        string fname = Proper(tbFirstName.Text.Trim());
        if (lname == "") nameErr = 1;       // must enter name
        if (fname == "") nameErr = 1;       // must entre Name
        if (nameErr == 0) {
            CustomerName = fname + " " + lname;
            string style = ddlShirt.SelectedValue.ToString();
            //        lblNumber.Text = ddlQty.SelectedIndex.ToString();
            //        if (ddlQty.SelectedIndex != 0)
            //        {
            //            lblStyle.Text = ddlShirt.SelectedIndex.ToString();
            if (ddlShirt.SelectedIndex != 0)
            {
                if (ddlShirt.SelectedIndex == 1)
                {
                    color = ddlColorMens.SelectedValue.ToString();
                    RequiredShirtColor = MensRequiredShirtColor;
                    size = ddlSizeMens.SelectedValue.ToString();
                }
                if (ddlShirt.SelectedIndex == 2)
                {
                    color = ddlColorLadies.SelectedValue.ToString();
                    RequiredShirtColor = WomensRequiredShirtColor;
                    size = ddlSizeLadies.SelectedValue.ToString();
                }
                //                lblShirtColor.Text = color;
                //                lblShirtSize.Text = size;
                qty = Convert.ToInt32(ddlQty.SelectedValue);
                Order ord = new Order();
                bool OrderOK = ord.addOrder(lname, fname, qty, style, size, color, RequiredShirtColor);
                //                lblCustID.Text = ord.CustomerID.ToString();
                if (OrderOK)
                {
                    lblOrderResult.Text = string.Format("Thank you {0} for your order.", CustomerName);
                    lblOrderResult.ForeColor = System.Drawing.Color.Black;
                }
                else
                {
                    lblOrderResult.Text = string.Format("You must order a {0} color shirt first before you can order a shirt of another color.  Order not saved.", RequiredShirtColor);
                    lblOrderResult.ForeColor = System.Drawing.Color.Firebrick;
                    btnSubmit.Enabled = true;
                }
            }
            else
            {
                lblStyle.Text = "You must select a Shirt Style.";
                lblStyle.ForeColor = System.Drawing.Color.Firebrick;
                lblStyle.Visible = true;
                lblOrderResult.Text = "Order NOT placed.";
                lblOrderResult.ForeColor = System.Drawing.Color.Firebrick;
            }
        }
        else
        {
            lblOrderResult.Text = string.Format("Please enter your name and try again");

        }
//        }
 
//        ddlShirt.SelectedIndex = 0;
//        tbFirstName.Text = "";
//        tbLastName.Text = "";
    }
}