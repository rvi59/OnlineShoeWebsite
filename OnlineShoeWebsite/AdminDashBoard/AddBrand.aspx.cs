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
    public partial class AddBrand : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    BindCategory();
            //    //BindSize();
            //}
        }


        //public void BindCategory()
        //{
        //    try
        //    {
        //        using (con = new SqlConnection(CS))
        //        {
        //            cmd = new SqlCommand("select * from tblCategory", con);
        //            sda = new SqlDataAdapter(cmd);
        //            dt = new DataTable();
        //            sda.Fill(dt);
        //            if (dt.Rows.Count > 0)
        //            {
        //                ddlCat.DataSource = dt;
        //                ddlCat.DataTextField = "CatName";
        //                ddlCat.DataValueField = "CatId";
        //                ddlCat.DataBind();
        //                ddlCat.Items.Insert(0, new ListItem("Select Category", "0"));

        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        Response.Write("<script>alert('Category Not Inserted')</script>");

        //    }
        //}



        //public void BindSize()
        //{
        //    try
        //    {
        //        using (con = new SqlConnection(CS))
        //        {
        //            cmd = new SqlCommand("select * from tblSize", con);
        //            sda = new SqlDataAdapter(cmd);
        //            dt = new DataTable();
        //            sda.Fill(dt);
        //            if (dt.Rows.Count > 0)
        //            {
        //                ddlSize.DataSource = dt;
        //                ddlSize.DataTextField = "SizeNumber";
        //                ddlSize.DataValueField = "SizeId";
        //                ddlSize.DataBind();
        //                ddlSize.Items.Insert(0, new ListItem("Select Size", "0"));

        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {

        //        Response.Write("error" + e);

        //    }
        //}



        private void Clear()
        {
            txtbrand.Text = "";
            //ddlCat.ClearSelection();
            //ddlSize.ClearSelection();
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("spAddBrand", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@brandName", txtbrand.Text);
                    //cmd.Parameters.AddWithValue("@CatId", ddlCat.SelectedItem.Value);
                    //cmd.Parameters.AddWithValue("@SizeId", ddlSize.SelectedItem.Value);
                    con.Open();
                    cmd.ExecuteNonQuery();


                    //******************Sweet Alert****************************
                    //Response.Write("<script>alert('Brand Inserted Successfully')</script>");
                    // string Message = "Your Support Reference No. is : <b> " + Convert.ToString(dt.Rows[0]["flag"]) + " </b> which has been sent on your email. Kindly check the status of your request within next 5 days.";
                    //string Message = "Data inserted";
                    //string str_alert_Msg = @"swal({
                    //        type: 'success',
                    //        title:'Good job!',
                    //        text: '" + Message + @"',                                                                 
                    //        html: true
                    //    });";

                    //******************Sweet Alert 2********************************
                    string Message = "Brand inserted Successfully";
                    string str_alert_Msg = @"swal.fire({
                            icon: 'success',
                            title:'Great!',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                    ScriptManager.RegisterStartupScript(this, GetType(), "Success", str_alert_Msg, true);
                    Clear();
                }
            }
            catch (Exception)
            {
                //Response.Write("error"+e);
            }
        }


    }
}