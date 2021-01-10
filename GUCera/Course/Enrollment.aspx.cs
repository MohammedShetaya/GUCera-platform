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
    public partial class Enrollment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                String courseName = Request.QueryString["courseName"];
                int courseID = Int32.Parse(Request.QueryString["courseID"]);
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

                SqlConnection conn1 = new SqlConnection(connString);

                SqlCommand cmd1 = new SqlCommand("select firstName, lastName, id from InstructorTeachCourse i inner join Users u on u.id = i.insid where i.cid = @courseID", conn1);
                cmd1.Parameters.Add(new SqlParameter("courseID", courseID));
                cmd1.CommandType = CommandType.Text;

                conn1.Open();
                SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr1.Read())
                {
                    String fn = rdr1.GetString(rdr1.GetOrdinal("firstName"));
                    String ln = rdr1.GetString(rdr1.GetOrdinal("lastName"));
                    int instID = rdr1.GetInt32(rdr1.GetOrdinal("id"));
                    ListItem l = new ListItem();
                    l.Text = fn + " " + ln;
                   l.Value = instID.ToString();
                    instructorsPanel.Items.Add(l);
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }

        }

        protected void Enroll_Click(object sender, EventArgs e)
        {
            String courseName = Request.QueryString["courseName"];
            int courseID = Int32.Parse(Request.QueryString["courseID"]);
            int instID;
            try
            {
                instID = Int32.Parse(instructorsPanel.SelectedValue);
            }
            catch (Exception ex)
            {
                Label label = new Label();
                label.Text = "Sorry there no instructors teaching this course right now!";
                Panel1.Controls.Add(label);
                return;
            }
            // connection to database
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("enrollInCourse", conn);
            cmd.CommandType = CommandType.StoredProcedure;



            cmd.Parameters.Add("@sid", Session["userID"]);
            cmd.Parameters.Add("@cid", courseID);
            cmd.Parameters.Add("@instr", instID);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch
            {
                Label label = new Label();
                label.Text = "You can't enroll this course";
                Panel1.Controls.Add(label);
                return;
            }
            Response.Redirect("~/Default.aspx");
        }
    }
}