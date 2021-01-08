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


namespace GUCera.student
{
    public partial class ViewStudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd;
                if (Session["userType"].Equals(0))
                {

                    cmd = new SqlCommand("viewMyProfile", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", Session["userID"]);

                }
                else
                {
                    cmd = new SqlCommand("viewInstructorProfile", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@instrId", Session["userID"]);
                }

                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                string fn = "";
                string ln = "";
                string id = "";
                string ps = "";
                string gp = "";
                string ra = "";
                string em = "";
                string ad = "";

                if (rdr.Read())
                {
                    fn = rdr.GetString(rdr.GetOrdinal("firstName"));
                    ln = rdr.GetString(rdr.GetOrdinal("lastName"));
                    id = rdr.GetInt32(rdr.GetOrdinal("id")) + "";
                    ps = rdr.GetString(rdr.GetOrdinal("password"));
                    if (Session["userType"].Equals(0))
                        gp = rdr.GetDecimal(rdr.GetOrdinal("gpa")) + "";
                    else
                        ra = rdr.GetDecimal(rdr.GetOrdinal("rating")) +"" ; 
                    em = rdr.GetString(rdr.GetOrdinal("email"));
                    ad = rdr.GetString(rdr.GetOrdinal("address"));
                }

                Label l = new Label();
                l.Text = fn + " " + ln;
                profileName.Controls.Add(l);

                Label l1 = new Label();
                Label l2 = new Label();
                Label l3 = new Label();
                Label l4 = new Label();
                Label l5 = new Label();
                Label l6 = new Label();
                Label instructorOrStudent = new Label();
                Label userTy = new Label(); 
                l1.Text = fn + " " + ln;
                l2.Text = id;
                l3.Text = ps;
                if (Session["userType"].Equals(0)) {
                    l4.Text = gp;
                    instructorOrStudent.Text = "GPA :";
                    userTy.Text = "Student"; 
                }
                else {
                    instructorOrStudent.Text = "Rating :";
                    l4.Text = ra;
                    userTy.Text = "Instructor";
                }
                l5.Text = em;
                l6.Text = ad;

                userType.Controls.Add(userTy) ; 
                fullName.Controls.Add(l1);
                userID.Controls.Add(l2);
                password.Controls.Add(l3);

                inOrSt.Controls.Add(instructorOrStudent); 
                inOrStValue.Controls.Add(l4);
                email.Controls.Add(l5);
                address.Controls.Add(l6);


                // handling connected services tab
                Label slide1Label = new Label();
                Label slide2Label = new Label();
                if (Session["userType"].Equals(0))
                {
                    slide1Label.Text = "There are many usefull courses in which you can enroll";
                    slidePanel1.Controls.Add(slide1Label);
                    slideButton1.Text = "Show Courses";

                    slide2Label.Text = "We are offering you powerfull promocodes";
                    slidePanel2.Controls.Add(slide2Label);
                    slideButton2.Text = "Discover Promocodes";
                }
                else
                {

                }
            }
            else
                Response.Redirect("~/SignIn.aspx");
        }
    }
}