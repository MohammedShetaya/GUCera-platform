<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="CreateNewPromoCode.aspx.cs" Inherits="GUCera.admin.CreateNewPromoCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Please Add The Promo Code Details</h1>
        </div>


        <asp:Panel runat="server" DefaultButton="addCard" class="padding" style="padding-bottom: 50px; margin-top: 30px;">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>PromoCode</strong>
                            <small>enter valid information</small>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="CodeNum">Promo Code</label>
                                        <asp:TextBox class="form-control" ID="CodeNum" TextMode="SingleLine" runat="server" placeholder="Please enter the promo code(At most 6 characters)" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="DiscPerc">Discount Percentage</label>
                                        <div class="input-group">
                                            <asp:TextBox ID="DiscPerc" class="form-control" TextMode="SingleLine" runat="server" placeholder="Please enter the Discount percentage(at most 2 decimal places)" required="true"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="Calendar1" class="col-2 col-form-label">Expire Date</label>
                                <div class="col-10">
                                    <asp:TextBox class="form-control" ID="expire" runat="server" TextMode="Date" required="true"></asp:TextBox>
                                </div>
                            </div>

                            <asp:Panel runat="server" class="text-danger" ID="incorrectInput">
                            </asp:Panel>
                        </div>
                        <div class="card-footer">
                            <asp:Button ID="addCard" OnClick="addCard_Click" class="btn btn-sm btn-success float-right" Text="Add Promo Code" runat="server"></asp:Button>
                            <button class="btn btn-sm btn-danger" type="reset">
                                <i class="mdi mdi-lock-reset"></i>Reset</button>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>

    </div>


</asp:Content>