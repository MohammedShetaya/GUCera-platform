using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace GUCera.instructor
{
	public partial class AddedCoursePage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

            if (Session["userID"] == null)
            {
                Response.Redirect("~/SignIn.aspx");
            }
            else
            {

                //display the course info 

                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("courseInformation", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                int ID = int.Parse(Request.QueryString["courseID"]);


                cmd.Parameters.Add("@id", ID);

                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (rdr.Read())
                {

                    string name = rdr.GetString(rdr.GetOrdinal("name"));
                    int credit = rdr.GetInt32(rdr.GetOrdinal("creditHours"));

                    string disc = "";
                    string cont = "";
                    try
                    {
                        disc = rdr.GetString(rdr.GetOrdinal("courseDescription"));
                        cont = rdr.GetString(rdr.GetOrdinal("content"));

                    }
                    catch (Exception ex)
                    {
                    }

                    courseName.Controls.Add(new Literal() { Text = "<h1>" + name + "<h1>" });

                    creditHours.Controls.Add(new Literal() { Text = "<p style = \"margin-top:15px \">" + credit + "<p>" });
                    courseDisc.Controls.Add(new Literal() { Text = "<p style=\"padding-bottom:20px; \">" + disc + "<p>" });
                    courseContent.Controls.Add(new Literal() { Text = "<p style=\"padding-bottom:20px; \">" + cont + "<p>" });

                }

                //display assignments of the course 

                rdr.Close();
                conn.Close();


                SqlCommand cmd1 = new SqlCommand("select A.number , A.content , A.type from Course C inner join Assignment A on C.id = A.cid where C.instructorId = @ins  and C.id = @cc", conn);
                cmd1.CommandType = CommandType.Text;
                cmd1.Parameters.Add(new SqlParameter("@cc", ID));
                cmd1.Parameters.Add(new SqlParameter("@ins", Session["userID"]));


                conn.Open();

                rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read())
                {
                   
                        int assignNum = rdr.GetInt32(rdr.GetOrdinal("number"));

                        string assignType = rdr.GetString(rdr.GetOrdinal("type"));


                    string assignCont = "";
                    try
                    {
                         assignCont = rdr.GetString(rdr.GetOrdinal("content"));
                    }
                    catch (Exception)
                    {
                    }


                    courseAssignments.Controls.Add(new Literal() { Text = "<div class=\"card\"><div class=\"card-body\"><h5 class=\"card-title\">" + assignType + " " + assignNum + "</h5><p class=\"card-text\">" + assignCont + "</p>" });

                   
                        courseAssignments.Controls.Add(new Literal() { Text = "</div></div>" });
                   
                }

                // render the feedbacks for this course 

                rdr.Close();
                conn.Close();

                conn.Open();

                SqlCommand cmd2 = new SqlCommand("select * from Feedback where cid = @course", conn);
                cmd2.CommandType = CommandType.Text;
                cmd2.Parameters.Add(new SqlParameter("course", ID));

                rdr = cmd2.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read())
                {

                    string comment = rdr.GetString(rdr.GetOrdinal("comment"));
                    int likes = rdr.GetInt32(rdr.GetOrdinal("numberOfLikes"));
                    int adder = rdr.GetInt32(rdr.GetOrdinal("sid"));
                    int feedNumber = rdr.GetInt32(rdr.GetOrdinal("number"));

                    SqlCommand cc = new SqlCommand("select firstName , lastName from Users where id = @sid ", conn);
                    cc.CommandType = CommandType.Text;
                    cc.Parameters.Add(new SqlParameter("sid", adder));

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


                    feedbackContent.Controls.Add(new Literal() { Text = "<div class=\"row\" style=\"margin-bottom:25px;\"> <div class=\"col-sm-4 col-md-2 col-5\">  <img class=\"rounded\" style=\"height:45PX; width: 45px;\" alt=\"\" src=\"..\\images\\user-profile.png\"/> <h6> " + adderfName + " " + adderlName + "</h6></div> <div class=\"col-md-7 col-6\"> <div class=\"row\"><p>" + comment + "</p></div><div class=\"row\">" });

                    feedbackContent.Controls.Add(new Literal() { Text = "<span style = \"margin-left:20px;\">" + likes + "</span></div></div></div>" });

                }
            }


        }
    }
}