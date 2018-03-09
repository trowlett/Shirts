<%@ Page Title="Review Shirt Order MR MISGA" Language="C#" Debug="true" MasterPageFile="~/mrshirt.master" AutoEventWireup="true" CodeFile="Review.aspx.cs" Inherits="Review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	<link href="Styles/mrshirts.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<h2>
		Review Shirt Orders</h2>
	<p>
		To review your shirt order, select your name from the list below.&nbsp; 
		The click on the &quot;Review Order&quot; button.&nbsp; Your order will not display until 
		you click on the &quot;Review Order&quot; button.&nbsp; To review all the 
        orders, select &quot;All&quot;.</p>
	<div class="revieworder">
	<p>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
			ConnectionString="<%$ ConnectionStrings:MRMISGADBConnect %>" 
			
            SelectCommand="SELECT Customers.CustID, Customers.Name, Shirts.Filled FROM Customers INNER JOIN Shirts ON Customers.CustID = Shirts.CustID WHERE (Shirts.Filled = 0) ORDER BY Customers.Name, Customers.CustID"></asp:SqlDataSource>
		<asp:DropDownList ID="ddlNames" runat="server" CssClass="ddl" 
			onselectedindexchanged="ddlNames_SelectedIndexChanged">
		</asp:DropDownList>
		<asp:Button ID="btnReview" runat="server" onclick="btnReview_Click" 
			Text="Review Order" CssClass="orderbutton" />
		<asp:Label ID="lblcustID" runat="server" Visible="False"></asp:Label>
	</p>

	<p>
		<asp:Repeater ID="ShirtOrderRepeater" runat="server">
		<ItemTemplate>
		<table>
			<tr>
<!--				<th class="SeqNo">Seq No</th> -->
				<th class="CustID">Customer Name</th>
				<th class="Qty">Qty</th>
				<th class="Style">Style</th>
				<th class="Size">Size</th>
<!--                <th class="Size">Length</th> -->
				<th class="Color">Color</th>
				<th class="Date">Date</th>
<!--				<th class="CancelHdr">Cancel</th> -->
				</tr>
				
				<asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Eval("Orders") %>'>
				<ItemTemplate>
			<tr>
<!--				<td class="SeqNo"><%# ((OrderEntry)Container.DataItem).SeqNo  %></td> -->
				<td class="CustID"><%# ((OrderEntry)Container.DataItem).CustName %></td>
				<td class="Qty"><%# ((OrderEntry)Container.DataItem).Qty %></td>
				<td class="Style"><%# ((OrderEntry)Container.DataItem).Style %></td>
				<td class="Size"><%# ((OrderEntry)Container.DataItem).Size %></td>
<!--                <td class="Size"><%# ((OrderEntry)Container.DataItem).Length %></td> -->
				<td class="Color"><%# ((OrderEntry)Container.DataItem).Color %></td>
				<td class="Date"><%# ((OrderEntry)Container.DataItem).Date.ToShortDateString() %></td>
<!--				<td class="Cancel"><%# ((OrderEntry)Container.DataItem).Cancel %></td> -->
				</tr>
				</ItemTemplate>
				</asp:Repeater>
			</table>
			</ItemTemplate>
		</asp:Repeater>
		</p>
		</div>
	
</asp:Content>

