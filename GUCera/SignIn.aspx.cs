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
            
            if (Session["userID"] != null) {
                Response.Redirect("~/Default.aspx"); 
            }


        }

        protected void signin_Click(object sender, EventArgs e)
        {
            PerformSignIN();
        }

        
        void PerformSignIN()
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("userLogin", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            int u = Int32.Parse(username.Text);
            string p = password.Text;

            cmd.Parameters.Add("@id", u);
            cmd.Parameters.Add("@password", p);

            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            SqlParameter type = cmd.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = ParameterDirection.Output;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label incorrectLabel = new Label();
                incorrectLabel.Text = "Incorrect Username or Password";
                incorrect.Controls.Add(incorrectLabel);
            }

            if (success.Value.ToString().Equals("1"))
            {

                SqlConnection conn1 = new SqlConnection(connString);
                SqlCommand cmd1 = new SqlCommand("select firstName, lastName from Users where id = @id", conn1);
                cmd1.CommandType = CommandType.Text;
                cmd1.Parameters.Add(new SqlParameter("id", u));
                conn1.Open();
                SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
                if (rdr1.Read())
                {
                    Session["userID"] = u;
                    Session["firstName"] = rdr1.GetString(rdr1.GetOrdinal("firstName"));
                    Session["lastName"] = rdr1.GetString(rdr1.GetOrdinal("lastName"));
                    Session["userType"] = Int32.Parse(type.Value.ToString());
                }

                Response.Redirect("~/Default.aspx");

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