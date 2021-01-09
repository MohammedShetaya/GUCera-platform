<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="GUCera.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <div class="container ">
       <div class="row justify-content-center" style="margin-top:20px">
         <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<fieldset>
				<h2>Please Sign In</h2>
				<hr class="colorgraph">

				<div class="form-group">
                    <asp:TextBox ID="username" runat="server" class="form-control input-lg" placeholder="Username"></asp:TextBox>
				</div>

				<div class="form-group">
                    <asp:TextBox ID="password" TextMode="Password" runat ="server" class="form-control input-lg" placeholder="Password"></asp:TextBox>
				</div>

				<span class="button-checkbox">
					<button type="button" class="btn" data-color="info">Remember Me</button>
                    <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
					<a href="#" class="btn btn-link pull-right">Forgot Password?</a>
				</span>
				<hr class="colorgraph">
				<div class="row">

					<div class="col-xs-6 col-sm-6 col-md-6">
                        <asp:Button ID="signin" runat="server" Text="Sign in" class="btn btn-lg btn-success btn-block" OnClick="signin_Click"/>
					</div>

					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="SignUp.aspx" class="btn btn-lg btn-dark btn-block">Register</a>
					</div>
				</div>
				<br />
                <asp:Panel class="justify-content-center" ID="incorrect" runat="server"></asp:Panel>
			</fieldset>
	</div>
</div>

</div>
	
</asp:Content>
