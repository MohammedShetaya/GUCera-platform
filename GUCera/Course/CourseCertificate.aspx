<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseCertificate.aspx.cs" Inherits="GUCera.Course.CourseCertificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron jumbotron-fluid">
        <div class="container border-primary">
            
                <h1 class="align-middle">Certificate Of Completion!
                </h1>
                <h2 class="lead">
                    <asp:Panel ID="certicateTextPanel" runat="server"></asp:Panel>
                </h2>
            
            <hr class="my-4">
            <h6>The team who made this website is happy that you completed this Course. No, Just Kidding. We don't even know you :D</h6>
        </div>
    </div>
</asp:Content>
