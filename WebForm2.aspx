<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

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
    background-size: cover;" >
    <form id="form1" runat="server">
    <div>
        
<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="Search" />
        <br><br>
  <div style="
    font-size: 21px;
"><a href="http://localhost:5354/CS.aspx" target="_blank" style="
    color: antiquewhite;
">Search the Restaurant address in Google Maps</a></div>

    
        <asp:GridView ID="GridView1" runat="server"  AllowPaging="True" AutoGenerateColumns="False"  CssClass="mGrid"
            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" DataKeyNames="rid" DataSourceID="SqlDataSource1" >
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="rid" HeaderText="S.No" SortExpression="rid" InsertVisible="False" ReadOnly="True"/>
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
                <asp:BoundField DataField="zipcode" HeaderText="Zipcode" SortExpression="zipcode" />
                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
                
          
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
        </asp:GridView>
       

    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RestaurantConnectionString %>" SelectCommand="SearchAddress" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter Name="name" ControlID="txtSearch" PropertyName="Text" DefaultValue = "" ConvertEmptyStringToNull = "false" />
            </SelectParameters>
        </asp:SqlDataSource>
       

    
    </div>
    </form>
</body>
</html>
