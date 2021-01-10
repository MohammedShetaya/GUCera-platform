using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class promocodes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {

                string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(connString);

                SqlCommand cmd = new SqlCommand("viewPromocode", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@sid", Session["userID"]);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                
                available_promo.Controls.Add(new Literal() { Text = "<div class=\"row\">" });
                while (rdr.Read())
                {

                        String promocode = rdr.GetString(rdr.GetOrdinal("code"));


                        DateTime isuue = rdr.GetDateTime(rdr.GetOrdinal("isuueDate"));
                        DateTime expiry = rdr.GetDateTime(rdr.GetOrdinal("expiryDate"));
                        Decimal disc = rdr.GetDecimal(rdr.GetOrdinal("discount"));
                        int adID = rdr.GetInt32(rdr.GetOrdinal("adminId"));
                        
                        Button button = new Button();
                        button.ID = promocode;
                        button.Text = "Use Promo";
                        button.CssClass = "btn btn-primary";
                        button.Click += new EventHandler(ShowPromo_Click);

                        
                        SqlConnection conn1 = new SqlConnection(connString);
                        SqlCommand cmd1 = new SqlCommand("select firstName, lastName from Users where id = @id", conn1);
                        cmd1.CommandType = CommandType.Text;
                        cmd1.Parameters.Add(new SqlParameter("id", adID));
                        conn1.Open();
                        SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
                    String admin = "";
                        if (rdr1.Read())
                        {
                            admin = rdr1.GetString(rdr1.GetOrdinal("firstName")) + rdr1.GetString(rdr1.GetOrdinal("lastName"));
                        }

                        String s = "<div class=\"card\" style=\"width: 18rem;\"><div class=\"card-body\"><h5 class=\"card-title\">" + promocode + "</h5><h6 class=\"card-subtitle mb-2 text-muted\">Issued by: "+admin+"</h6><p class=\"card-text\">This promocode is offering a discount equals to "+disc+" L.E and is available from "+isuue+" to "+expiry+".</p>";

                        available_promo.Controls.Add(new Literal() { Text = "<div class=\"col-3\">" + s });
                        available_promo.Controls.Add(button);
                        available_promo.Controls.Add(new Literal() { Text = "</div></div></div>" });

                    

                    

                    
                }
                available_promo.Controls.Add(new Literal() { Text = "</div>" });


            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }

        protected void ShowPromo_Click(object sender, EventArgs e)
        {

        }

    }
}