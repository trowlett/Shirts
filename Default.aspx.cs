using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public DateTime orderDeadline { get; set; }
    public string ShirtDeadline { get; set; }
    public DateTime od { get; set; }
    public string orderDateText;
    public string prePayDateText;
    public string MensRequiredShirtColor;
    public string WomensRequiredShirtColor;
    public string RequiredShirtColor { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        ShirtDeadline = ConfigurationManager.AppSettings["ShirtDeadline"];
        orderDeadline = Convert.ToDateTime(ShirtDeadline);
        od = new DateTime(orderDeadline.Year, orderDeadline.Month, orderDeadline.Day, 23, 59, 59);
        lblDayCountdown.Text = TimeRemaining(od);
        lblYear.Text = od.Year.ToString();
        orderDateText = od.AddDays(1).ToString("MMMM  d");
        prePayDateText = od.ToString("MMMM d");
//        lblOrderDate.Text = orderDateText;
//        lblOD1.Text = orderDateText;
        lblPrePayDate.Text = prePayDateText;
//        lblPPD1.Text = prePayDateText;
        lblPPD2.Text = prePayDateText;

        MensRequiredShirtColor = ConfigurationManager.AppSettings["MensDefaultShirtColor"].ToString();
        WomensRequiredShirtColor = ConfigurationManager.AppSettings["WomensDefaultShirtColor"].ToString();
        RequiredShirtColor = MensRequiredShirtColor;
        lblShirtColor1.Text = RequiredShirtColor;
        lblDSC2.Text = RequiredShirtColor;
    }

    private string TimeRemaining(DateTime EndDate)
    {
        MrTimeZone mtz = new MrTimeZone();
        DateTime ec_Now = mtz.eastTimeNow();
        TimeSpan tsZero = new TimeSpan();
        TimeSpan tdiff = EndDate.Subtract(ec_Now);
        string result = "Orders Closed!";
        if (tdiff >= tsZero)
        {
            if (tdiff.Days > 0)
            {
                result = string.Format("{0} days, {1} hours and {2} minutes remaining to order.", tdiff.Days, tdiff.Hours, tdiff.Minutes);
            }
            else
            {
                if (tdiff.Hours > 0)
                {
                    result = string.Format("{0} hours and {1} minutes renaiming to order.", tdiff.Hours, tdiff.Minutes);
                }
                else
                {
                    result = string.Format("Just {0} minutes remaining to order.", tdiff.Minutes);
                }
            }
        }
        return result;
    }

}
