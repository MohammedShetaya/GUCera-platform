using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.student
{
    public partial class StudentDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void availableCourseButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Course/availableCourses.aspx");
        }

        protected void promocodesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/promocodes.aspx");
        }
    }
}