using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUCera.Course
{
    public partial class InProgressCoursePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userID"] == null)
            {
                Response.Redirect("~/SignIn.aspx");
            }
            else {

                //display the course info 

                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("courseInformation", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                int ID = int.Parse(Request.QueryString["courseID"]) ; 

                cmd.Parameters.Add("@id", ID);

                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (rdr.Read()) {

                    string name = rdr.GetString(rdr.GetOrdinal("name"));
                    int credit = rdr.GetInt32(rdr.GetOrdinal("creditHours"));

                    string disc = "";
                    string cont = "";
                    try
                    {
                        disc = rdr.GetString(rdr.GetOrdinal("courseDescription"));
                        cont = rdr.GetString(rdr.GetOrdinal("content"));

                    }
                    catch (Exception ex) { 
                    }

                    courseName.Controls.Add(new Literal() { Text = "<h1>"+ name +"<h1>" });

                    creditHours.Controls.Add(new Literal() { Text = "<p style = \"margin-top:15px \">"+credit +"<p>" });
                    courseDisc.Controls.Add(new Literal() {Text = "<p style=\"padding-bottom:20px; \">"+disc+"<p>" });
                    courseContent.Controls.Add(new Literal() { Text = "<p style=\"padding-bottom:20px; \">" + cont + "<p>" });

                }

                //display assignments to be done 

                rdr.Close();
                conn.Close(); 


                SqlCommand cmd1 = new SqlCommand("viewAssign" , conn);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add(new SqlParameter("@courseId", ID));
                cmd1.Parameters.Add(new SqlParameter("@Sid", Session["userID"]));

                conn.Open();
                
                rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read()) {

                    try
                    {
                        int assignNum = rdr.GetInt32(rdr.GetOrdinal("number"));
                        string assignType = rdr.GetString(rdr.GetOrdinal("type"));
                        string assignCont = rdr.GetString(rdr.GetOrdinal("content"));

						courseAssignments.Controls.Add(new Literal() { Text = "<div class=\"card\"><div class=\"card-body\"><h5 class=\"card-title\">" + assignType + " " + assignNum + "</h5><p class=\"card-text\">" + assignCont + "</p>" });

                        Button b1 = new Button();
                        b1.Text = "submit assign";
                        b1.ID = assignType + "-" + assignNum ;
                        b1.CssClass = "btn btn-outline-info" ;
                        b1.Click += new EventHandler(submitAssignment_Click);

                        courseAssignments.Controls.Add(b1);
                        courseAssignments.Controls.Add(new Literal() { Text = "</div></div>" });
                    }
                    catch (Exception ex) {
                        
                        continue;
                    }
                }

                // render the feedbacks for this course 

                rdr.Close();
                conn.Close();

                conn.Open();

				SqlCommand cmd2 = new SqlCommand("select * from Feedback where cid = @course", conn);
                cmd2.CommandType = CommandType.Text;
                cmd2.Parameters.Add(new SqlParameter("course" , ID ));

                rdr = cmd2.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read()) {

					string comment = rdr.GetString(rdr.GetOrdinal("comment"));
                    int likes = rdr.GetInt32(rdr.GetOrdinal("numberOfLikes"));
                    int adder = rdr.GetInt32(rdr.GetOrdinal("sid"));
                    int feedNumber = rdr.GetInt32(rdr.GetOrdinal("number"));
                    
                    SqlCommand cc = new SqlCommand("select firstName , lastName from Users where id = @sid " , conn );
                    cc.CommandType = CommandType.Text ;
                    cc.Parameters.Add(new SqlParameter("sid" , adder));

					SqlDataReader rr = cc.ExecuteReader(CommandBehavior.CloseConnection);


                    string adderfName = "";
                    string adderlName = "";
                    if (rr.Read())
                    {
                         adderfName = rr.GetString(rr.GetOrdinal("firstName"));
                         adderlName = rr.GetString(rr.GetOrdinal("lastName"));

                    }
                    /*                
                <div class="row" style="margin-bottom:25px;">
                <div class="col-sm-4 col-md-2 col-5">
                    <img class="rounded" style="height:45PX;width:45px;" alt="" src="..\images\user-profile.png" />
                    <h6>

                    </h6>
                </div>
                <div class="col-md-7 col-6">

                    <div class="row">
                        <p></p>
                    </div>
                    <div class="row">
                        <a class="fa fa-thumbs-up"></a>
                    </div>

                </div>
                </div>
                     */
                    

                     feedbackContent.Controls.Add(new Literal() { Text = "<div class=\"row\" style=\"margin-bottom:25px;\"> <div class=\"col-sm-4 col-md-2 col-5\">  <img class=\"rounded\" style=\"height:45PX; width: 45px;\" alt=\"\" src=\"..\\images\\user-profile.png\"/> <h6> " + adderfName+" "+adderlName+ "</h6></div> <div class=\"col-md-7 col-6\"> <div class=\"row\"><p>"+comment+ "</p></div><div class=\"row\">" });
                    LinkButton bb = new LinkButton();
                    bb.CssClass = "fa fa-thumbs-up";
                    bb.Click += new EventHandler(addLike_Click);
                    bb.ID = ID + "-" + feedNumber;
                    feedbackContent.Controls.Add(bb);

                    feedbackContent.Controls.Add(new Literal() { Text = "<span style = \"margin-left:20px;\">" + likes + "</span></div></div></div>" });

                }
            }

        }

        protected void submitAssignment_Click(object sender, EventArgs e) {

            Button s = (Button)sender;
            string [] assign = (s.ID).Split('-');
            string assignType = assign[0] ;
            int assignNum = int.Parse(assign[1]);

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("submitAssign", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            int cid = int.Parse(Request.QueryString["courseID"]);


            cmd.Parameters.Add("@assignType" , assignType);
            cmd.Parameters.Add("@assignnumber" , assignNum);
            cmd.Parameters.Add("@sid" , Session["userID"]);
            cmd.Parameters.Add("@cid" , cid );

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/Course/InProgressCoursePage.aspx?courseID="+cid);


        }


        protected void addLike_Click(object sender, EventArgs e)
        {

            LinkButton s = (LinkButton)sender;

            string senderID = s.ID; 
            string[] likeData = senderID.Split('-');
            int cid = int.Parse(likeData[0]);
            int feedNumber = int.Parse(likeData[1]);

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("select * from Feedback where cid = @cc and number = @nu", conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("cc" , cid));
            cmd.Parameters.Add(new SqlParameter("nu", feedNumber));

            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
			
            if (rdr.Read())
			{
                int numberOfLikes = rdr.GetInt32(rdr.GetOrdinal("numberOfLikes"));
                numberOfLikes = numberOfLikes+1 ;
                
                rdr.Close();
                conn.Close();

                conn.Open();

                SqlCommand cc = new SqlCommand("update Feedback set numberOfLikes = @num where cid = @ci  and number = @nu" , conn);
                cc.Parameters.Add(new SqlParameter("num" , numberOfLikes));
                cc.Parameters.Add(new SqlParameter("ci", cid));
                cc.Parameters.Add(new SqlParameter("nu", feedNumber));

                cc.ExecuteNonQuery();
                conn.Close();


            }

            Response.Redirect("~/Course/InProgressCoursePage.aspx?courseID="+cid);
            

        }


        protected void addFeedback_Click(object sender, EventArgs e)
		{
            string feedback = feedbackText.Text;
            int cid = int.Parse(Request.QueryString["courseID"]);

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("addFeedback", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@comment", feedback);
            cmd.Parameters.Add("@cid" , cid);
            cmd.Parameters.Add("@sid",Session["userID"]);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/Course/InProgressCoursePage.aspx?courseID="+cid); 

        }
    }
}