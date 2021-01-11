<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentViewAssign.aspx.cs" Inherits="GUCera.assignment.StudentViewAssign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<div class="jumbotron jumbotron-fluid">
        <div class="container">
            
            <div class="row">

                <div class="col-5">
                  <h1>
                    <asp:Panel ID="assignTitle" runat="server"></asp:Panel>
                 </h1>
                </div>

                <div class="col-3 h-100" >
                    <div class="bg-info badge-pill text-center" style="height:50px;width:auto;">
                        <span class="text-dark" style="font-size:1.6em;">Grade/ </span> <asp:Label ID="assignGrade" style="font-size:1.6em;" class="text-light" runat="server"></asp:Label>
                    </div>
                </div>

            </div>

        </div>
    </div>


    <div class="container" style="margin-top: 50px; margin-bottom: 40px">
        <div class="row">
            <div class="col-12">
                <div class="card">

                    <div class="card-body">

                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" id="basicInfo-tab" data-bs-toggle="tab" href="..\ViewProfile.aspx" role="tab" aria-controls="basicInfo" aria-selected="true">Assgnment info</a>
                                    </li>
                                </ul>

                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Deadline :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="deadline" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />



                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Weight :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="weight" runat="server"></asp:Panel>
                                            </div>
                                        </div>

                                        <hr />


                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Full Grade :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="fullGrade" runat="server"></asp:Panel>
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
