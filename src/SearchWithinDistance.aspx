<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchWithinDistance.aspx.cs" Inherits="WebApplication1.SearchWithin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

</head>

<body style="background-image: url(../img/bg_1.jpg); height: 100%; width: 100%; background-size: cover;">
    <form id="form1" runat="server">
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script type="text/javascript">
            var markers = [
            <asp:Repeater ID="rptMarkers" runat="server">
            <ItemTemplate>
                     {
                         "title": "<%# Eval("name") %>",
                     "lat": '<%# Eval("latitude") %>',
                     "lng": '<%# Eval("longitude") %>',
                     "dis": '<%# Eval("ProxDistance") %>',
                     "street":'<%# Eval("street") %>',
                     "zip":'<%# Eval("zipcode") %>'
                     
                 
                 }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
        ];
        </script>
        <script type="text/javascript">

            window.onload = function () {
                var mapOptions = {
                    center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                    zoom: 13,
                    mapTypeControl:true,
                    mapTypeControlOptions: {
                        style:google.maps.MapTypeControlStyle.DROPDOWN_MENU
                    },
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var infoWindow = new google.maps.InfoWindow();
                var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                for (i = 0; i < markers.length; i++) {
                    var data = markers[i]
                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        title: data.title
                    });
                    (function (marker, data) {
                        google.maps.event.addListener(marker, "click", function (e) {
                            infoWindow.setContent(data.title);
                            //infoWindow.setContent(data.zip);
                            infoWindow.open(map, marker);
                        });
                    })(marker, data);
                }
            }
        </script>
        <h1 style="color: whitesmoke;">Search for the restaurants near by</h1>
        <div style="color: wheat;">
            Store Locator (example)<br />
            <br />
            Find the stores that are within 
        <asp:DropDownList ID="distanceDropDown" runat="server">
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>50</asp:ListItem>
        </asp:DropDownList>
            miles of this location (address):
        <asp:TextBox ID="addressTextBox" runat="server" Width="295px">3276 Westchester Ave, Bronx, NY 10461</asp:TextBox>&nbsp;<asp:Button
            ID="startSearchButton" runat="server" OnClick="startSearchButton_Click" Text=" Go " /><br />
            <asp:Label Visible="false" ID="lblLattitude" runat="server"></asp:Label><br />
            <asp:Label Visible="false" ID="lblLongtitude" runat="server">
            </asp:Label>

            <div id="dvMap" style="width: 1100px; height: 500px">
                <br />
                <br />
                <br />

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RestaurantConnectionString %>" SelectCommand="GetNearbyLocations" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblLattitude" Name="CenterLatitude" PropertyName="Text" Type="Double" />
                        <asp:ControlParameter ControlID="lblLongtitude" Name="CenterLongitude" PropertyName="Text" Type="Double" />
                        <asp:ControlParameter ControlID="distanceDropDown" DefaultValue="" Name="SearchDistance" PropertyName="SelectedValue" Type="Double" />
                        <asp:Parameter DefaultValue="3961" Name="EarthRadius" Type="Double" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="rid" DataSourceID="SqlDataSource1" Width="1103px">
            <Columns>
                <asp:BoundField DataField="rid" HeaderText="rid" InsertVisible="False" ReadOnly="True" SortExpression="rid" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="street" HeaderText="street" SortExpression="street" />
                <asp:BoundField DataField="zipcode" HeaderText="zipcode" SortExpression="zipcode" />
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                <asp:BoundField DataField="ProxDistance" HeaderText="ProxDistance" ReadOnly="True" SortExpression="ProxDistance" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
