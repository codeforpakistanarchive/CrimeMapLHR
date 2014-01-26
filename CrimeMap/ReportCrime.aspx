<%@ Page Title="Report Crime" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportCrime.aspx.cs" Inherits="CrimeMap.ReportCrime" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
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
                <label for="c_category">Category</label>
                <select class="form-control" runat="server" id="c_category">
                    <option value="1">Robbery</option>
                    <option value="2">Murder</option>
                    <option value="3">Assault</option>
                    <option value="4">Burglery</option>
                    <option value="5">Auto Theft</option>
                    <option value="6">Rape</option>
                </select>
            </div>
            <div class="form-group">
                <label for="c_detail">Crime Detail</label>
                <textarea runat="server" id="c_detail" class="form-control" placeholder="Detailed Description" rows="4"></textarea>
            </div>
            <div class="form-group">
                <label for="c_date">Date</label>
                <input type="date" class="form-control" id="c_date" runat="server" placeholder="Crime Date" />
            </div>
            <div class="form-group">
                <label for="c_time">Time</label>
                <input type="time" class="form-control" id="c_time" runat="server" placeholder="Crime Time" />
            </div>
            
            <div class="form-group">
                <label>I am</label>
                <div class="form-control">
                <label class="checkbox-inline">
                    <input type="checkbox" id="is_witness" runat="server" />
                    A Witness
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="is_victim" runat="server" />
                    A Victim
                </label>
                    </div>
            </div>
            <div class="form-group">
                 <recaptcha:RecaptchaControl
                    ID="recaptcha"
                    runat="server"
                    PublicKey="6Lcvle0SAAAAADN2YSOZNskd2I-s831lyPM4ueeS "
                    PrivateKey="6Lcvle0SAAAAAK5sO7Hhj2zUeY6ONwjSzdti329m"
                    />
            </div>
            <div class="form-group">
                <asp:Button Text="Submit" CssClass="btn btn-primary form-control" runat="server" ID="ReportSubmit" OnClick="ReportSubmit_Click" />
            </div>
            <div />
            <input type="hidden" runat="server" id="latMap" />
            <input type="hidden" runat="server" id="lngMap" />
        </fieldset>
    </div>
        </div>
        <div class="">
            <div class="form-group">
                <label>Click on the location of crime:</label>
            <div id="map_canvas" onclick="mapDivClicked(event);" style="height: 350px; width: 500px;"></div>
            </div>
        </div>
    </div>

    
</asp:Content>
