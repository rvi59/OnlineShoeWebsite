using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
using System.Data;

namespace OnlineShoeWebsite.AdminDashBoard
{
    public partial class AddCategory : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            using (con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("spAddCategory", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CatName", txtcategory.Text);

                con.Open();
                int a = cmd.ExecuteNonQuery();

                if (a > 0)
                {
                    Response.Write("<script langauge='text/javascript'>alert('Success');</script>");
                }
                else
                {
                    Response.Write("<script langauge='text/javascript'>alert('Failed');</script>");
                }
            }
        }

    }
}