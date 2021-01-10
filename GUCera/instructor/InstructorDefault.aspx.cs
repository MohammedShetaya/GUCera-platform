using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.instructor
{
    public partial class InstructorDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {

            }
            else
            {
                Response.Redirect("~/SignIN.aspx");
            }
        }
        protected void AddCoursesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/instructor/InstructorAddCourse.aspx");
        }
    }
}