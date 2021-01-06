<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InstructorSignUp.aspx.cs" Inherits="GUCera.Instructor.InstructorSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    
        <div class="container ">
      <div class="d-inline-flex p-2 bd-highlight " id="signUpForm">
        <fieldset>

        <div class="input-group marg">
            <div class="input-group-prepend">
               <span class="input-group-text">First and last name</span>
            </div>
            <asp:TextBox name="firstName" ID="firstName" TextMode ="SingleLine" class="form-control" runat="server"></asp:TextBox>
            <asp:TextBox name="lastName" ID="lastName" TextMode ="SingleLine" class="form-control" runat="server"></asp:TextBox>
            
        </div>
        
        <div class="input-group marg">
            <div class="input-group-prepend">
               <span class="input-group-text" >Password</span>
            </div>
            <asp:TextBox name="password" ID="password" TextMode ="Password" class="form-control" runat="server"></asp:TextBox>
        </div>
 
        <div class="input-group marg">
            <div class="input-group-prepend">
               <span class="input-group-text">Email</span>
            </div>
            <asp:TextBox name="email" ID="email" TextMode ="Email" class="form-control" runat="server"></asp:TextBox>
            <div class="input-group-append">
                 <span class="input-group-text" id="basic-addon2">@example.com</span>
            </div>
        </div>

         <div class="input-group marg">
                <div class="input-group-prepend">
                     <span class="input-group-text">
                         <asp:RadioButton ID="male" aria-label="Radio button for following text input" runat="server" GroupName="gender" />
                         
                     </span>
                     <div class="input-group-append">
                          <span class="input-group-text" id="basic-addon2">Male</span>
                        </div>

                     <span class="input-group-text">
                         <asp:RadioButton ID="female" aria-label="Radio button for following text input" runat="server" GroupName="gender" />
                     </span>
                    <div class="input-group-append">
                              <span class="input-group-text" id="basic-addon2">Female</span>
                         </div>
               </div>
         </div>   
            
        <div class="input-group marg">
            <div class="input-group-prepend">
               <span class="input-group-text" >Adress</span>
            </div>
            <asp:TextBox name="address" ID="address" TextMode ="MultiLine" class="form-control" runat="server"></asp:TextBox>
        </div>
        
       <asp:Button  id="signUp" class="btn btn-success marg btn-lg" Text="Sign Up" runat="server" OnClick="signUp_Click" />


         <div class="input-group marg">
            <div class="input-group-prepend">
                <asp:Panel ID="incorrectInput"  runat="server"></asp:Panel>
             </div>
         </div>

      </fieldset>
   </div>      

 </div>



</asp:Content>
