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
    public partial class Cart : System.Web.UI.Page
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
                if (Session["UserNameU"] == null)
                {

                    Response.Redirect("../Accounts/Login.aspx");
                }
                else if (Session["UserNameU"] != null && Request.QueryString["PId"] == null)
                {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Cart is Empty')", true);
                    Response.Redirect("../Default.aspx");
                }
                else
                {
                    BindCart();
                    TotalPric();
                }
            }
        }



        private void BindCart()
        {
            int Pid = Convert.ToInt32(Request.QueryString["PId"]);
            int userId = Convert.ToInt32(Session["Uiid"]);
            Session["Pid1"] = userId.ToString();
            using (con = new SqlConnection(CS))
            {

                cmd = new SqlCommand("spViewCart", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("user_Id", userId);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    gvCart.DataSource = dt;
                    gvCart.DataBind();

                }
                else
                {
                    gvCart.Visible = false;
                }
            }
        }


        private void TotalPric()
        {

            int userId = Convert.ToInt32(Session["Uiid"]);

            using (con = new SqlConnection(CS))
            {

                cmd = new SqlCommand("spTotalCart", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("user_Id", userId);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    Label4.Text = Convert.ToString(sdr[0]);
                    Session["totPrice"] = Label4.Text;
                }

            }
        }


        protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (con = new SqlConnection(CS))
            {
                // cmd = new SqlCommand("delete from tblCart where Cartid = @Cartid", con);
                cmd = new SqlCommand("spDelCartItems", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("Pid", Pid);
                cmd.Parameters.AddWithValue("@Cartid", Convert.ToInt32(gvCart.DataKeys[e.RowIndex].Value.ToString()));
                con.Open();
                cmd.ExecuteNonQuery();
                BindCart();
                TotalPric();
            }
        }

        protected void gvCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCart.EditIndex = e.NewEditIndex;
            BindCart();
            TotalPric();
        }

        protected void gvCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCart.EditIndex = -1;
            BindCart();
            TotalPric();
        }

        protected void gvCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (con = new SqlConnection(CS))
            {
                cmd = new SqlCommand("spUpdateCartItems", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd  = new SqlCommand("update tblCart set Quantity = @Quantity where Cartid = @Cartid", con);
                cmd.Parameters.AddWithValue("@Quantity", (gvCart.Rows[e.RowIndex].FindControl("txtQty") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("@Cartid", Convert.ToInt32(gvCart.DataKeys[e.RowIndex].Value.ToString()));

                con.Open();
                cmd.ExecuteNonQuery();
                gvCart.EditIndex = -1;
                BindCart();
                TotalPric();
            }
        }

        protected void linkChk_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }

    }
}