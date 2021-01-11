using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.admin
{
    public partial class CreateNewPromoCode : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userType"].Equals(2))
            {
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void addCard_Click(object sender, EventArgs e)
        {
            try
            {
                String num = CodeNum.Text;
                Decimal perc = Decimal.Parse(DiscPerc.Text);
                DateTime expireDate = DateTime.Parse(expire.Text);
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("AdminCreatePromocode", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@adminId", Session["userID"]);
                cmd.Parameters.Add("@code", num);
                cmd.Parameters.Add("@isuueDate", DateTime.Today);
                cmd.Parameters.Add("@expiryDate", expireDate);
                cmd.Parameters.Add("@discount", perc);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception ex)
            {
                Label l = new Label();
                l.Text = "Incorrect Promo Code Information or PromoCode already exists";
                incorrectInput.Controls.Add(l);
            }
        }
    }
}