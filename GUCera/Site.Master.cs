using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUCera
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                Label l1 = new Label();
                l1.Text = Session["firstName"] + " " + Session["lastName"]+"  ("+Session["userID"]+")";
                profile.Controls.Add(l1);

                if (Session["usertype"].Equals(0))
                {
                    nonAccepted.Controls.Clear();
                    all.Controls.Clear();
                    DefineAssignment.Controls.Clear();
                    ShowSubmittedAssignments.Controls.Clear();
                    IssuePromo.Controls.Clear();
                    CreatePromo.Controls.Clear();

                }
                else if (Session["usertype"].Equals(1))
                {
                    progress.Controls.Clear();
                    nonAccepted.Controls.Clear();
                    all.Controls.Clear();
                    available.Controls.Clear();
                    IssuePromo.Controls.Clear();
                    CreatePromo.Controls.Clear();
                }
                else
                {
                    progress.Controls.Clear();
                    available.Controls.Clear();
                    DefineAssignment.Controls.Clear();
                    ShowSubmittedAssignments.Controls.Clear();
                    
                }

            }
            else
            {
                progress.Controls.Clear();
                nonAccepted.Controls.Clear();
                all.Controls.Clear();
                available.Controls.Clear();
                DefineAssignment.Controls.Clear();
                ShowSubmittedAssignments.Controls.Clear();
                IssuePromo.Controls.Clear();
                CreatePromo.Controls.Clear();
                logoutPanel.CssClass = "invisible";
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["userID"] = null;
            Session["firstName"] = null;
            Session["lastName"] = null;
            Session["userType"] = null; 
            Response.Redirect("~/Default.aspx"); 
        }

        protected void signUp_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
                signUp.CssClass = "invisible" ;
        }

        protected void signIn_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
                signIn.CssClass = "invisible";

        }
        

        

       
        

    }
}