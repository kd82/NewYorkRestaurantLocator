<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRestaurants.aspx.cs" Inherits="WebApplication1.Insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</head>

<body style="background-image: url(../img/bg_1.jpg); height: 100%; width: 100%; background-size: cover;">
    <form id="form1" runat="server">
        <h1 style="color: wheat;">Restaurants in NewYork city</h1>
        <div>



            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="mGrid"
                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
                    <asp:BoundField DataField="zipcode" HeaderText="Zipcode" SortExpression="zipcode" />
                    <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                    <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RestaurantConnectionString %>" SelectCommand="select r.name,a.street,a.zipcode,l.state,l.country from restaurant r,address a,location l where r.aid=a.aid and a.cid=l.cid"></asp:SqlDataSource>


        </div>
    </form>
</body>
</html>
