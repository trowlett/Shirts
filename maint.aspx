<%@ Page Title="Maintenance MR Shirts" Language="C#" MasterPageFile="~/mrshirt.master" AutoEventWireup="true" CodeFile="maint.aspx.cs" Inherits="maint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Shirt Database Maintenance</h2>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MRMISGADBConnect %>" 
            DeleteCommand="DELETE FROM Shirts WHERE (Seq = @Seq)" 
            SelectCommand="SELECT Shirts.Qty, Shirts.Style, Shirts.Color, Shirts.Timestamp, Shirts.cancel, Shirts.Filled, Customers.Name, Shirts.Seq, Shirts.Size, Shirts.CustID FROM Customers INNER JOIN Shirts ON Customers.CustID = Shirts.CustID" 
            
            UpdateCommand="UPDATE Shirts SET Qty = @Qty, Color = @Color, cancel = @cancel, Filled = @Filled, Size = @Size FROM Shirts INNER JOIN Customers ON Shirts.CustID = Customers.CustID WHERE (Shirts.Seq = @Seq)">
            <DeleteParameters>
                <asp:Parameter Name="Seq" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Qty" Type="Int32" />
                <asp:Parameter Name="Color" Type="String" />
                <asp:Parameter Name="cancel" Type="Int32" />
                <asp:Parameter Name="Filled" Type="Int32" />
                <asp:Parameter Name="Size" Type="String" />
                <asp:Parameter Name="Seq" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Seq" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                <asp:BoundField DataField="Style" HeaderText="Style" SortExpression="Style" />
                <asp:BoundField DataField="Size" HeaderText="Size" 
                    SortExpression="Size" />
                <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
                <asp:BoundField DataField="cancel" HeaderText="cancel" 
                    SortExpression="cancel" />
                <asp:BoundField DataField="Filled" HeaderText="Filled" 
                    SortExpression="Filled" />
                <asp:BoundField DataField="Seq" HeaderText="Seq" ReadOnly="True" 
                    SortExpression="Seq" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

