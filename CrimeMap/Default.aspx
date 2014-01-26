<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CrimeMap._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Crime Map Lahore</h1>
        <p class="lead">Do you know of any crime or suspicious activity in your area?</p>
        <p class="lead">Then play your part as a responsible citizen by reporting it below:</p>
        <p>
            <a runat="server" href="~/ReportCrime" class="btn btn-primary btn-large">Crime</a>
            <a runat="server" href="~/SuspiciousActivity" class="btn btn-primary btn-large">Suspicious Activity</a>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>SMS Alerts</h2>
            <p>
                Subscribe below to know about any criminal activity in your area, and keep yourself and your loved ones safe
            </p>
              <div class="form-inline">
                  <div class="input-group">
                      <span class="input-group-addon">Subscribe</span>
                      <input type="text" class="form-control" placeholder="03XX XXXXXXX">
                  </div>
              </div>
            <p>
                You can also report a crime using your phone by texting <b>CRIMELHR</b> to 9900.
            </p>
        </div>
        <div class="col-md-4">
            <h2><b>491</b> Un-Verified</h2>
            <p>
                There are 491 unverified crime reports from your area. Earn reputation and badges by providing external sources to the
                news.
            </p>
            <p>
                <a runat="server" href="#" class="btn btn-primary">Un-Verified Crimes</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>High-Risk Areas this week</h2>
                <ol>
                    <li><a href="#">Allama Iqbal Town</a> > <a href="#">Ravi Block</a> <span class="pull-right"><strong>Up 11%</strong></span></li>
                    <li><a href="#">Allama Iqbal Town</a> > <a href="#">Pak Block</a> <span class="pull-right"><strong>Up 8%</strong></span></li>
                    <li><a href="#">Model Town</a> > <a href="#">Block C</a> <span class="pull-right"><strong>Up 4%</strong></span></li>
                </ol>
            <p>
                <a class="btn btn-default" href="#">Detailed Stats</a>
            </p>
        </div>
    </div>

</asp:Content>
