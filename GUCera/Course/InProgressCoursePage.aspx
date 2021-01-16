<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InProgressCoursePage.aspx.cs" Inherits="GUCera.Course.InProgressCoursePage" %>
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
                        
                        <div class="ml-auto">
                            <asp:LinkButton type="button" ID="submittedAssigns" OnClick="submittedAssigns_Click" runat="server" style="margin-right:20px;" class="btn btn-info">Submitted Assignments</asp:LinkButton>
                        </div>

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
         
         <asp:Panel runat="server" DefaultButton="feedbackButton" class="form-group" style="margin-bottom:30px;">
             <div class="row">
             <div class ="col-6">
                <label style ="font:bold">Add Feedback to this course</label>
                <asp:TextBox class="form-control" TextMode="MultiLine" id="feedbackText" runat="server" rows="3"></asp:TextBox>
             </div>

             <div class="col-2" style="margin-top:40px;">
				 <asp:Button ID="feedbackButton" runat="server" OnClick="addFeedback_Click" class="btn btn-outline-info" Text="Add Feedback" />
             </div>
            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="feedbackContent" >

             

            


        </asp:Panel>

    </div>

</asp:Content>
