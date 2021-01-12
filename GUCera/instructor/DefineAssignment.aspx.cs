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
    public partial class DefineAssignment : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userType"].Equals(1))
            {
                
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand("select id, name from Course where instructorId = @instId", conn);
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
                    cName.Items.Add(l);
                }
                conn.Close();
                rdr.Close();



            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void addCard_Click(object sender, EventArgs e)
        {
            try
            {
                int num = Int32.Parse(asNum.Text);
                String typ = asType.SelectedItem.Text;
                int cid = Int32.Parse(cName.SelectedItem.Value);
                int fullGrd = Int32.Parse(asGrade.Text);
                Decimal weig = Decimal.Parse(asWeight.Text);
                DateTime deadlineDate = DateTime.Parse(dead.Text);
                String Cont = asContent.Text;

                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("DefineAssignmentOfCourseOfCertianType", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@instId", Session["userID"]);
                cmd.Parameters.Add("@cid", cid);
                cmd.Parameters.Add("@number", num);
                cmd.Parameters.Add("@type", typ);
                cmd.Parameters.Add("@fullGrade", fullGrd);
                cmd.Parameters.Add("@weight", weig);
                cmd.Parameters.Add("@deadline", deadlineDate);
                cmd.Parameters.Add("@content", Cont);
                SqlParameter success = cmd.Parameters.Add("@sucess", SqlDbType.Int);
                success.Direction = ParameterDirection.Output;
                
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                if (success.Value.ToString().Equals("0"))
                {
                    incorrectInput.Controls.Clear();
                    Label l = new Label();
                    l.Text = "You can't add this assignments because Assignemnts weights exceeded 100%";
                    incorrectInput.Controls.Add(l);
                    
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            catch (Exception ex)
            {
                incorrectInput.Controls.Clear();
                Label l = new Label();
                l.Text = "Incorrect Assignment Information or Assignment already exists";
                incorrectInput.Controls.Add(l);
                
            }
            
        }
    }
}