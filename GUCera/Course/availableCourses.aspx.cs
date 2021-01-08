using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.Course
{

    public partial class availableCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {

                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("availableCourses", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                //String s = "<div class=\"card\" style=\"width: 18rem; \">< div class=\"card-body\"><h5 class=\"card-title\">Card title</h5><h6 class=\"card-subtitle mb-2 text-muted\">Card subtitle</h6><p class=\"card-text\">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a href = \"#\" class=\"card-link\">Card link</a><a href = \"#\" class=\"card-link\">Another link</a></div></div>";


                int i = 0;
                available_Courses.Controls.Add(new Literal() { Text = "<div class=\"row\">" });
                while (rdr.Read())
                {

                    String courseName = rdr.GetString(rdr.GetOrdinal("name"));

                    SqlConnection conn1 = new SqlConnection(connString);
                    SqlCommand cmd1 = new SqlCommand("select courseDescription from Course where name = @name", conn1);
                    cmd1.CommandType = CommandType.Text;
                    cmd1.Parameters.Add(new SqlParameter("name", courseName));
                    conn1.Open();
                    SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

                    if (rdr1.Read())
                    {

                        String courseDescription = rdr1.GetString(rdr1.GetOrdinal("courseDescription"));

                        String s = "<div class=\"card\" style=\"width: 18rem;\"><div class=\"card-body\"><h5 class=\"card-title\">" + courseName + "</h5><h6 class=\"card-subtitle mb-2 text-muted\">Available</h6><p class=\"card-text\">" + courseDescription + "</p><a href = \"#\" class=\"card-link btn btn-primary\" ID=\"" + courseName + "\">Show Course</a></div></div>";

                        available_Courses.Controls.Add(new Literal() { Text = "<div class=\"col-3\">" + s + "</div>" });



                    }

                    //if (i % 4 == 1)
                    //{
                    //    available_Courses.Controls.Add(new Literal() { Text = "</div>" });
                    //    available_Courses.Controls.Add(new Literal() { Text = "<div class=\"row\">" });
                    //}

                    i++;
                }
                available_Courses.Controls.Add(new Literal() { Text = "</div>" });


            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void ShowCourse_Click(object sender, EventArgs e)
        {
            available_Courses.Controls.Clear();
            LinkButton linkButton = (LinkButton)sender;
            string courseName = linkButton.ID;

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

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


            SqlConnection conn1 = new SqlConnection(connString);

            SqlCommand cmd1 = new SqlCommand("courseInformation", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add("@id", courseID);
            conn1.Open();
            SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
            Course.Controls.Add(new Literal() { Text = "<h1>" + courseName + " " + courseID + "</h1>" });



        }
    }
}