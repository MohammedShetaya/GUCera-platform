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
    public partial class AddCreditCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }

        protected void addCard_Click(object sender, EventArgs e)
        {
            string nam = name.Text;
            string num = cardNumber.Text;
            string mon = ccmonth.SelectedValue;
            string yer = ccyear.SelectedValue;
            string cv  = cvv.Text;

            
            DateTime date = new DateTime(int.Parse(yer) , int.Parse(mon) , 30 );
        
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd = new SqlCommand("addCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@sid" , Session["userID"]);
            cmd.Parameters.Add("@number", num);
            cmd.Parameters.Add("@cardHolderName", nam) ;
            cmd.Parameters.Add("@expiryDate", date);
            cmd.Parameters.Add("cvv", cv) ;

            try
            {

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/ViewProfile.aspx");
            }

            catch (Exception ex)
            {
                if (ex is SqlException)
                {
                    Label l = new Label();

                    l.Text = "Incorrect Card Information or Card already Exists";
                    incorrectInput.Controls.Add(l);
                }
                else
                {
                }
            }
        }
    }
}