﻿<%@ Page Title="Order Shirts MR MISGA" Language="C#" MasterPageFile="~/mrshirt.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="Styles/mrshirts.css" rel="stylesheet" type="text/css" />

	<style type="text/css">
		.style1
		{
			width: 143px;
		}
		.style2
		{
			width: 143px;
			height: 26px;
		}
		.style3
		{
			height: 26px;
		}
	    #OrderForm {
            width: 90%;
        }
	    </style>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
		Order Shirts 
	</h2>

	<asp:Label ID="lblNoOrders" runat="server" Text=""></asp:Label>
	<asp:Panel ID="OrderPanel" runat="server">
		<p>
		    To get started with ordering a shirt, enter you first and last name.&nbsp; Next, 
            select the style of shirt you are placing in this order. Then select the 
            quantity and size.&nbsp; You must place a separate order for each style and size that 
            you want.</p>
	<asp:Panel ID="Panel1" runat="server" Height="272px">
        <div>
	<table id="OrderForm" runat="server">
	 <tr>
	<td class="style1">
		<asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
	</td>
	<td>
		<asp:TextBox ID="tbFirstName" runat="server" Width="200px"></asp:TextBox>
		<asp:Label ID="lblCustID" runat="server" Text="Customer ID" Visible="False"></asp:Label>
 	</td>

	</tr>

	<tr>
	<td class="style1">
		<asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
	</td>
	<td>
		<asp:TextBox ID="tbLastName" runat="server" Width="200px"></asp:TextBox>
 	</td>
	</tr>

	<tr>
	<td>
		<asp:Label ID="lblShirt" runat="server" Text="Shirt Style:"></asp:Label></td>
	<td>
		
		<asp:DropDownList ID="ddlShirt" runat="server" AutoPostBack="True" 
			onselectedindexchanged="ddlShirt_SelectedIndexChanged" Width="205px" 
			CausesValidation="True">
			<asp:ListItem Enabled="False"> (Select one)</asp:ListItem>
			<asp:ListItem Selected="True">MEN&#39;S UNDER ARMOR</asp:ListItem>
		</asp:DropDownList>
		<asp:Label ID="lblStyle" runat="server" 
            Text=" (Color and Size options will show once Shirt Style is selected)" 
            Visible="False" ForeColor="Firebrick"></asp:Label>
	</td>
	</tr>
	
	<tr>
	<td class="style2">
		<asp:Label ID="lblQty" runat="server" Text="Quantity:"></asp:Label>
	</td>
	<td class="style3">
		<asp:DropDownList ID="ddlQty" runat="server" 
			onselectedindexchanged="ddlQty_SelectedIndexChanged" Width="205px">
			<asp:ListItem>1</asp:ListItem>
			<asp:ListItem>2</asp:ListItem>
			<asp:ListItem>3</asp:ListItem>
			<asp:ListItem>4</asp:ListItem>
			<asp:ListItem>5</asp:ListItem>
		</asp:DropDownList>
		<asp:Label ID="lblNumber" runat="server" Text="Label" Visible="False"></asp:Label>
	</td>
	</tr>
	
	<tr>
	<td class="style1">
		<asp:Label ID="lblColor" runat="server" Text="Color:"></asp:Label>
	</td>
	<td>
		<asp:DropDownList ID="ddlColorMens" runat="server" Width="205px">
		    <asp:ListItem Selected="True" Value="Mediterranean">Mediterranean</asp:ListItem>
            <asp:ListItem Value="Tropical Tide">Tropical Tide</asp:ListItem>
            <asp:ListItem Value="Jupiter Blue">Jupiter Blue</asp:ListItem>
            <asp:ListItem Value="Lumos Lime">Lumos Lime</asp:ListItem>
            <asp:ListItem Value="Academy">Academy</asp:ListItem>
            <asp:ListItem Value="Black">Black</asp:ListItem>
		</asp:DropDownList>
		<asp:DropDownList ID="ddlColorLadies" runat="server" Width="205px" Visible="False">
			<asp:ListItem Selected="True">Chalk Blue/White</asp:ListItem>
			<asp:ListItem>White/Black</asp:ListItem>
			<asp:ListItem>Red/White</asp:ListItem>
			<asp:ListItem>Black/White</asp:ListItem>
		</asp:DropDownList>
		<asp:Label ID="lblShirtColor" runat="server" Text="Label" Visible="False"></asp:Label>
	</td>
	</tr>
        <tr style="visibility: hidden;">
            <td class="style1">
                <asp:Label ID="lblLength" runat="server" Text="Length:" Visible="False"></asp:Label>
                </td>
            <td>
                <asp:DropDownList ID="ddlLengthMens" runat="server" Width="205px" Visible="False">
                    <asp:ListItem Selected="True">Regular</asp:ListItem>
                    <asp:ListItem>Tall</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
	<tr>
	<td class="style1">
		<asp:Label ID="lblSize" runat="server" Text="Size"></asp:Label>
	    :</td>
	<td>
		<asp:DropDownList ID="ddlSizeMens" runat="server" Width="205px">
			<asp:ListItem>Small</asp:ListItem>
			<asp:ListItem>Medium</asp:ListItem>
			<asp:ListItem Selected="True">Large</asp:ListItem>
			<asp:ListItem>X-Large</asp:ListItem>
			<asp:ListItem>2X-Large</asp:ListItem>
		    <asp:ListItem>3X-Large</asp:ListItem>
		</asp:DropDownList>
		<asp:DropDownList ID="ddlSizeLadies" runat="server" Width="205px" Visible="False">
			<asp:ListItem>X-Small</asp:ListItem>
			<asp:ListItem>Small</asp:ListItem>
			<asp:ListItem Selected="True">Medium</asp:ListItem>
			<asp:ListItem>Large</asp:ListItem>
			<asp:ListItem>X-Large</asp:ListItem>
			<asp:ListItem Enabled="False">XX-Large</asp:ListItem>
		</asp:DropDownList>
		<asp:Label ID="lblShirtSize" runat="server" Text="Label" Visible="False"></asp:Label>
	</td>
	</tr>
	
	</table>
	 <p>
		 <asp:Button ID="btnSubmit" runat="server" Text="Place Order" 
			 onclick="btnSubmit_Click" />
		 <asp:Label ID="lblOrderResult" runat="server" ForeColor="Black"></asp:Label>
		</p> 
		<br />      
    </div>        
    </asp:Panel>        

	</asp:Panel><br />

</asp:Content>

