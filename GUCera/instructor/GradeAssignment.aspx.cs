using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.instructor
{
    public partial class GradeAssignment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null || !Session["userType"].Equals(1))
                Response.Redirect("~/Default.aspx");
        }

        protected void gradeAssignments_Click(object sender, EventArgs e)
        {
            int courseID = Int32.Parse(Request.QueryString["courseID"]);
            int asNumber = Int32.Parse(Request.QueryString["asNumber"]);
            String typ = Request.QueryString["typ"];
            int sid = Int32.Parse(Request.QueryString["sid"]);
            
            Decimal grd = Decimal.Parse(grade.Text);
            
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cc = new SqlCommand("select fullGrade from Assignment  where cid = @courseID and type = @typ and number = @num", conn);
            cc.CommandType = CommandType.Text;
            cc.Parameters.Add(new SqlParameter("courseID" , courseID ));
            cc.Parameters.Add(new SqlParameter("typ" , typ));
            cc.Parameters.Add(new SqlParameter("num" , asNumber));

            conn.Open();

            SqlDataReader rdr = cc.ExecuteReader(CommandBehavior.CloseConnection);

            if (rdr.Read()) {

                int fullGrade = rdr.GetInt32(rdr.GetOrdinal("fullGrade"));

                rdr.Close();
                conn.Close();


                if (fullGrade >= grd)
                {

                    SqlCommand cmd = new SqlCommand("InstructorgradeAssignmentOfAStudent", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@instrId", Session["userId"]);
                    cmd.Parameters.Add("@sid", sid);
                    cmd.Parameters.Add("@cid", courseID);
                    cmd.Parameters.Add("@assignmentNumber", asNumber);
                    cmd.Parameters.Add("@type", typ);
                    cmd.Parameters.Add("@grade", grd);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        SqlCommand cmd1 = new SqlCommand("select cid , number , type from Assignment F where F.cid = @courseID  Except (select A.cid , A.number , A.type from Assignment A inner join StudentTakeAssignment T on A.cid = T.cid and A.number = T.assignmentNumber and A.type = T.assignmenttype where T.sid = @stu and T.cid = @cou and T.grade is not null) ", conn);
                        cmd1.Parameters.Add(new SqlParameter("courseID" , courseID ));
                        cmd1.Parameters.Add(new SqlParameter("stu" , sid ));
                        cmd1.Parameters.Add(new SqlParameter("cou" ,courseID));

                        conn.Open();

                        rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
                        
                        if (!rdr.HasRows) {
                        
                            SqlCommand cmd2 = new SqlCommand("calculateFinalGrade" , conn );
                            cmd2.CommandType = CommandType.StoredProcedure;

                            cmd2.Parameters.Add("@cid" , courseID ) ;
                            cmd2.Parameters.Add("@sid" , sid);
                            cmd2.Parameters.Add("insId" , Session["userID"]);

                            cmd2.ExecuteNonQuery();

                            
                        }
                        rdr.Close();
                        conn.Close();

                        Response.Redirect("~/Default.aspx");

                    }
                    catch (Exception exception)
                    {
                        Label l = new Label();
                        l.Text = "Please put an appropriate grade.";
                        Panel1.Controls.Add(l);
                    }
                }
                else {
                    Label l = new Label();
                    l.Text = "the full grade is " + fullGrade ;
                    Panel1.Controls.Add(l);
                }
                

            }


        }
    }
}