using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace OnlineShoeWebsite.AdminDashBoard
{
    public partial class BrandList : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateBrand();
            }
        }

        private void PopulateBrand()
        {
            using (con = new SqlConnection(CS))
            {
                cmd = new SqlCommand("spShowBrandList", con);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);

                //sda = new SqlDataAdapter("Select * from tblBrand", con);
                dt = new DataTable();
                sda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                gvBrand.DataSource = dt;
                gvBrand.DataBind();
            }
        }


        protected void gvBrand_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Brand ID";
                e.Row.Cells[1].Text = "Brand Name";


            }
        }

    }
}