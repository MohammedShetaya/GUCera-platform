<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddTelephoneNumber.aspx.cs" Inherits="GUCera.AddTelephoneNumber" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div class="jumbotron jumbotron-fluid">
           <div class="container">
                <h1 class="display-4">Please Add Your Phone Number</h1>
           </div>
        </div>

        <asp:Panel runat="server" DefaultButton="addNumber" class="row">
            <div class="col-sm"></div>
            <div class="col-sm">
               <div class="input-group input-group-lg">
                   <div class="input-group-prepend">
                     <span class="input-group-text" id="inputGroup-sizing-lg">Number</span>
                   </div>
                 <asp:TextBox ID="addNumber" TextMode="SingleLine" runat="server" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm"></div>
        </asp:Panel>
    <hr class="colorgraph" />


       <div class="row" style="margin-top:30px;">
           
           <div class="col-4"></div>
            <div class="col-8">
                
                <span >
                   <asp:Button  runat="server" class="btn btn-lg btn-outline-success " Text="Add Number" style="margin-left:30px" OnClick="addNumber_Click"></asp:Button>
                </span>

                <span style="font-size:1.2em">
                    <asp:Label ID="incorrectInput" class="col-sm text-danger" runat="server" ></asp:Label>
                </span>
            </div>
            
       </div>
        
      
</asp:Content>
