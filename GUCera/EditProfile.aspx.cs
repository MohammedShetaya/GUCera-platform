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
	public partial class EditProfile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["userID"] == null)
            {

                Response.Redirect("~/SignIn.aspx");
            }
		}

        protected void edit_Click(object sender, EventArgs e)
        {
            string fn = firstName.Text;
            string ln = lastName.Text; 
            string ps = password.Text;
            bool ge = female.Checked;
            string ml = email.Text ;
            string ad = address.Text ;


            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("editMyProfile", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.Add("@id", Session["userID"]);


            if (fn.Equals(""))
                cmd.Parameters.AddWithValue("@firstName", DBNull.Value);
            else
                cmd.Parameters.Add("@firstName", fn);

            if (ln.Equals(""))
                cmd.Parameters.AddWithValue("@lastName", DBNull.Value);
            else
                cmd.Parameters.Add("@lastName", ln);

            if (ps.Equals(""))
                cmd.Parameters.AddWithValue("@password", DBNull.Value);
            else
            cmd.Parameters.Add("@password",ps);

            if(! (male.Checked || female.Checked))
                cmd.Parameters.AddWithValue("@gender" ,DBNull.Value) ;
            else
                cmd.Parameters.Add("@gender" , ge);

            if(ml.Equals(""))
                cmd.Parameters.AddWithValue("@email", DBNull.Value);
            else
            cmd.Parameters.Add("@email" ,ml);

            if(ad.Equals(""))
                cmd.Parameters.AddWithValue("@address", DBNull.Value);
            else
            cmd.Parameters.Add("@address" ,ad);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


            Response.Redirect("~/ViewProfile.aspx") ;

        }
    }
}