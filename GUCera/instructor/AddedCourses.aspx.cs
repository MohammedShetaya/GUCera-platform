using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GUCera.instructor
{
	public partial class AddedCourses : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

            if (Session["userID"] == null)
            {
                Response.Redirect("~/SignIn.aspx");

            }
            else
            {

                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("select * from Course where instructorId = @ins", conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("ins", Session["userID"]));
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);



                while (rdr.Read())
                {
                    int courseID = rdr.GetInt32(rdr.GetOrdinal("id"));
                    string courseName = rdr.GetString(rdr.GetOrdinal("name"));

                    string courseDis = "";
                    try
                    {
                        courseDis = rdr.GetString(rdr.GetOrdinal("courseDescription"));
                    }
                    catch (Exception ex)
                    {


                    }

                    progressCourses.Controls.Add(new Literal() { Text = "<div class=\"col-4\"> <div class=\"card mb-4 text-white bg-secondary\"><img class=\"card-img-top\" src=\"..\\images\\courses.jpg\" alt=\"Course\"/> <div class=\"card-body\"> <h5 class=\"cardTitle\">" + courseName + "</h5><p class=\"card-text\" style = \"height:100px;\">" + courseDis + "</p>" });


                    Button b = new Button();
                    b.Text = "show course";
                    b.CssClass = "btn btn-outline-light btn-sm";
                    b.ID = courseID + "";
                    b.Click += new EventHandler(ShowCourse_Click);

                    progressCourses.Controls.Add(b);
                    progressCourses.Controls.Add(new Literal() { Text = "</div></div></div>" });
                }
            }

        }

        private void ShowCourse_Click(object sender, EventArgs e)
        {
            Button req = (Button)sender;
            int courseID = int.Parse(req.ID);
            Response.Redirect("~/Course/AddedCoursePage.aspx?courseID=" + courseID);
        }
    }
}