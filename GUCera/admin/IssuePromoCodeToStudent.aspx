<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="IssuePromoCodeToStudent.aspx.cs" Inherits="GUCera.admin.IssuePromoCodeToStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4">Please select the Promo Code and the Student</h1>
    </div>


    <asp:Panel runat="server" DefaultButton="addCard" class="padding" style="padding-bottom: 50px; margin-top: 30px;">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        <strong>Issue Promo Code to Student</strong>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="cName">Promo Codes</label>
                                <asp:DropDownList runat="server" class="form-control" ID="promo">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="cName">Students</label>
                                <asp:DropDownList runat="server" class="form-control" ID="student">
                                </asp:DropDownList>
                            </div>
                            <asp:Panel runat="server" class="text-danger" ID="incorrectInput">
                            </asp:Panel>
                        </div>
                        <div class="card-footer">
                            <asp:Button ID="addCard" OnClick="addCard_Click" class="btn btn-sm btn-success float-right" Text="Issue Promo Code" runat="server"></asp:Button>
                            <button class="btn btn-sm btn-danger" type="reset">
                                <i class="mdi mdi-lock-reset"></i>Reset
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>
</div>

</asp:Content>