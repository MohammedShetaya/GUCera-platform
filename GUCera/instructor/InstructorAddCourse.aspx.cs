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
    public partial class InstructorAddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {

            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }

        protected void addCard_Click(object sender, EventArgs e)
        {
            try
            {
                string nam = name.Text;
                string cred = Credit.Text;
                string price = Price.Text;

                string cont = content.Text;
                string desc = description.Text;




            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("InstAddCourse", conn);
            cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@content" , cont );
                cmd.Parameters.Add("@description", desc);
            cmd.Parameters.Add("@creditHours", cred);
            cmd.Parameters.Add("@name", nam);
            cmd.Parameters.Add("@price", price);
            cmd.Parameters.Add("@instructorId", Session["userID"]);

            

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();


                Response.Redirect("~/ViewProfile.aspx");
            }

            catch (Exception ex)
            {
                
                    Label l = new Label();
                    l.Text = "Incorrect Course Information or Course already exists";
                    incorrectInput.Controls.Add(l);
                
            }
        }
    }
}