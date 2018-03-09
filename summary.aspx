<%@ Page Title="Summary Shirt Orders MR MISGA" Language="C#" MasterPageFile="~/mrshirt.master" AutoEventWireup="true" CodeFile="summary.aspx.cs" Inherits="summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Summary of all Shirt Orders</h2>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MRMISGADBConnect %>" 
            
            
            SelectCommand="SELECT mrmisgadb.Customers.Name, mrmisgadb.Shirts.Style, mrmisgadb.Shirts.Qty, mrmisgadb.Shirts.Size, mrmisgadb.Shirts.Color, mrmisgadb.Shirts.Seq, mrmisgadb.Shirts.CustID, mrmisgadb.Shirts.Filled, mrmisgadb.Shirts.Length FROM mrmisgadb.Shirts INNER JOIN mrmisgadb.Customers ON mrmisgadb.Shirts.CustID = mrmisgadb.Customers.CustID WHERE (mrmisgadb.Shirts.cancel = 0) AND (mrmisgadb.Shirts.CustID &gt; 0) AND (mrmisgadb.Shirts.Filled = 0) ORDER BY mrmisgadb.Customers.Name, mrmisgadb.Shirts.Style" ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            DataKeyNames="Seq">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                <HeaderStyle Width="250px" />
                </asp:BoundField>
                <asp:BoundField DataField="Style" HeaderText="Style" SortExpression="Style">
                <HeaderStyle HorizontalAlign="Center" Width="175px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color">
                <HeaderStyle Width="150px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Qty" HeaderText="Qty" 
                    SortExpression="Qty">
                <HeaderStyle Width="50px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size">
                <HeaderStyle Width="100px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

