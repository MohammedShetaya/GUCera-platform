﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="GUCera.student.ViewStudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">




    <div class="container" style="margin-top: 50px; margin-bottom: 40px">
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

                                <div class="col-md-4 ml-auto">
                                    <h5>Phone Numbers</h5>
                                    <asp:Panel ID="phoneNumbers" runat="server">
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" id="basicInfo-tab" data-bs-toggle="tab" href="..\ViewProfile.aspx" role="tab" aria-controls="basicInfo" aria-selected="true">Basic Info</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="..\EditProfile.aspx" role="tab" aria-controls="connectedServices" aria-selected="false">Edit Profile</a>
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
                                        <asp:Panel ID="isAdmin" runat="server">
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
                                        </asp:Panel>

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

                                        <div class="row">
                                            <div class="col-md-12 ml-auto">
                                                <asp:Button ID="certifiedCourses" runat="server" class="btn btn-lg btn-outline-success " Text="Show Certificates" Style="margin-left: 30px" OnClick="CertifiedCourses_Click"></asp:Button>
                                                <asp:Button ID="addCard" runat="server" class="btn btn-lg btn-outline-success " Text="Add Credit Card" Style="margin-left: 30px" OnClick="addCreditCard_Click"></asp:Button>
                                                <asp:Button ID="addNum" runat="server" class="btn btn-lg btn-outline-success " Text="Add Number" Style="margin-left: 30px" OnClick="addNumber_Click"></asp:Button>

                                                <asp:Button ID="addCourse" runat="server" class="btn btn-lg btn-outline-success " Text="Add Course" Style="margin-left: 30px" OnClick="addCourse_Click"></asp:Button>

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
