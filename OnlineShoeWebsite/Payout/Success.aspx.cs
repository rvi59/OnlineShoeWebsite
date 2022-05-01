
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace OnlineShoeWebsite.Payout
{
    public partial class Success : System.Web.UI.Page
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

                GetData1();
                DelCartItem();
            }

        }


        private void GetData1()
        {
            lblOrderId.Text = Session["orderId"].ToString();
            lblEmail.Text = Session["userMail"].ToString();
            lblMobile.Text = Session["mob"].ToString();
            lblAddress.Text = Session["addr"].ToString();
            string userId1 = Session["uid1"].ToString();
            lblName.Text = Session["uname1"].ToString();
            lblgdTotal.Text = Session["totPrice"].ToString();
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("spBindProdInvoice", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("user_Id", userId1);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {

                        gvProdInfo.DataSource = dt;
                        gvProdInfo.DataBind();

                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void DelCartItem()
        {

            string userId1 = Session["uid1"].ToString();
            using (con = new SqlConnection(CS))
            {

                cmd = new SqlCommand("spDelCartItemsafterPay", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_Id", userId1);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }
    }
}