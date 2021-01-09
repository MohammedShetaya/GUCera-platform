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
    public partial class CoursePage : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                String courseName = Request.QueryString["courseName"];
                int courseID = Int32.Parse(Request.QueryString["courseID"]);
                pageTitle.Controls.Add(new Literal { Text = courseName });

                // connection to database
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand("courseInformation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", courseID);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                //
                if (rdr.Read())
                { 
                    

                    Label courseDescriptionLabel = new Label();
                    courseDescriptionLabel.Text = rdr.GetString(rdr.GetOrdinal("courseDescription"));
                    Label priceLabel = new Label();
                    priceLabel.Text = rdr.GetDecimal(rdr.GetOrdinal("price")).ToString();
                    Label contentLabel = new Label();
                    contentLabel.Text = rdr.GetString(rdr.GetOrdinal("content"));
                    Label courseNameLabel = new Label();
                    courseNameLabel.Text = courseName;

                    courseDescription.Controls.Add(courseDescriptionLabel);
                    price.Controls.Add(priceLabel);
                    content.Controls.Add(contentLabel);
                    CourseName.Controls.Add(courseNameLabel);

                    conn.Close();
                    // connection for getting all users that teaches this course
                    SqlConnection conn1 = new SqlConnection(connString);

                    SqlCommand cmd1 = new SqlCommand("select firstName, lastName from InstructorTeachCourse i inner join Users u on u.id = i.insid where i.cid = @courseID", conn1);
                    cmd1.Parameters.Add(new SqlParameter("courseID", courseID));
                    cmd1.CommandType = CommandType.Text;

                    conn1.Open();
                    SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

                    //
                    while (rdr1.Read()){
                        string s = rdr1.GetString(rdr1.GetOrdinal("firstName")) + " " + rdr1.GetString(rdr1.GetOrdinal("lastName"));
                        Label m = new Label();
                        Panel n = new Panel();
                        m.Text = s;
                        n.Controls.Add(m);
                        instuctorsNames.Controls.Add(n);
           
                    }
                    conn1.Close();

                }                

            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void enroll_Click(object sender, EventArgs e)
        {
            String courseName = Request.QueryString["courseName"];
            int courseID = Int32.Parse(Request.QueryString["courseID"]);
            Response.Redirect("~/Course/Enrollment.aspx?courseID=" + courseID + "&courseName=" + courseName);

        }
    }
}