﻿using System;
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
                if (Session["userType"].Equals(0))
                {
                    Response.Redirect("~/student/StudentDefault.aspx");
                }
                else if (Session["userType"].Equals(1))
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