using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUCera.assignment
{
	public partial class StudentViewAssign : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["userID"] == null)
			{
				Response.Redirect("~/SignIn.aspx");
			}
			else
			{

				string type = Request.QueryString["type"];
				int num = int.Parse(Request.QueryString["num"]);
				int cid = int.Parse(Request.QueryString["cid"]);

				string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
				SqlConnection conn = new SqlConnection(connString);

				SqlCommand cmd = new SqlCommand("select * from Assignment A where A.cid = @ci and A.number = @nu and A.type = @ty", conn);
				cmd.CommandType = CommandType.Text;
				cmd.Parameters.Add(new SqlParameter("ci" , cid));
				cmd.Parameters.Add(new SqlParameter("nu" , num));
				cmd.Parameters.Add(new SqlParameter("ty" , type));

				conn.Open();

				SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

				if (rdr.Read())
				{
					string cont = rdr.GetString(rdr.GetOrdinal("content"));
					int full = rdr.GetInt32(rdr.GetOrdinal("fullGrade"));
					decimal weigh = rdr.GetDecimal(rdr.GetOrdinal("weight"));
					string dead = rdr.GetValue(rdr.GetOrdinal("deadline")).ToString();

					Label l1 = new Label();
					Label l2 = new Label();
					Label l3 = new Label();
					Label l4 = new Label();
					Label l5 = new Label();

					l1.Text = type + " " + num;
					l2.Text = dead ;
					l3.Text = weigh +"";
					l4.Text = full +"";
					l5.Text = cont ; 


					assignTitle.Controls.Add(l1);
					deadline.Controls.Add(l2);
					weight.Controls.Add(l3);
					fullGrade.Controls.Add(l4);
					content.Controls.Add(l5);



				}

				rdr.Close();
				conn.Close();

				SqlCommand cmd1 = new SqlCommand("viewAssignGrades" , conn) ;
				cmd1.CommandType = CommandType.StoredProcedure;
				cmd1.Parameters.Add("@assignnumber" , num ) ;
				cmd1.Parameters.Add("@assignType" , type );
				cmd1.Parameters.Add("@cid" , cid );
				cmd1.Parameters.Add("@sid" , Session["userID"]);
				
				SqlParameter grade =  cmd1.Parameters.Add("@assignGrade" , SqlDbType.Int ) ;
				grade.Direction = ParameterDirection.Output;

				conn.Open();
				cmd1.ExecuteNonQuery();
				conn.Close();


				if (grade.Value.Equals(DBNull.Value))
					assignGrade.Text = "not yet";
				else
				assignGrade.Text = grade.Value + "";



			}

		}
	}
}