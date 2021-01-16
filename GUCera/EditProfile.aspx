<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="GUCera.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    

    

    <asp:Panel runat="server" DefaultButton="edit" class="container" style="margin-top: 40px ; margin-bottom:50px">
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
                                        <a class="nav-link" id="basic-info-tab" data-toggle="tab" href="..\ViewProfile.aspx" role="tab" aria-controls="basicInfo" >Basic Info</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" id="connectedServices-tab" data-toggle="tab" href="..\EditProfile.aspx" role="tab" aria-controls="connectedServices" >Edit Profile</a>
                                    </li>
                                </ul>

                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">

                                        
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">First & Last Name :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <div class="input-group">
                                                    <asp:TextBox  TextMode="SingleLine" ID="firstName" runat="server" class="form-control"></asp:TextBox>
                                                    <asp:TextBox  TextMode="SingleLine" ID="lastName" runat="server" class="form-control"></asp:TextBox>
                                                 </div>
                                            </div>
                                        </div>
                                        <hr />


                                        
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Password :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <div class="input-group">
                                                    <asp:TextBox  TextMode="SingleLine" ID="password" runat="server" class="form-control"></asp:TextBox>
                                                 </div>
                                            </div>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Gender</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                            
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">
                                                    <asp:RadioButton ID="male" aria-label="Radio button for following text input" runat="server" GroupName="gender" />
                         
                                                    </span>
                                                    <div class="input-group-append">
                                                   <span class="input-group-text">Male</span>
                                                    </div>

                                                  <span class="input-group-text">
                                                  <asp:RadioButton ID="female" aria-label="Radio button for following text input" runat="server" GroupName="gender" />
                                                  </span>
                                                  
                                                  <div class="input-group-append">
                                                  <span class="input-group-text" >Female</span>
                                                  </div>
                                              </div>

                                            </div>
                                        </div>
                                        <hr />



                                        <div class="row">

                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Email :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <div class="input-group">
                                                    <asp:TextBox  TextMode="SingleLine" ID="email" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <asp:Panel ID="incorrectInput" class="text-danger" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;">Address :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <div class="input-group">
                                                    <asp:TextBox  TextMode="SingleLine" ID="address" runat="server" class="form-control"></asp:TextBox>
                                                 </div>
                                            </div>
                                        </div>
                                        
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm"></div>
                                            <div class="col-sm"></div>
                                            <div class="col-sm">
                                            <asp:Button ID="edit"  runat="server" class="btn btn-lg btn-outline-danger " Text="Update" style="margin-left:30px" OnClick="edit_Click"></asp:Button>
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
    </asp:Panel>



</asp:Content>
