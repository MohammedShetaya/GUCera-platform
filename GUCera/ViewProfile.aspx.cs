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
                else if (Session["userType"].Equals(1))
                {
                    cmd = new SqlCommand("ViewInstructorProfile", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@instrId", Session["userID"]);
                }
                else
                {
                    cmd = new SqlCommand("select * from Users where id = @adminId", conn);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add(new SqlParameter("adminId", Session["userID"]));
                }

                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                string fn = "";
                string ln = "";
                string id = "";
                string ps = "";
                string gp = "";
                string ra = "";
                string ge = "";
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
                    else if (Session["userType"].Equals(1))
                        ra = rdr.GetDecimal(rdr.GetOrdinal("rating")) +"" ;

                    bool d = (bool)rdr.GetBoolean(rdr.GetOrdinal("gender")); 
                    if (!d) 
                        ge = "Male";
                    else
                        ge = "Female";
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
                Label l7 = new Label();
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
                else if (Session["userType"].Equals(1))
                {
                    instructorOrStudent.Text = "Rating :";
                    l4.Text = ra;
                    userTy.Text = "Instructor";
                }
                else
                {
                    userTy.Text = "Admin";
                }
                l5.Text = em;
                l6.Text = ad;
                l7.Text = ge;
                userType.Controls.Add(userTy) ; 
                fullName.Controls.Add(l1);
                userID.Controls.Add(l2);
                password.Controls.Add(l3);

                inOrSt.Controls.Add(instructorOrStudent); 
                inOrStValue.Controls.Add(l4);
                gender.Controls.Add(l7); 
                email.Controls.Add(l5);
                address.Controls.Add(l6);

                //return all phone numbers and diplay them

                rdr.Close();
                conn.Close();

                SqlCommand cmd1 = new SqlCommand("select mobileNumber from UserMobileNumber where id = @id", conn);
                cmd1.CommandType = CommandType.Text;
                cmd1.Parameters.Add(new SqlParameter("id", Session["userID"]));

                conn.Open();
                rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);

                while (rdr.Read()) {
                    string s = rdr.GetString(rdr.GetOrdinal("mobileNumber")) ;
                    Label m = new Label();
                    Panel n = new Panel();
                    m.Text = s;
                    n.Controls.Add(m);
                    phoneNumbers.Controls.Add(n);
                }

                //check if the user is student

                rdr.Close();
                conn.Close();


                if(Session["userType"].Equals(1))
                {
                    addCard.CssClass = "invisible" ;
                    certifiedCourses.CssClass = "invisible";
                }
                else if (Session["userType"].Equals(0))
                {
                        addCourse.CssClass = "invisible";
                }
                else
                {
                    addCard.CssClass = "invisible";
                    certifiedCourses.CssClass = "invisible";
                    addCourse.CssClass = "invisible";
                    isAdmin.Controls.Clear();
                }


            }
            else
                Response.Redirect("~/SignIn.aspx");
        }

        protected void addNumber_Click(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                Response.Redirect("~/AddTelephoneNumber.aspx");
            }
            else {
                Response.Redirect("~/SignIn.aspx");
            }
        }

        protected void addCreditCard_Click(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                Response.Redirect("~/student/AddCreditCard.aspx");
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }
        protected void CertifiedCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Course/certifiedCourses.aspx");
        }

        protected void addCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/instructor/InstructorAddCourse.aspx");
        }
    }
}