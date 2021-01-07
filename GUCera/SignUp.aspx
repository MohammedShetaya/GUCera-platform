<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="GUCera.SignUp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    	<div class="container ">
             <div class="row justify-content-center" style="margin-top:20px">
                 
                       <div class="card" style="width: 18rem;" id="jonAsStud">
                           <img class="card-img-top" id="studenIcon" src="images\studentIcon.png" alt="Card image cap">
                          <div class="card-body">
                          <h5 class="card-title">Student</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="student\StudentSignUp.aspx" class="btn btn-success">Join as Student</a>
                           </div>
                       </div>

                       <div class="card" style="width: 18rem;">
                          <img class="card-img-top" id="instructorIcon" src="images\instructorIcon.png"  alt="Card image cap">
                          <div class="card-body">
                          <h5 class="card-title">Instructor</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="instructor\InstructorSignUp.aspx" class="btn btn-dark">Join as Instructor</a>
                       </div>
                       </div>
                                       
            </div>
        </div>
      
</asp:Content>
