<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="ShowAssignemnts.aspx.cs" Inherits="GUCera.instructor.ShowAssignemnts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            
            <h1>
                <asp:Panel runat="server" id="headerText"></asp:Panel>
            </h1>
        </div>
    </div>

    <div class="container">
        <asp:Panel Class="row" ID="Submitted_Assignments" runat="server">
            
        </asp:Panel>
    </div>




</asp:Content>