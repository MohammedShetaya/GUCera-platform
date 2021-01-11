using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.instructor
{
    public partial class ShowAssignemnts : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userType"].Equals(1))
            {
                String courseName = Request.QueryString["courseName"];
                int courseID = Int32.Parse(Request.QueryString["courseID"]);
                headerText.Controls.Add(new Literal { Text = "Submitted Assigments in "+courseName +" online course." });
                
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("InstructorViewAssignmentsStudents", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@instrId", Session["userId"]);
                cmd.Parameters.Add("@cid", courseID);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);



                while (rdr.Read())
                {
                    int sid = rdr.GetInt32(rdr.GetOrdinal("sid"));
                    int asNumber = rdr.GetInt32(rdr.GetOrdinal("assignmentNumber"));
                    String typ = rdr.GetString(rdr.GetOrdinal("assignmenttype"));
                    String graded = "Graded: ";
                    Decimal grade = -1;
                    try
                    {
                        grade = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                        graded = graded + grade.ToString();
                    }
                    catch
                    {
                        graded = "Ungraded";
                    }

                    Button button = new Button();
                    button.ID = courseID.ToString()+ "_" + asNumber.ToString()+ "_"+typ+"_"+sid.ToString();
                    button.Text = "Grade Assignment";
                    button.CssClass = "btn btn-outline-light btn-sm";
                    button.Click += new EventHandler(GradeAssignment_Click);
                    String s = "<div class=\"col-4\"> <div class=\"card mb-4 text-white bg-secondary\"><img class=\"card-img-top\" src=\"..\\images\\courses.jpg\" alt=\"Course\"/> <div class=\"card-body\"> <h5 class=\"cardTitle\">Assignemnt number: " + asNumber + "</h5><h6 class=\"card-subtitle mb-2 text-light\">"+typ+"</h6><p class=\"card-text\" style = \"height:100px;\">Submitted by Student with ID: " +sid + " and "+ graded + "</p>";
                    Submitted_Assignments.Controls.Add(new Literal() { Text = s });
                    Submitted_Assignments.Controls.Add(button);
                    Submitted_Assignments.Controls.Add(new Literal() { Text = "</div></div></div>" });
                    
                }
                Submitted_Assignments.Controls.Add(new Literal() { Text = "</div>" });
            }
            else
            {
                Response.Redirect("~/Default.aspx");

            }
        }

        protected void GradeAssignment_Click(object sender, EventArgs e)
        {
            Button b = (Button) sender;
            String[] keys = b.ID.Split('_');
            int cid = Int32.Parse(keys[0]);
            int asNumber = Int32.Parse(keys[1]);
            String typ = keys[2];
            String sid = keys[3];
            Response.Redirect("~/instructor/GradeAssignment.aspx?courseID=" + cid.ToString() +"&asNumber=" + asNumber.ToString()+"&typ="+typ+"&sid="+sid);

        }
    }
}