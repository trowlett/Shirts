<%@ Page Title="Summary Shirt Orders MR MISGA" Language="C#" MasterPageFile="~/mrshirt.master" AutoEventWireup="true" CodeFile="summary.aspx.cs" Inherits="summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Summary of all Shirt Orders</h2>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MRMISGADBConnect %>" 
            
            
            SelectCommand="SELECT Customers.Name, Shirts.Style, Shirts.Qty, Shirts.Size, Shirts.Color, Shirts.Seq, Shirts.CustID, Shirts.Filled FROM Shirts INNER JOIN Customers ON Shirts.CustID = Customers.CustID WHERE (Shirts.cancel = 0) AND (Shirts.CustID &gt; 0) AND (Shirts.Filled = 0) ORDER BY Customers.Name, Shirts.Style">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            DataKeyNames="Seq">
            <Columns>
                <asp:BoundField DataField="Seq" HeaderText="Seq" SortExpression="Seq" 
                    ReadOnly="True">
                <HeaderStyle HorizontalAlign="Center" Width="30px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                <HeaderStyle HorizontalAlign="Left" Width="200px" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Style" HeaderText="Style" 
                    SortExpression="Style">
                <HeaderStyle HorizontalAlign="Center" Width="150px" />
                <ItemStyle HorizontalAlign="Center" CssClass="Style" Width="225px" />
                </asp:BoundField>
                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty">
                <HeaderStyle HorizontalAlign="Center" Width="30px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size">
                <HeaderStyle HorizontalAlign="Center" Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color">
                <HeaderStyle HorizontalAlign="Center" Width="200px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CustID" HeaderText="CustID" SortExpression="CustID">
                <HeaderStyle HorizontalAlign="Center" Width="50px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

