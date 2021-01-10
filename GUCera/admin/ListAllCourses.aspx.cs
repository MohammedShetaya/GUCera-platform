using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GUCera.admin
{
    public partial class ListAllCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand courses = new SqlCommand("availableCourses", conn);
            courses.CommandType = System.Data.CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader sc = courses.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            HtmlGenericControl li;
            while (sc.Read())
            {
                String courseName = sc.GetString(sc.GetOrdinal("name"));
                li = new HtmlGenericControl("a");
                li.Attributes.Add("class", "list-group-item list-group-item-action");
                li.InnerText = courseName;
                list.Controls.Add(li);
            }
        }
    }
}