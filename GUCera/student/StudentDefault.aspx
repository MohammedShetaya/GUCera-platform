﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentDefault.aspx.cs" Inherits="GUCera.student.StudentDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">WELCOME TO GUCera</h1>

            <p class="lead">Online teaching platform</p>
        </div>
    </div>

    <div class="container">
        <%-- Page Content --%>
        <div id="slidesContainer">
            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                        <asp:Image ID="Image1" runat="server" src="..\images\courses.jpg" class="d-block w-100 h-50" />

                        <div class="carousel-caption d-none d-md-block">

                            <h1>
                                <asp:Panel ID="slidePanel1" runat="server">You can Enroll to many usefull courses</asp:Panel>
                            </h1>

                            <asp:Button ID="slideButton1" runat="server" class="btn btn-primary" Text="Show Courses" OnClick="availableCourseButton_Click" />
                        </div>
                    </div>
                    <div class="carousel-item" interval="5000">
                        <img src="..\images\promocodes.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h1>
                                <asp:Panel ID="slidePanel2" runat="server">We are offering you many powerfull promocodes</asp:Panel>
                            </h1>

                            <asp:Button ID="slideButton2" runat="server" class="btn btn-primary" Text="Discover Promocodes" OnClick="promocodesButton_Click" />
                        </div>
                    </div>
                    <div class="carousel-item" interval="5000">
                        <img src="..\images\certificate.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h1>
                                <asp:Panel ID="slidePanel3" runat="server">We are offering certificates after completing your courses</asp:Panel>
                            </h1>

                            <asp:Button ID="slideButton3" runat="server" class="btn btn-primary" Text="Show certificates" OnClick="certificatesButton_Click" />
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleDark" role="button" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleDark" role="button" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
