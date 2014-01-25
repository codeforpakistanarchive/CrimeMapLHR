<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportCrime.aspx.cs" Inherits="CrimeMap.ReportCrime" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h3>Report Crime</h3>
    <div class="form" style="" role="form">
        <fieldset>
            <div class="form-group">
                <label for="c_title">Title</label>
                <input type="email" class="form-control" id="c_title" runat="server" placeholder="Title" />
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
                <label for="c_time">Time</label>
                <select class="form-control" id="c_category">
                    <option>Robbery</option>
                    <option>Murder</option>
                    <option>Assault</option>
                </select>
            </div>
            <div class="form-group">
                <label>I am</label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="is_witness" runat="server" /> A Witness
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="is_victim" runat="server" /> A Victim
                </label>
            </div>
        </fieldset>
    </div>
</asp:Content>
