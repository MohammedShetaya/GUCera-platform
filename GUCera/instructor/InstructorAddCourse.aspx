<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InstructorAddCourse.aspx.cs" Inherits="GUCera.instructor.InstructorAddCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
        <div class="jumbotron jumbotron-fluid">
           <div class="container">
                <h1 class="display-4">Please Add Your Course Information</h1>
           </div>

            
   <asp:Panel runat="server" DefaultButton="addCard" class="padding"  style="padding-bottom:50px;margin-top:30px;">
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="card">
                <div class="card-header">
                    <strong>Course Details</strong>
                    <small>enter valid information</small>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="name">Course Name</label>
                                <asp:TextBox  class="form-control" id="name" TextMode="SingleLine" runat="server" placeholder="Enter your course name" required="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="Credit">Credit Hours</label>
                                <div class="input-group">
                                    <asp:TextBox ID="Credit" class="form-control" TextMode="SingleLine" runat="server" placeholder="Enter the number of credit hours" required="true"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="mdi mdi-credit-card"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="Price">Price</label>
                                <div class="input-group">
                                    <asp:TextBox ID="Price" class="form-control" TextMode="SingleLine" runat="server" placeholder="Enter the price of the course" required="true"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="mdi mdi-credit-card"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="content">Content</label>
                                <div class="input-group">
                                    <asp:TextBox ID="content" class="form-control" TextMode="SingleLine" runat="server" placeholder="Course Content" required="true"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="mdi mdi-credit-card"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="description">Description</label>
                                <div class="input-group">
                                    <asp:TextBox ID="description" class="form-control" TextMode="SingleLine" runat="server" placeholder="Course Description" required="true"></asp:TextBox>
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="mdi mdi-credit-card"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <asp:Panel runat="server" class="text-danger" id="incorrectInput">

                    </asp:Panel>
                </div>
                <div class="card-footer">
                    <asp:Button ID="addCard" OnClick="addCard_Click" class="btn btn-sm btn-success float-right" Text="Submit"  runat="server"></asp:Button>
                    <button class="btn btn-sm btn-danger" type="reset">
                        <i class="mdi mdi-lock-reset"></i> Reset</button>
                </div>
            </div>
        </div>
    </div>
</asp:Panel>

        </div>

</asp:Content>
