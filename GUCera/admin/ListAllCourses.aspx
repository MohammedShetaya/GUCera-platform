<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAllCourses.aspx.cs" Inherits="GUCera.admin.ListAllCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group list-group-flush p-2 bd-highlight col-example" id="list" runat="server" style="width: 200px;" >
  <p href="#" class="list-group-item text-center d-inline-block list-group-item-action ">First item</p>
  <p href="#" class="list-group-item list-group-item-action">Second item</p>
  <p href="#" class="list-group-item list-group-item-action">Third item</p>
</div>
</asp:Content>
