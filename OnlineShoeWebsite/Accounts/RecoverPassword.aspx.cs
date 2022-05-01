using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace OnlineShoeWebsite.Accounts
{
    public partial class RecoverPassword : System.Web.UI.Page
    {

        SqlConnection con;

        SqlDataAdapter sda;
        DataTable dt = new DataTable();
        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;
        string Guid;
        int uid;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (con = new SqlConnection(CS))
            {
                Guid = Request.QueryString["id"];
                if (Guid != null)
                {

                    SqlCommand cmd = new SqlCommand("spRecoverPass", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", Guid);
                    con.Open();
                    sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    uid = Convert.ToInt32(dt.Rows[0][1]);
                }
                else
                {
                    if (dt.Rows.Count > 0)
                    {

                    }
                    else
                    {
                        string Message = "Your Password link has expired.. try again.";
                        string str_alert_Msg = @"swal.fire({
                            icon: 'error',
                            title:'Retry again',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Failed", str_alert_Msg, true);

                        Response.Redirect("Login.Aspx");
                    }


                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            //spUpdatePass
            using (con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spUpdatePass", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_Pass", txtnpass.Text);
                cmd.Parameters.AddWithValue("@user_Id", uid);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Password Reset Successfully')</script>");

                Response.Redirect("Login.aspx");
            }
        }

    }
}