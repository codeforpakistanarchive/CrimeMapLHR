<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CrimeMap._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Catchy Heading!</h1>
        <p class="lead">Play your part as a responsible citizen and report a crime you have seen!</p>
        <p><a href="#" class="btn btn-primary btn-large">Report Crime</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Un-Verified Reports in your area</h2>
            <p>
                There are 42 unreported cases in your area. Click below to learn more about them and help verify them.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Un-Verified Crime Reports</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Stat1</h2>
            <p>
                Here we will display a chart maybe
            </p>
        </div>
        <div class="col-md-4">
            <h2>10,000 Crime Reports this week</h2>
            <p>
                To get detailed data and statistics, click below:
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Detailed Stats</a>
            </p>
        </div>
    </div>

</asp:Content>
