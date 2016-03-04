<%@ Page Title="Shirt Info Musket Ridge MISGA" Language="C#" MasterPageFile="~/mrshirt.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
.bold 
{
    font-weight: bold;
} 
    .style1
    {
        color: firebrick;
    }
#summary {
        font-size: large;
        color: firebrick;
        font-weight: bold;
    }
#to_order p {
            font-weight: bold;
        }
 </style>
    <% ShirtDeadline = "4//29//2015"; %>
    </asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Ordering Musket Ridge MISGA Golf Shirts for 
        <asp:Label ID="lblYear" runat="server" Text="XXXX"></asp:Label></h2>
    <h2><asp:Label ID="lblDayCountdown" runat="server" Text="XX"></asp:Label>
        </h2>
    <hr />
    <p>
        We will again be putting in an order for Musket Ridge MISGA shirts for this 
        season. The shirt is from Under Armour. It will have the Musket Ridge Golf 
        Club logo on the front and MISGA on the sleeve. 

    </p>
    <p>
        Here is a link to the Under Armour Catalog: Click here: 
        <a href="http://s7d4.scene7.com/s7viewers/html5/eCatalogViewer.html?serverUrl=http://s7d4.scene7.com/is/image/&config=Scene7SharedAssets/Universal_HTML5_eCatalog&contentRoot=http://s7d4.scene7.com/skins/&asset=GearForSports//ua_golf">UA Golf Spring 15</a>
        &nbsp;&nbsp;
    </p>
    <p>
        The color we will be ordering is &#39;Alpine&#39; (similar to the past blue colors 
        we have used).&nbsp; See page 4 <span class="style1">(look for the page number in the upper or lower right side of the page)</span> for the men&#39;s solid colors.&nbsp; See page 26 for 
        the Women&#39;s solid colors. 

    </p>
    <p>
        The cost of the shirt is $49, plus Md. sales tax; for a total of $51.94. 
        As in the past MR Misga will pay $10 towards the first shirt you order. 
        You can order additional shirts if you wish, in whatever color you wish, 
        but the first order must be in the Alpine color. Additional shirts ordered 
        will be at the full price. 

    </p>
    <div id="to_order">
        <p>To place an order:</p>
        <ul>
            <li> click on the Order Shirt tab above.&nbsp; To order more than 
                one style or size shirt, please place a separate order for each unique Style and size.&nbsp; 
                </li>
            <li>You may review your completed order by clicking on the Review Order tab.</li>
            <li>You will be notified when the shirt order has arrived at the Golf Shop. </li>
            <li>To change or cancel your order, contact me via email 
                <a href="mailto:tom.rowlett@gmail.com?subject=Change MR MISGA Shirt Order">Tom.Rowlett@gmail.com</a> or phone (301) 473-4785.</li>
        </ul>
    </div>
        <p class="bold">To pay:</p>
    <p>
        You can do this by sending the Musket Ridge Pro Shop a check, calling them to pay via credit 
        card, or paying in person at the pro shop by 
    <asp:Label ID="lblPrePayDate" runat="server" Text="PrePay Date" ForeColor="Firebrick"></asp:Label>. 

    </p>

    <p class="bold">
        The orders will be placed on <asp:Label ID="lblOD1" runat="server" Text="'Order Date'"></asp:Label>, and payment must be made to the pro shop by 
        <asp:Label ID="lblPPD1" runat="server" Text="'PrePay Date'"></asp:Label>.&nbsp; <span style="color: firebrick;"> If you do not pay by that date, no shirt(s) will be ordered for you.</span> 
        
    </p>
    <div id="summary">
        To summarize: if you wish to order a shirt this year: 
            <ol><li>
                go the the MR MISGA website to place the order; and 
                </li>
                <li>
                    pay the pro shop by <asp:Label ID="lblPPD2" runat="server" Text="'PrePay Date'"></asp:Label>. 
                </li></ol>
            <p>The shirts should be ready 3 to 4 weeks after that.&nbsp;
        </p>
    </div>
    <br />
</asp:Content>