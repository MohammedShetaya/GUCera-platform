using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUCera
{
    public partial class AddTelephoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null) {
                Response.Redirect("~/SignIn.aspx"); 
            }
        }

        protected void addNumber_Click(object sender, EventArgs e)
        {
            string num = addNumber.Text;

            if (!num.Equals("")) {
                try {

                    string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                    SqlConnection conn = new SqlConnection(connString);

                    SqlCommand cmd = new SqlCommand("addMobile", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@ID", Session["userID"]);
                    cmd.Parameters.Add("@mobile_number", num);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();


                    Response.Redirect("~/ViewProfile.aspx");
                }
                catch (Exception ex)
                {
                    if (ex is SqlException)
                    {
                        Label l = new Label();
                        l.Text = "Number already Exists";
                        incorrectInput.Controls.Add(l);
                    }
                    else
                    {
                    }
                }
            }
        }
    }
}