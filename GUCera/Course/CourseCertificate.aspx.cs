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
    public partial class CourseCertificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                String courseName = Request.QueryString["courseName"];
                int courseID = Int32.Parse(Request.QueryString["courseID"]);

                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("select u.firstName, u.lastName, sc.issueDate from Users u inner join StudentCertifyCourse sc on u.id = sc.sid where sc.sid = @sid", conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("sid", Session["userID"]));
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (rdr.Read())
                {
                    String s = "This is to certify that " + rdr.GetString(rdr.GetOrdinal("firstName")) + " " + rdr.GetString(rdr.GetOrdinal("lastName")) + " successfully completed " + courseName +" online course on " + rdr.GetDateTime(rdr.GetOrdinal("issueDate")).ToString();
                    Label l = new Label();
                    l.Text = s;
                    certicateTextPanel.Controls.Add(l);
                }
                conn.Close();
                rdr.Close();
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }
    }
}