using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace OnlineShoeWebsite.AdminDashBoard
{
    public partial class SizeList : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;

        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateSize();
            }
        }

        private void PopulateSize()
        {
            using (con = new SqlConnection(CS))
            {
                string q = "select * from tblSize";
                cmd = new SqlCommand(q, con);
                sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvSize.DataSource = dt;
                    gvSize.DataBind();
                }
            }
        }

        protected void gvSize_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Size ID";
                e.Row.Cells[1].Text = "Size Number";
            }
        }
    }
}