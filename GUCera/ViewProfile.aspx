<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="GUCera.student.ViewStudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">




    <div class="container" style="margin-top: 40px">
        <div class="row">
            <div class="col-12">
                <div class="card">

                    <div class="card-body">
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="image-container">
                                    <img src="..\images\userIcon.png" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />

                                </div>

                                <div class="userData ml-3">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
                                        <asp:Panel ID="profileName" runat="server"></asp:Panel>
                                    </h2>
                                    <h5 class="d-block">
                                        <asp:Panel ID="userType" runat="server"></asp:Panel>
                                    </h5>
                                </div>
                                <div class="ml-auto">
                                    <input type="button" class="btn btn-primary d-none" id="btnDiscard" value="Discard Changes" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" id="basicInfo-tab" data-bs-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Basic Info</a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" id="connectedServices-tab" data-bs-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false">Connected Services</a>
                                    </li>
                                </ul>

                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Full name :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="fullName" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />



                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">User ID :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="userID" runat="server"></asp:Panel>
                                            </div>
                                        </div>

                                        <hr />


                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Password :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="password" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">
                                                    <asp:Panel ID="inOrSt" runat="server">
                                                    </asp:Panel>

                                                </label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="inOrStValue" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />


                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Gender :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="gender" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />


                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Email :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="email" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />




                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Address :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="address" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />


                                    </div>

                                    <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="connectedServices-tab">
                                        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                            <ol class="carousel-indicators">
                                                <li data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"></li>
                                                <li data-bs-target="#carouselExampleDark" data-bs-slide-to="1"></li>
                                                <%--<li data-bs-target="#carouselExampleDark" data-bs-slide-to="2"></li>--%>
                                            </ol>
                                            <div class="carousel-inner">
                                                <div class="carousel-item active" data-bs-interval="10000">
                                                    <asp:Image ID="Image1" runat="server" src="..\images\courses.jpg" class="d-block w-100" />
                                                    <div class="carousel-caption d-none d-md-block">

                                                        <h1>
                                                            <asp:Panel ID="slidePanel1" runat="server"></asp:Panel>
                                                        </h1>

                                                        <asp:Button ID="slideButton1" runat="server" class="btn btn-primary" />
                                                    </div>
                                                </div>
                                                <div class="carousel-item" data-bs-interval="2000">
                                                    <img src="..\images\promocodes.jpg" class="d-block w-100" alt="...">
                                                    <div class="carousel-caption d-none d-md-block">
                                                        <h1>
                                                            <asp:Panel ID="slidePanel2" runat="server"></asp:Panel>
                                                        </h1>

                                                        <asp:Button ID="slideButton2" runat="server" class="btn btn-primary" />
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
                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </div>
    </div>



</asp:Content>
