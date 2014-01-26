<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginRegister.aspx.cs" Inherits="CrimeMap.LoginRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var map;
        function initialize() {
            var mapOptions = {
                zoom: 12,
                center: new google.maps.LatLng(31.5497, 74.3436),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById('map_canvas'),
                mapOptions
            );
            google.maps.event.addListener(map, 'click', function (event) {
                document.getElementById('latMap').value = event.latLng.lat();
                document.getElementById('lngMap').value = event.latLng.lng();
            });
        }
        function mapDivClicked(event) {
            var target = document.getElementById('map_canvas'),
                posx = event.pageX - target.offsetLeft,
                posy = event.pageY - target.offsetTop,
                bounds = map.getBounds(),
                neLatlng = bounds.getNorthEast(),
                swLatlng = bounds.getSouthWest(),
                startLat = neLatlng.lat(),
                endLng = neLatlng.lng(),
                endLat = swLatlng.lat(),
                startLng = swLatlng.lng();

            document.getElementById('posX').value = posx;
            document.getElementById('posY').value = posy;
            document.getElementById('lat').value = startLat + ((posy / 350) * (endLat - startLat));
            document.getElementById('lng').value = startLng + ((posx / 500) * (endLng - startLng));
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <h3>Report Crime</h3>
    <div class="row">
        <div class="col-md-4">
    <div class="form" style="" role="form">
        <fieldset>
            <div class="form-group">
                <label for="c_phone">Mobile Number (required)</label>
                <input type="text" class="form-control" id="c_phone" runat="server" placeholder="eg. 03XX XXXXXXX" />
            </div>
            <div class="form-group">
                <label for="c_pass">Password</label>
                <input type="password" id="c_pass" runat="server" class="form-control" />
            </div>
            <label>Optional Settings: (hidden from public by default)</label>
            <div class="form-group">
                <label for="c_date">Email</label>
                <input type="email" class="form-control" id="c_email" runat="server" placeholder="Your personal email" />
            </div>
            <div>
                <asp:Button Text="Submit" CssClass="btn btn-primary" runat="server" ID="ReportSubmit" OnClick="ReportSubmit_Click" />
            </div>
        </fieldset>
    </div>
            </div>
        <div>
            <div class="form-group">
                <label>Your current location (It will be used to notify you of potential threats through SMS):</label>
            <div id="map_canvas" onclick="mapDivClicked(event);" style="height: 350px; width: 500px;"></div>
            </div>
        </div>
        </div>
</asp:Content>
