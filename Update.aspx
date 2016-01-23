<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="WebApplication1.Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
</head>

       <body style="
    background-image: url(../img/bg_1.jpg);
    height: 100%;
    width: 100%;
    background-size: cover;
    
">
    <form id="form1" runat="server">
        <h1 style="color:wheat;">Restaurants in NewYork city</h1>
    <div>

    
        <asp:GridView ID="GridView1" runat="server"  AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="mGrid"
            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" DataKeyNames="rid" AutoGenerateEditButton="true"  >
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="rid" HeaderText="S.No" SortExpression="rid" InsertVisible="False" ReadOnly="True"/>
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name"/>
                <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
                <asp:BoundField DataField="zipcode" HeaderText="Zipcode" SortExpression="zipcode" />
                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" ReadOnly="true" />
                <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" ReadOnly="true" />
                <asp:TemplateField HeaderText="Update">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" OnClientClick="if (!window.confirm('Are you sure you want to delete this item?')) return false;"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RestaurantConnectionString %>" SelectCommand="select r.rid, r.name,a.street,a.zipcode,l.state,l.country from restaurant r,address a,location l where r.aid=a.aid and a.cid=l.cid " DeleteCommand="uspGetAddress" DeleteCommandType="StoredProcedure" UpdateCommand="uspsetAddress" UpdateCommandType="StoredProcedure" >
            <DeleteParameters>
                <asp:Parameter Name="rid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="rid" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="zipcode" Type="String" />
            </UpdateParameters>
       
        </asp:SqlDataSource>


    
    </div>
    </form>
</body>
</html>
