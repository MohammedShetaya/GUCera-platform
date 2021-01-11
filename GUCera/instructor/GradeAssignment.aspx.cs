using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.instructor
{
    public partial class GradeAssignment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null || !Session["userType"].Equals(1))
                Response.Redirect("~/Default.aspx");
        }

        protected void gradeAssignments_Click(object sender, EventArgs e)
        {
            int courseID = Int32.Parse(Request.QueryString["courseID"]);
            int asNumber = Int32.Parse(Request.QueryString["asNumber"]);
            String typ = Request.QueryString["typ"];
            int sid = Int32.Parse(Request.QueryString["sid"]);
            
            Decimal grd = Decimal.Parse(grade.Text);
            
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("InstructorgradeAssignmentOfAStudent", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.Add("@instrId", Session["userId"]);
            cmd.Parameters.Add("@sid", sid);
            cmd.Parameters.Add("@cid", courseID);
            cmd.Parameters.Add("@assignmentNumber", asNumber);
            cmd.Parameters.Add("@type", typ);
            cmd.Parameters.Add("@grade", grd);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception exception)
            {
                Label l = new Label();
                l.Text = "Please put an appropriate grade.";
                Panel1.Controls.Add(l);
            }
            
            
        }
    }
}