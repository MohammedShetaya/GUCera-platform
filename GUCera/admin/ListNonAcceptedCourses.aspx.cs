using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace GUCera.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                String connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand courses = new SqlCommand("AdminViewNonAcceptedCourses", conn);
                courses.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader rdr = courses.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String courseName = rdr.GetString(rdr.GetOrdinal("name"));
                    int courseID = rdr.GetInt32(rdr.GetOrdinal("id"));
                    SqlConnection conn1 = new SqlConnection(connString);
                    SqlCommand cmd1 = new SqlCommand("select courseDescription from Course where name = @name", conn1);
                    cmd1.CommandType = CommandType.Text;
                    cmd1.Parameters.Add(new SqlParameter("name", courseName));
                    conn1.Open();
                    SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
                    if (rdr1.Read())
                    {

                        String courseDescription = rdr1.GetString(rdr1.GetOrdinal("courseDescription"));
                        Button button = new Button();
                        button.ID = courseName;
                        button.Text = "Show Course";
                        button.CssClass = "btn btn-outline-light btn-sm";
                        Button button2 = new Button();
                        button2.ID = courseID+"";
                        button2.Text = "Accept Course";
                        button2.CssClass = "btn btn-outline-light btn-sm";
                        button.Click += new EventHandler(ShowCourse_Click);
                        button2.Click += new EventHandler(AcceptCourse_Click);
                        String s = "<div class=\"col-4\"> <div class=\"card mb-4 text-white bg-secondary\"><img class=\"card-img-top\" src=\"..\\images\\courses.jpg\" alt=\"Course\"/> <div class=\"card-body\"> <h5 class=\"cardTitle\">" + courseName + "</h5><h6 class=\"card-subtitle mb-2 text-light\">Available</h6><p class=\"card-text\" style = \"height:100px;\">" + courseDescription + "</p>";
                        available_Courses.Controls.Add(new Literal() { Text = s });
                        available_Courses.Controls.Add(button);
                        available_Courses.Controls.Add(button2);
                        available_Courses.Controls.Add(new Literal() { Text = "</div></div></div>" });
                    }
                }
                available_Courses.Controls.Add(new Literal() { Text = "</div>" });
        }
        protected void AcceptCourse_Click(object sender,EventArgs e)
        {
            Button button = (Button)sender;

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            int courseID = Int32.Parse(button.ID);
            conn.Close();
            int adminId= (Int32)Session["userID"];
            SqlCommand cmd2 = new SqlCommand("AdminAcceptRejectCourse", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Add(new SqlParameter("@adminid",adminId));
            cmd2.Parameters.Add(new SqlParameter("@courseId", courseID));
            conn.Open();
            cmd2.ExecuteNonQuery();
            conn.Close();
            SqlConnection conn1 = new SqlConnection(connString);
            Response.Redirect("~/admin/ListNonAcceptedCourses.aspx");
        }
        protected void ShowCourse_Click(object sender, EventArgs e)
        {

            Button button = (Button)sender;
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            string courseName = button.ID;
            SqlCommand cmd = new SqlCommand("select id from Course where name = @name", conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(new SqlParameter("name", courseName));
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            int courseID = 0;
            if (rdr.Read())
            {
                courseID = rdr.GetInt32(rdr.GetOrdinal("id"));
            }

            conn.Close();
            SqlConnection conn1 = new SqlConnection(connString);

            SqlCommand cmd1 = new SqlCommand("courseInformation", conn1);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add("@id", courseID);
            conn1.Open();
            SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

            Response.Redirect("~/Course/CoursePage.aspx?courseName=" + courseName + "&courseID=" + courseID);



        }
    }
}