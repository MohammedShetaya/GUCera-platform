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
    public partial class certifiedCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userType"].Equals(0))
            {
                
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("select c.name, c.id from Course c inner join StudentCertifyCourse sc on c.id = sc.cid where sid = @sid", conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("sid", Session["userID"]));
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String courseName = rdr.GetString(rdr.GetOrdinal("name"));
                    int courseId = rdr.GetInt32(rdr.GetOrdinal("id"));
                    ListItem l = new ListItem();
                    l.Text = courseName;
                    l.Value = courseId.ToString();
                    certifiedCoursesPanel.Items.Add(l);
                }


            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }

        }
        protected void CourseCertificate_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Course/CourseCertificate.aspx?courseID=" + certifiedCoursesPanel.SelectedValue + "&courseName=" + certifiedCoursesPanel.SelectedItem.Text);
            }
            catch (Exception ex)
            {
                Label l = new Label();
                l.Text = "Please choose course!";
                Panel1.Controls.Add(l);
            }
        }
    }
}