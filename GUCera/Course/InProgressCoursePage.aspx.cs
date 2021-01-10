using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUCera.Course
{
    public partial class InProgressCoursePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userID"] == null)
            {
                Response.Redirect("~/SignIn.aspx");
            }
            else {

                //display the course info 

                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("courseInformation", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                int ID = int.Parse(Request.QueryString["courseID"]) ; 

                cmd.Parameters.Add("@id", ID);

                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (rdr.Read()) {

                    string name = rdr.GetString(rdr.GetOrdinal("name"));
                    int credit = rdr.GetInt32(rdr.GetOrdinal("creditHours"));
                    string disc = rdr.GetString(rdr.GetOrdinal("courseDescription"));
                    string cont = rdr.GetString(rdr.GetOrdinal("content")) ; 

                    courseName.Controls.Add(new Literal() { Text = "<h1>"+ name +"<h1>" });

                    creditHours.Controls.Add(new Literal() { Text = "<p style = \"margin-top:15px \">"+credit +"<p>" });
                    courseDisc.Controls.Add(new Literal() {Text = "<p style=\"padding-bottom:20px; \">"+disc+"<p>" });
                    courseContent.Controls.Add(new Literal() { Text = "<p style=\"padding-bottom:20px; \">" + cont + "<p>" });

                }

                //display assignments to be done 

                rdr.Close();
                conn.Close(); 


                SqlCommand cmd1 = new SqlCommand("viewAssign" , conn);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add(new SqlParameter("@courseId", ID));
                cmd1.Parameters.Add(new SqlParameter("@Sid", Session["userID"]));

                conn.Open();
                
                rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read()) {

                    try
                    {
                        int assignNum = rdr.GetInt32(rdr.GetOrdinal("number"));
                        string assignType = rdr.GetString(rdr.GetOrdinal("type"));
                        string assignCont = rdr.GetString(rdr.GetOrdinal("content"));

                        courseAssignments.Controls.Add(new Literal() { Text = "<div class=\"card\"><div class=\"card-body\"><h5 class=\"card-title\">" + assignType + " " + assignNum + "</h5><p class=\"card-text\">" + assignCont + "</p> <a href=\"#\" class=\"btn btn-outline-info\">submit assign</a></div></div>" });
                    }
                    catch (Exception ex) {
                        
                        continue;
                    }
                }

            }

        }
    }
}