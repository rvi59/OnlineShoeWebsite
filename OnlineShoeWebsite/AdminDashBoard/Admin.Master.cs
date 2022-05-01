using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoeWebsite.AdminDashBoard
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (true)
            {
                if (Session["UserNameA"] != null)
                {
                    lbluser.Text = Session["UserNameA"].ToString();
                }
                else
                {
                    Response.Redirect("../Accounts/Login.aspx");
                }
            }
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Accounts/Login.aspx");
        }

        protected void btnLogout1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Accounts/Login.aspx");
        }

    }
}