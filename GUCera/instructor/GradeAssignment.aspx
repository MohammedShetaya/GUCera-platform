<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="GradeAssignment.aspx.cs" Inherits="GUCera.instructor.GradeAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Please Grade This Assignemnt</h1>
        </div>

        <asp:Panel runat="server" DefaultButton="addCard" class="padding" style="padding-bottom:50px;margin-top:30px;">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Grade</strong>

                        </div>
                        <div class="card-body">

                            <div class="row">
                                <div class="form-group col-sm-4">
                                    <label for="grade">Grade</label>
                                    <asp:TextBox class="form-control" id="grade" TextMode="Number" step="0.1" runat="server" placeholder="Enter your garde"></asp:TextBox>

                                </div>

                                <asp:Panel runat="server" class="text-danger" id="Panel1">

                                </asp:Panel>


                            </div>


                        </div>
                        <div class="card-footer">
                            <asp:Button ID="addCard" OnClick="gradeAssignments_Click" class="btn btn-sm btn-success float-right" Text="Grade Assignment" runat="server"></asp:Button>

                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>


        <div class="row" style="margin-top: 100px;">

            <div class="col-4"></div>
            <div class="col-8">

                <span style="font-size: 1.3em">
                    <asp:Label ID="incorrectInput" class="col-sm" runat="server"></asp:Label>
                </span>
            </div>

        </div>
    </div>

</asp:Content>