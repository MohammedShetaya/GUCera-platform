using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.instructor
{
    public partial class SubmittedAssignments : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userType"].Equals(1))
            {
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand("select id, name from Course inner join InstructorTeachCourse on cid = id  where insid = @instId", conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("instId", Session["userID"]));
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String courseName = rdr.GetString(rdr.GetOrdinal("name"));
                    int courseId = rdr.GetInt32(rdr.GetOrdinal("id"));
                    ListItem l = new ListItem();
                    l.Text = courseName;
                    l.Value = courseId.ToString();
                    InstructorCoursesPanel.Items.Add(l);
                    
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void courseAssignments_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/instructor/ShowAssignemnts.aspx?courseID=" + InstructorCoursesPanel.SelectedValue + "&courseName=" + InstructorCoursesPanel.SelectedItem.Text);
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