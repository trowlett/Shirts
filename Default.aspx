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
    </asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Ordering Musket Ridge MISGA Golf Shirts for 
        <asp:Label ID="lblYear" runat="server" Text="XXXX"></asp:Label></h2>
    <h2><asp:Label ID="lblDayCountdown" runat="server" Text="XX"></asp:Label>
        </h2>
    <hr />
    <p>
       We will again be ordering Musket Ridge MISGA shirts for this season.  The shirt is from Underarmour.  It will have the 
        Musket Ridge Golf Club logo on the front and MISGA on the sleeve.


    </p>
    <p>
       Here is a link to the Underarmour website showing the shirt: <br /> 
        <a href="https://www.underarmour.com/en-us/threadborne-boundless-polo/pid1306112-437">
                 https://www.underarmour.com/en-us/threadborne-boundless-polo/pid1306112-437</a>
        &nbsp;&nbsp;
    </p>
    <p>
        The color we will be ordering is 
        "<asp:Label ID="lblShirtColor1" runat="server" Text="Default Shirt Color"></asp:Label>
        ” and is similar to the color shirt we have traditionally 
        used, though this one has a stripe pattern with solid color sleeves and collar.&nbsp; You will see a link to a size 
        guide on the website if you are unsure as to what size to order. 

    </p>
<!--
        <p>
        There is also a women's version which you can see here:<br />
        <a href="http://store.nike.com/us/en_us/pd/victory-solid-golf-polo/pid-10741510/pgid-10940906">http://store.nike.com/us/en_us/pd/victory-solid-golf-polo/pid-10741510/pgid-10940906</a>
        &nbsp;</p>
    <p>
        The color for the women's shirt is Chalk blue/white.
    </p>
    -->
    <p>
        The cost of the shirt is $58.65, plus Md. Sales tax for a total of $62.17.  
        As in the past MR MISGA will pay $10 towards the first shirt you order.  
        You can order additional shirts if you wish (at the full price of $62.17), 
        in whatever color you wish, but the first order must in the 
        "<asp:Label ID="lblDSC2" runat="server" Text="Default Shirt Color"></asp:Label>" color. 

    </p>
    <div id="to_order">
        <p>To place an order:</p>
        <ul>
            <li> click on the Order Shirt tab above.&nbsp; To order more than 
                one style or size shirt, please place a separate order for each unique Color and size.&nbsp; 
                </li>
            <li>Review your completed order by clicking on the "Review Order" tab.</li>
            <li>You will be notified when the shirt order has arrived at the golf shop (three to four weeks after April 18). </li>
            <li>To change or cancel your order, contact Tom Rowlett via email 
                <a href="mailto:tom.rowlett@gmail.com?subject=Change MR MISGA Shirt Order">Tom.Rowlett@gmail.com</a> or phone (301) 473-4785.</li>
        </ul>
    </div>
        <p class="bold">To pay:</p>
    <p>
        You can do this by sending the Musket Ridge Pro Shop a check (in the amount of $52.17 for the first shirt and $62.17 for each additional shirt), 
        calling them to pay via credit card, or paying in person at the pro shop by c.o.b.  
    <asp:Label ID="lblPrePayDate" runat="server" Text="PrePay Date" ForeColor="Firebrick"></asp:Label>. 

   &nbsp; <span style="color: firebrick;" class="bold"> If you do not pay by that date, no shirt(s) will be ordered for you.</span> 
        
    </p>
    <div id="summary">
        <!--
        To summarize: if you wish to order a shirt this year: 
            <ol><li>
                Click on the Order Shirt tab above; and 
                </li>
                <li>
                    pay the pro shop by <asp:Label ID="lblPPD2" runat="server" Text="'PrePay Date'"></asp:Label>. 
                </li></ol>
            <p>The shirts should be ready 3 to 4 weeks after that.&nbsp;
        </p>
        -->
        <p>
            We must have a minimum of 24 shirts ordered.  
            So, it is possible that there will be no shirts ordered this year (if we  fall short of this number).
        </p>
    </div>
    
    <hr />
</asp:Content>