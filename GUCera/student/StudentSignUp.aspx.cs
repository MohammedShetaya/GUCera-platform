﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUCera.Student
{
    public partial class StudentSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUp_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("studentRegister", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string fName = firstName.Text ;
            string lName = lastName.Text ;
            string pass = password.Text ;
            string mail = email.Text;
            Boolean gend = female.Checked ;  
            string add = address.Text ;

            try
            {
                cmd.Parameters.Add("@first_name", fName);
                cmd.Parameters.Add("@last_name", lName);
                cmd.Parameters.Add("@password", pass);
                cmd.Parameters.Add("@email", mail);
                cmd.Parameters.Add("@gender", gend);
                cmd.Parameters.Add("@address", add);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception ex) {
                if (ex is SqlException)
                {
                    Label l = new Label();
                    l.Text = "Email already exists or Incorrect data submitted please try again" ;
                    incorrectInput.Controls.Add(l);
                }
                else { 
                }
            }
            
        }
    }
}