<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CoursesInProgress.aspx.cs" Inherits="GUCera.student.CoursesInProgress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Courses In Progress</h1>
        </div>
    </div>

    <div class="container">
        <asp:Panel runat="server" class="row" id="progressCourses">
          
           <!-- <div class="col-4">

                
            <div class="card mb-4 text-white bg-secondary">
                <img class="card-img-top" src="..\images\courses.jpg" alt="Course"/>
                <div class="card-body">
                    <h5 class="cardTitle">
                        Card title
                    </h5><p class="card-text">
                        Some quick example text to build on the card title and make up the bulk of the card's content.
                    </p><a class="btn btn-outline-light btn-sm">go some</a></div></div></div>
            
            -->

        </asp:Panel>
    </div>

</asp:Content>
