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
    public partial class CategoryList : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;

        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCategory();
            }
        }


        private void PopulateCategory()
        {
            using (con = new SqlConnection(CS))
            {
                string q = "select * from tblCategory";
                cmd = new SqlCommand(q, con);
                sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvCategory.DataSource = dt;
                    gvCategory.DataBind();
                }

            }
        }

        protected void gvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Category ID";
                e.Row.Cells[1].Text = "Category Name";
            }
        }



    }
}