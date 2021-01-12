<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IssueCertificate.aspx.cs" Inherits="GUCera.instructor.IssueCertificate" %>
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
                                <div class="form-group col-sm-4">
                                    <label for="sName">Student</label>
                                    <asp:DropDownList runat="server" class="form-control" ID="sName">

                                    </asp:DropDownList>
                                </div>

                             

                            </div>

                            <asp:Panel runat="server" class="text-success" ID="incorrect">
                            </asp:Panel>

                            <asp:Panel runat="server" class="text-success" ID="done">
                            </asp:Panel>

                        </div>
                        <div class="card-footer">
                            <asp:Button ID="addCertific" OnClick="addCertific_Click"  class="btn btn-sm btn-success float-right" Text="Certify Student" runat="server"></asp:Button>
                            <button class="btn btn-sm btn-danger" type="reset">
                                <i class="mdi mdi-lock-reset"></i>Reset</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


</asp:Content>
