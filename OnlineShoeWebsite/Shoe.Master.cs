using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoeWebsite
{
    public partial class Shoe : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserNameU"] != null)
            {
                HpRegis.Visible = false;
                HpLog.Visible = false;
                HpCart.Visible = true;
                btnLogout.Visible = true;
                HpUser.Text = Session["UserNameU"].ToString();
            }
            else
            {
                HpRegis.Visible = true;
                HpLog.Visible = true;
                btnLogout.Visible = false;
                HpCart.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Accounts/Login.aspx");
        }

        protected void HpCart_Click(object sender, EventArgs e)
        {
            //string a = Request.QueryString["PId"].ToString();

            Response.Redirect("~/Payout/Cart.aspx");
        }
    }
}