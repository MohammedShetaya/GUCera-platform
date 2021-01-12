<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddedCoursePage.aspx.cs" Inherits="GUCera.instructor.AddedCoursePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


	 <div class="jumbotron">
        
     <div class="container">
            
         <div class="row">


            <div class="col-8">
                <div class="card">

                    <div class="card-header row">

                    <asp:Panel ID="courseName" class="col-6"  runat="server">
                        
                    </asp:Panel>
                        
                       
                        </div>



                              <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">

                                        <div class="row">
                                            <div class="col-3 col-md-2 col-5">
                                                <label style="font-weight: bold;margin-left:8px;margin-top:8px">Credit Hours:</label>
                                            </div>
                                            <div class="col-8 col-6">
                                                <asp:Panel ID="creditHours" runat="server"></asp:Panel>
                                            </div>
                                        </div>
                                        <hr />



                                        <div class="row">
                                            <div class="col-sm-4 col-md-2 col-5">
                                                <label style="font-weight: bold;margin-left:8px;">Discription :</label>
                                            </div>
                                            <div class="col-md-7 col-6">
                                                <asp:Panel ID="courseDisc" runat="server"></asp:Panel>
                                            </div>
                                        </div>

                                        <hr />


                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight: bold;margin-left:8px;">Content :</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <asp:Panel ID="courseContent" runat="server"></asp:Panel>
                                            </div>
                                        </div>


                                        

                                    </div>

                                </div>






                </div>
             </div>


            <div class="col-4 h-50">
                <div class="card">
                    <div class="card-header">
                        Assignments
                    </div>

                        <asp:Panel ID="courseAssignments" runat="server" >

                        </asp:Panel>
                </div>
            </div>


          </div>
      </div>
</div>

    <div class="container">
         
        
        <asp:Panel runat="server" ID="feedbackContent" >

             

            


        </asp:Panel>

    </div>


</asp:Content>
