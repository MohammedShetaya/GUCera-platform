<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmittedAssignments.aspx.cs" Inherits="GUCera.assignment.SubmittedAssignments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<div class="jumbotron">

		<div class="container">
			<div class="row">

				
			<div class="col-4"></div>
			
			<div class="col-4 card">

				
			<asp:Panel runat="server" ID="assignments" >
				
			</asp:Panel>
			

			</div>

			<div class ="col-4"></div>

			</div>
		</div>

	</div>
</asp:Content>
