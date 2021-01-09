<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CoursePage.aspx.cs" Inherits="GUCera.Course.CoursePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1>
                <asp:Panel ID="pageTitle" runat="server"></asp:Panel>
            </h1>
        </div>
    </div>


    <div class="container" style="margin-top: 50px; margin-bottom: 40px">
        <div class="row">
            <div class="col-12">
                <div class="card">

                    <div class="card-body">
                        <%--<div class="card-title mb-4">

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

                                <div class="col-md-4 ml-auto">
                                    <h5>Phone Numbers</h5>
                                    <asp:Panel ID="phoneNumbers" runat="server">
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>--%>

                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" id="basicInfo-tab" data-bs-toggle="tab" href="..\ViewProfile.aspx" role="tab" aria-controls="basicInfo" aria-selected="true">Course Information</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#" role="tab" aria-controls="connectedServices" aria-selected="false">Other services</a>
                                    </li>
                                </ul>

                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Course name :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="CourseName" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />



                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Course Description :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="courseDescription" runat="server"></asp:Panel>
                                            </div>
                                        </div>

                                        <hr />


                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Price :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="price" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Content :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="content" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />


                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Taught by :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="instuctorsNames" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />



                                        <div class="row">
                                            <div class="col-sm"></div>
                                            <div class="col-sm"></div>
                                            <div class="col-sm">
                                                <asp:Button ID="enroll" runat="server" class="btn btn-lg btn-outline-success " Text="Enroll" Style="margin-left: 30px" OnClick="enroll_Click"></asp:Button>
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
    </div>




</asp:Content>
