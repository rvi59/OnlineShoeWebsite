using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace OnlineShoeWebsite
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt = new DataTable();
        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInfo();
            }
        }


        private void BindInfo()
        {
            if (Request.QueryString["PId"] != null)
            {
                int Pid = Convert.ToInt32(Request.QueryString["PId"]);
                Session["Pid1"] = Pid.ToString();
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("spSingleDetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Pid", Pid);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlDetails.DataSource = dt;
                        dlDetails.DataBind();
                    }
                }
            }
        }

        protected void lbCart_Click(object sender, EventArgs e)
        {
            int Pid = Convert.ToInt32(Request.QueryString["PId"]);
            int userId = Convert.ToInt32(Session["Uiid"]);

            if (Session["UserNameU"] == null || Session["Uiid"] == null)
            {
                Response.Redirect("Accounts/Login.aspx");
            }

            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("spInsertCart", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Quantity", txtQty.Text);
                    cmd.Parameters.AddWithValue("@user_Id", userId);
                    cmd.Parameters.AddWithValue("@PId", Pid);
                    Session["PID"] = Pid.ToString();
                    con.Open();
                    cmd.ExecuteNonQuery();

                    Response.Redirect("Payout/Cart.aspx");

                }
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex);
            }

        }





    }
}