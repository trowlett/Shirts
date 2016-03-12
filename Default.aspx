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
        We will again be putting in an order for Musket Ridge MISGA shirts for this 
        season. The shirt is from Nike. It will have the Musket Ridge Golf 
        Club logo on the front and MISGA on the sleeve. 

    </p>
    <p>
        Here is a link to the Nike Catalog showing the Nike Victory solid color shirt.<br /> 
        <a href="http://store.nike.com/us/en_us/pd/victory-solid-standard-fit-golf-polo/pid-10741145/pgid-10940844">http://store.nike.com/us/en_us/pd/victory-solid-standard-fit-golf-polo/pid-10741145/pgid-10940844</a>
        &nbsp;&nbsp;
    </p>
    <p>
        The color we will be ordering is “University blue/white” and is similar to the color shirt we have traditionally 
        used.&nbsp; This exact color is not shown on the website, but if you are interested in seeing it you can ask 
        the proshop to show you the Nike catalog. 

    </p>
    <p>
        There is also a women's version which you can see here:<br />
        <a href="http://store.nike.com/us/en_us/pd/victory-solid-golf-polo/pid-10741510/pgid-10940906">http://store.nike.com/us/en_us/pd/victory-solid-golf-polo/pid-10741510/pgid-10940906</a>
        &nbsp;</p>
    <p>
        The color for the women's shirt is Chalk blue/white.
    </p>
    <p>
        The cost of the shirt is $53, plus Md. sales tax for a total of $56.18. 
        As in the past Musket Ridge MISGA will pay $10 towards the first shirt you order. 
        You can order additional shirts if you wish, in whatever color you wish, 
        but the first order must be in the University blue/white, or, for ladies Chalk blue/white. 
<!--        Additional shirts ordered will be at the full price. -->

    </p>
    <div id="to_order">
        <p>To place an order:</p>
        <ul>
            <li> click on the Order Shirt tab above.&nbsp; To order more than 
                one style or size shirt, please place a separate order for each unique Style and size.&nbsp; 
                </li>
            <li>You may review your completed order by clicking on the Review Order tab.</li>
            <li>You will be notified when the shirt order has arrived at the Golf Shop. </li>
            <li>To change or cancel your order, contact Tom Rowlett via email 
                <a href="mailto:tom.rowlett@gmail.com?subject=Change MR MISGA Shirt Order">Tom.Rowlett@gmail.com</a> or phone (301) 473-4785.</li>
        </ul>
    </div>
        <p class="bold">To pay:</p>
    <p>
        You can do this by sending the Musket Ridge Pro Shop a check check (in the amount of $46.18 for the first shirt and $56.18 for each additional shirt), 
        calling them to pay via credit card, or paying in person at the pro shop by 
    <asp:Label ID="lblPrePayDate" runat="server" Text="PrePay Date" ForeColor="Firebrick"></asp:Label>. 

    </p>

    <p class="bold">
        The orders will be placed on <asp:Label ID="lblOD1" runat="server" Text="'Order Date'"></asp:Label>, and payment must be made to the pro shop by 
        <asp:Label ID="lblPPD1" runat="server" Text="'PrePay Date'"></asp:Label>.&nbsp; <span style="color: firebrick;"> If you do not pay by that date, no shirt(s) will be ordered for you.</span> 
        
    </p>
    <div id="summary">
        To summarize: if you wish to order a shirt this year: 
            <ol><li>
                Click on the Order Shirt tab above; and 
                </li>
                <li>
                    pay the pro shop by <asp:Label ID="lblPPD2" runat="server" Text="'PrePay Date'"></asp:Label>. 
                </li></ol>
            <p>The shirts should be ready 3 to 4 weeks after that.&nbsp;
        </p>
        <p>
            Also, we must have a minimum of 20 shirts ordered.  
            So, it is possible that there will be no shirts ordered this year if we do not meet this minimum.
        </p>
    </div>
    
    <hr />
</asp:Content>