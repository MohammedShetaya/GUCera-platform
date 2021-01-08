using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                Console.WriteLine(Session["userType"]);
                if (Session["userType"].ToString().Equals("0"))
                {
                    Response.Redirect("~/student/StudentDefault.aspx");
                }
                else if (Session["userType"].ToString().Equals("1"))
                {
                    Response.Redirect("~/instructor/InstructorDefault.aspx");
                }
                else
                {
                    Response.Redirect("~/admin/AdminDefault.aspx");
                }
            }
            
        }
    }
}