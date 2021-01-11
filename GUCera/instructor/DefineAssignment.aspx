<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefineAssignment.aspx.cs" Inherits="GUCera.instructor.DefineAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Please Add The Assignment Details</h1>
        </div>


        <div class="padding" style="padding-bottom: 50px; margin-top: 30px;">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Assignment</strong>
                            <small>enter valid information</small>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="asNum">Assigment Number</label>
                                        <asp:TextBox class="form-control" ID="asNum" TextMode="SingleLine" runat="server" placeholder="Please enter the assignment number" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="asType">Assignment Type</label>
                                        <div class="input-group">
                                            <asp:DropDownList runat="server" class="form-control" ID="asType">
                                                <asp:ListItem>quiz</asp:ListItem>
                                                <asp:ListItem>project</asp:ListItem>
                                                <asp:ListItem>exam</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="asContent">Content</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="asContent" class="form-control" TextMode="SingleLine" runat="server" placeholder="Please enter the assignment content" required="true"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-4">
                                    <label for="cName">Course</label>
                                    <asp:DropDownList runat="server" class="form-control" ID="cName">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label for="asGrade">Full Grade</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="asGrade" class="form-control" TextMode="SingleLine" runat="server" placeholder="Please enter the assignment full grade" required="true"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="asWeight">Weight</label>
                                        <asp:TextBox class="form-control" ID="asWeight" runat="server" TextMode="SingleLine" placeholder="Please Enter the assignment weight" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="Calendar1" class="col-2 col-form-label">Deadline</label>
                                <div class="col-10">
                                    <asp:TextBox class="form-control" ID="dead" runat="server" TextMode="Date" required="true"></asp:TextBox>

                                </div>
                            </div>

                            <asp:Panel runat="server" class="text-danger" ID="incorrectInput">
                            </asp:Panel>
                        </div>
                        <div class="card-footer">
                            <asp:Button ID="addCard" OnClick="addCard_Click" class="btn btn-sm btn-success float-right" Text="Add Assignment" runat="server"></asp:Button>
                            <button class="btn btn-sm btn-danger" type="reset">
                                <i class="mdi mdi-lock-reset"></i>Reset</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


</asp:Content>
