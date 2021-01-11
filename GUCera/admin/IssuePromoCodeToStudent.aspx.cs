using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera.admin
{
    public partial class IssuePromoCodeToStudent : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null && Session["userType"].Equals(2))
            {
                promo.Items.Clear();
                student.Items.Clear();
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd =
                    new SqlCommand("select code,expiryDate,discount from Promocode where adminId = @adminId", conn);
                SqlCommand cmd2 = new SqlCommand("AdminListAllStudents", conn);
                cmd.CommandType = CommandType.Text;
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("adminId", Session["userID"]));
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String code = rdr.GetString(rdr.GetOrdinal("code"));
                    Decimal discount = rdr.GetDecimal(rdr.GetOrdinal("discount"));
                    DateTime date = rdr.GetDateTime(rdr.GetOrdinal("expiryDate"));
                    if (date <= DateTime.Now)
                        continue;
                    ListItem l = new ListItem();
                    l.Text = "PromoCode: "+code + " (Discount: " + discount + "%)";
                    l.Value = code;
                    promo.Items.Add(l);
                }

                rdr = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String firstName = rdr.GetString(rdr.GetOrdinal("firstName"));
                    String lastName = rdr.GetString(rdr.GetOrdinal("lastName"));
                    String id = rdr.GetInt32(rdr.GetOrdinal("id")).ToString();
                    ListItem l = new ListItem();
                    l.Text = "id: "+id + " (Name: " + firstName + " " + lastName + ")";
                    l.Value = id;
                    student.Items.Add(l);
                }

                conn.Close();
                rdr.Close();
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
                String code = promo.SelectedItem.Value;
                int id = Int32.Parse(student.SelectedItem.Value);
                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("AdminIssuePromocodeToStudent", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@sid", id);
                cmd.Parameters.Add("@pid", code);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception ex)
            {
                Label l = new Label();
                l.Text = "ERROR";
                incorrectInput.Controls.Add(l);
            }
        }
    }
}