using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUCera
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void signin_Click(object sender, EventArgs e)
        {


            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("userLogin", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            int u = Int16.Parse(username.Text);
            string p = password.Text;

            cmd.Parameters.Add("@id", u);
            cmd.Parameters.Add("@password", p);

            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            SqlParameter type = cmd.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


            if (success.Value.ToString().Equals("1"))
            {
                Response.Redirect("Default.aspx");

            }
            else
            {
                Label incorrectLabel = new Label();
                incorrectLabel.Text = "Incorrect Username or Password";
                incorrect.Controls.Add(incorrectLabel) ; 
            }

        }

    }
}