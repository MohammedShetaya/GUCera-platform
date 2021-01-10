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
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                Label l1 = new Label();
                l1.Text = Session["firstName"] + " " + Session["lastName"]+"  ("+Session["userID"]+")";
                profile.Controls.Add(l1);               

            }
            else {
                logoutPanel.CssClass = "invisible";
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["userID"] = null;
            Session["firstName"] = null;
            Session["lastName"] = null;
            Session["userType"] = null; 
            Response.Redirect("~/Default.aspx"); 
        }

        protected void signUp_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
                signUp.CssClass = "invisible" ;
        }

        protected void signIn_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
                signIn.CssClass = "invisible";

        }

        protected void CoursesInProgress_load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);


                SqlCommand cmd = new SqlCommand("select id from Student where id = @i", conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add(new SqlParameter("i", Session["userID"]));
                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (!rdr.HasRows)
                {
                    progress.Controls.Clear();
                }
            }
            else
            {

                progress.Controls.Clear();

            }

        }

    }
}