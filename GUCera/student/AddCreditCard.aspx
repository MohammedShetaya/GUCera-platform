<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCreditCard.aspx.cs" Inherits="GUCera.AddCreditCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    
        <div class="jumbotron jumbotron-fluid">
           <div class="container">
                <h1 class="display-4">Please Add Your Card Information</h1>
           </div>

            
   <div class="padding"  style="padding-bottom:50px;margin-top:30px;">
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="card">
                <div class="card-header">
                    <strong>Credit Card</strong>
                    <small>enter valid information</small>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <asp:TextBox  class="form-control" id="name" TextMode="SingleLine" runat="server" placeholder="Enter your name"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="ccnumber">Credit Card Number</label>
                                <div class="input-group">
                                    <asp:TextBox ID="cardNumber" class="form-control" TextMode="SingleLine" runat="server" placeholder="0000 0000 0000 0000"></asp:TextBox>
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
                        <div class="form-group col-sm-4">
                            <label for="ccmonth">Month</label>
                            <asp:DropDownList runat="server" class="form-control" id="ccmonth">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="ccyear">Year</label>
                            <asp:DropDownList runat="server" class="form-control" id="ccyear">
                                <asp:ListItem>2014</asp:ListItem>
                                <asp:ListItem>2015</asp:ListItem>
                                <asp:ListItem>2016</asp:ListItem>
                                <asp:ListItem>2017</asp:ListItem>
                                <asp:ListItem>2018</asp:ListItem>
                                <asp:ListItem>2019</asp:ListItem>
                                <asp:ListItem>2020</asp:ListItem>
                                <asp:ListItem>2021</asp:ListItem>
                                <asp:ListItem>2022</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="cvv">CVV/CVC</label>
                                <asp:TextBox class="form-control" id="cvv" runat="server" TextMode="SingleLine" placeholder="123"></asp:TextBox>
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
</div>

        </div>



</asp:Content>
