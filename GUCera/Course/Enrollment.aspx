<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Enrollment.aspx.cs" Inherits="GUCera.Course.Enrollment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Please choose your Insructor from the list below</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-sm"></div>
        <div class="col-sm">
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Instructors
                </button>
                <%--<span style="margin-left: 250px;">
                    <asp:Button runat="server" class="btn btn-lg btn-outline-success " Text="Enroll" Style="margin-right: 30px" OnClick="enrollButton_Click"></asp:Button>
                </span>--%>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <asp:Panel ID="instructorsPanel" runat="server">
                        
                    </asp:Panel>

                </div>
            </div>
        </div>
        <div class="col-sm"></div>
    </div>

    <div class="row" style="margin-top: 100px;">

        <div class="col-4"></div>
        <div class="col-8">

            <span style="font-size: 1.3em">
                <asp:Label ID="incorrectInput" class="col-sm" runat="server"></asp:Label>
            </span>
        </div>

    </div>

</asp:Content>
