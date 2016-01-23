<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchByName.aspx.cs" Inherits="WebApplication1.CS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                         "lng": '<%# Eval("longitude") %>'
                 
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
                    zoom: 10,
                    mapTypeControl:true,
                    mapTypeControlOptions: {
                        style:google.maps.MapTypeControlStyle.DROPDOWN_MENU
                    },
                    mapTypeId: google.maps.MapTypeId.HYBRID
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
                            infoWindow.open(map, marker);
                        });
                    })(marker, data);
                }
            }
        </script>


        <h1>Search</h1>

        <div style="color: antiquewhite; font-size: 19px;">Type the name of the Restaurant below</div>
        <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Find" Width="89px" />

        <asp:Label ID="label1" runat="server"></asp:Label>

        <br />
        <br />
        <br />
        <br />
        <br />

        <div id="dvMap" style="width: 1500px; height: 700px">
        </div>
    </form>
</body>
</html>
