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

                SqlCommand cmd1 = new SqlCommand("viewMyProfile", conn);
                cmd1.CommandType = CommandType.StoredProcedure;

                cmd1.Parameters.Add("@id", u); 

                conn.Open(); 

                SqlDataReader rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

                if (rdr.Read())
                {
                    Session["userID"] = u;
                    Session["firstName"] = rdr.GetString(rdr.GetOrdinal("firstName"));
                    Session["lastName"] = rdr.GetString(rdr.GetOrdinal("lastName"));
                    Session["userType"] = 0;
                }
                else {
                    rdr.Close();
                    conn.Close();
                    
                    SqlCommand cmd2 = new SqlCommand("viewInstructorProfile", conn);
                    cmd2.CommandType = CommandType.StoredProcedure;

                    cmd2.Parameters.Add("@instrId", u);

                    conn.Open();

                    SqlDataReader rdr1 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);

                    if (rdr1.Read())
                    {
                       
                        Session["userID"] = u;
                        Session["firstName"] = rdr1.GetString(rdr1.GetOrdinal("firstName"));
                        Session["lastName"] = rdr1.GetString(rdr1.GetOrdinal("lastName"));
                        Session["userType"] = 1;
                       
                    }
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