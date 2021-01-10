<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListNonAcceptedCourses.aspx.cs" Inherits="GUCera.admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1>Non Accepted Courses
            </h1>
        </div>
    </div>

    <div class="container">
        <asp:Panel Class="row" ID="available_Courses" runat="server">

        </asp:Panel>
    </div>
</asp:Content>
