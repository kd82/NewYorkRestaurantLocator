<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RestaurantConnectionString %>" DeleteCommand="DELETE FROM [Restaurant] WHERE [rid] = @rid" InsertCommand="INSERT INTO [Restaurant] ([Name], [Latitude], [Longitude], [delete_flag], [aid]) VALUES (@Name, @Latitude, @Longitude, @delete_flag, @aid)" SelectCommand="SELECT * FROM [Restaurant]" UpdateCommand="UPDATE [Restaurant] SET [Name] = @Name, [Latitude] = @Latitude, [Longitude] = @Longitude, [delete_flag] = @delete_flag, [aid] = @aid WHERE [rid] = @rid">
            <DeleteParameters>
                <asp:Parameter Name="rid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Latitude" Type="Double" />
                <asp:Parameter Name="Longitude" Type="Double" />
                <asp:Parameter Name="delete_flag" Type="Int32" />
                <asp:Parameter Name="aid" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Latitude" Type="Double" />
                <asp:Parameter Name="Longitude" Type="Double" />
                <asp:Parameter Name="delete_flag" Type="Int32" />
                <asp:Parameter Name="aid" Type="Int32" />
                <asp:Parameter Name="rid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="rid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="rid" HeaderText="rid" InsertVisible="False" ReadOnly="True" SortExpression="rid" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
                <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude" />
                <asp:BoundField DataField="delete_flag" HeaderText="delete_flag" SortExpression="delete_flag" />
                <asp:BoundField DataField="aid" HeaderText="aid" SortExpression="aid" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
