using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.instructor
{
	public partial class IssueCertificate : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			if (Session["userID"] != null && Session["userType"].Equals(1))
			{

				int cid = int.Parse(Request.QueryString["courseID"]);
				string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
				SqlConnection conn = new SqlConnection(connString);

				SqlCommand cmd = new SqlCommand("select * from Student S inner join Users U on S.id = U.id inner join StudentTakeCourse T on U.id = T.sid where T.cid = @cou and T.grade is not null", conn);
				cmd.CommandType = CommandType.Text ;
				cmd.Parameters.Add(new SqlParameter("cou", cid ));

				try
				{
					conn.Open();
					SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
					while (rdr.Read())
					{
						int sid = rdr.GetInt32(rdr.GetOrdinal("id"));
						string fn = rdr.GetString(rdr.GetOrdinal("firstName"));
						string ln = rdr.GetString(rdr.GetOrdinal("lastName"));
						ListItem l = new ListItem();
						l.Text = fn + " " + ln + "(" + sid + ")";
						l.Value = cid + "-" + sid + "-" + Session["userID"];
						sName.Items.Add(l);


						/*

						*/
					}
					rdr.Close();
					conn.Close();
				}
				catch (Exception ex) {
					Label l = new Label();
					l.Text = "Certificate not issued try again";
					incorrect.Controls.Add(l);

 				}

			}
			else {
				Response.Redirect("~/SignIn.aspx");
			}

		}

		protected void addCertific_Click(object sender, EventArgs e)
		{
			string data = sName.SelectedItem.Value;
			string[] item = data.Split('-');
			int cid = int.Parse(item[0]);
			int sid = int.Parse(item[1]);
			
			DateTime now = DateTime.Now;


			string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
			SqlConnection conn = new SqlConnection(connString);

			SqlCommand cc = new SqlCommand("InstructorIssueCertificateToStudent", conn);
			cc.CommandType = CommandType.StoredProcedure;
			cc.Parameters.Add("@cid", cid);
			cc.Parameters.Add("@sid", sid);
			cc.Parameters.Add("insId", Session["userID"]);
			cc.Parameters.Add("issueDate", now);

			conn.Open();
			cc.ExecuteNonQuery();
			Label l = new Label();
			l.Text = "Certificate Issued to student with id " + sid;
			done.Controls.Add(l);

		}
	}
}