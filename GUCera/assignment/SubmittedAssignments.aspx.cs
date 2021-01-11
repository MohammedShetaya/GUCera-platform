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

namespace GUCera.assignment
{
	public partial class SubmittedAssignments : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			if (Session["userID"] == null)
			{
				Response.Redirect("~/SignIn.aspx");
			}
			else {


				string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
				SqlConnection conn = new SqlConnection(connString);

				SqlCommand cmd = new SqlCommand("select * from StudentTakeAssignment", conn);
				cmd.CommandType = CommandType.Text ;

				conn.Open();

				SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

				while (rdr.Read()) {

					string type = rdr.GetString(rdr.GetOrdinal("assignmenttype"));
					int num = rdr.GetInt32(rdr.GetOrdinal("assignmentNumber"));
					int cid = rdr.GetInt32(rdr.GetOrdinal("cid"));

					assignments.Controls.Add(new Literal() { Text = "<div class = \"row\">"});
					//< button type = "button" class="btn btn-light">Light</button>
					Button b = new Button();
					b.Text = type + " " + num;
					b.CssClass = "btn btn-light btn-lg btn-block";
					b.ID = type + "-" + num + "-"+ cid ;
					b.Click += new EventHandler(assign_Click);


					assignments.Controls.Add(b);
					assignments.Controls.Add(new Literal() { Text = "</div>" });

				}


			}

			

		}

		protected void assign_Click(object sender, EventArgs e)
		{
			Button b = (Button)sender;
			string id = b.ID;

			string[] assign = id.Split('-');

			string type = assign[0];
			int num = int.Parse(assign[1]);
			int cid = int.Parse(assign[2]);
			Response.Redirect("~/assignment/StudentViewAssign.aspx?type="+type +"&num="+num + "&cid=" + cid);
		}

	}
}