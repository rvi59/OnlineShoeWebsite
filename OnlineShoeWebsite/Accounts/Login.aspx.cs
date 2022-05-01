using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoeWebsite.Accounts
{
    public partial class Login : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["email"] != null && Request.Cookies["upass"] != null)
                {
                    txtEmail.Text = Request.Cookies["email"].Value;
                    txtPass.Text = Request.Cookies["upass"].Value;

                    ChkRem.Checked = true;
                }
            }
        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spLoginUser", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@user_Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@user_Pass", txtPass.Text);

                con.Open();
                //SqlDataReader sda = cmd.ExecuteReader();

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {


                    if (ChkRem.Checked)
                    {
                        Response.Cookies["email"].Value = txtEmail.Text;
                        Response.Cookies["upass"].Value = txtPass.Text;

                        Response.Cookies["email"].Expires = DateTime.Now.AddHours(2);
                        Response.Cookies["upass"].Expires = DateTime.Now.AddHours(2);
                    }
                    else
                    {
                        Response.Cookies["email"].Expires = DateTime.Now.AddHours(-1);
                        Response.Cookies["upass"].Expires = DateTime.Now.AddHours(-1);
                    }


                    string Utype = dt.Rows[0][5].ToString().Trim();
                    string UName = dt.Rows[0][1].ToString().Trim();
                    string Uiid = dt.Rows[0][0].ToString().Trim();

                    if (Utype == "user")
                    {
                        Session["UserNameU"] = UName.ToString();
                        Session["Uiid"] = Uiid.ToString();
                        Response.Redirect("../Default.aspx");
                    }
                    if (Utype == "admin")
                    {
                        Session["UserNameA"] = UName.ToString();
                        Response.Redirect("../AdminDashboard/DashBoard.aspx");
                    }


                }
                else
                {
                    if (txtEmail.Text.Length == 0)
                    {
                        string Message = "Email Cannot be empty";
                        string str_alert_Msg = @"swal.fire({
                            icon: 'error',
                            title:'Error!',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Failed", str_alert_Msg, true);
                    }

                    if (txtPass.Text.Length == 0)
                    {
                        string Message = "Password Cannot be empty";
                        string str_alert_Msg = @"swal.fire({
                            icon: 'error',
                            title:'Error!',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Failed", str_alert_Msg, true);
                    }
                }


            }
        }


    }
}