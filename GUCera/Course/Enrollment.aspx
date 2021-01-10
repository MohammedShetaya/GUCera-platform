<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Enrollment.aspx.cs" Inherits="GUCera.Course.Enrollment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Please choose your Insructor from the list below</h1>
        </div>

        <div class="padding"  style="padding-bottom:50px;margin-top:30px;">
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="card">
                <div class="card-header">
                    <strong>Instructors</strong>
                    
                </div>
                <div class="card-body">
                                    
                    <div class="row">
                        <div class="form-group col-sm-4">
                            <asp:DropDownList runat="server" class="form-control" id="instructorsPanel">                                
                            
                            </asp:DropDownList>
                        </div>
                       
                      
                    </div>

                    <asp:Panel runat="server" class="text-danger" id="Panel1">

                    </asp:Panel>
                </div>
                <div class="card-footer">
                    <asp:Button ID="addCard" OnClick="Enroll_Click" class="btn btn-sm btn-success float-right" Text="Enroll"  runat="server"></asp:Button>
                    
                </div>
            </div>
        </div>
    </div>
</div>


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
