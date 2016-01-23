<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Geocode.aspx.cs" Inherits="WebApplication1.Geocode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title> </title>
</head>

    <body style="
    background-image: url(../img/bg_1.jpg);
    height: 100%;
    width: 100%;
    background-size: cover;" >
    <form id="form1" runat="server">
    
        <div style="
    color: wheat;
    margin: 0%;
    margin-left: -3%;
    padding: 7%;
"><p style="
    font-size: 19px;
    font-family: cursive;
    color: aliceblue;
">Insert the Restaurant's data</p><br /><br />
        Name   <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br /><br />
        Street  <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox><br /><br />
        Zipcode  <asp:TextBox  ID="txtzipCode" runat="server"></asp:TextBox><br /><br /><br />
      <asp:Button runat="server" ID="btnGetCoordinates"
      Text="Submit" OnClick="btnGetCoordinates_Click" />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>

      
        
          
    </div>
    </form>
</body>
</html>
