using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace OnlineShoeWebsite.AdminDashBoard
{
    public partial class AddProduct : System.Web.UI.Page
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
                BindBrand();
                BindCategory();
                BindGender();
                BindSize();
                // lblimgError.Visible = false;
            }
        }

        private void BindBrand()
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("select * from tblBrand", con);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ddlBrand.DataSource = dt;
                        ddlBrand.DataTextField = "brandName";
                        ddlBrand.DataValueField = "brandId";
                        ddlBrand.DataBind();
                        ddlBrand.Items.Insert(0, new ListItem("Select", "0"));
                    }

                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Brand Not Inserted')</script>");
            }
        }

        private void BindCategory()
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("select * from tblCategory", con);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ddlCategory.DataSource = dt;
                        ddlCategory.DataTextField = "CatName";
                        ddlCategory.DataValueField = "CatId";
                        ddlCategory.DataBind();
                        ddlCategory.Items.Insert(0, new ListItem("Select", "0"));
                    }

                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Category Not Inserted')</script>");
            }
        }

        private void BindSize()
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("select * from tblSize", con);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ddlSize.DataSource = dt;
                        ddlSize.DataTextField = "SizeNumber";
                        ddlSize.DataValueField = "SizeId";
                        ddlSize.DataBind();
                        ddlSize.Items.Insert(0, new ListItem("Select", "0"));
                    }

                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Size Not Inserted')</script>");
            }
        }

        private void BindGender()
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("select * from tblGender", con);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ddlGender.DataSource = dt;
                        ddlGender.DataTextField = "GenderName";
                        ddlGender.DataValueField = "GenderId";
                        ddlGender.DataBind();
                        ddlGender.Items.Insert(0, new ListItem("Select", "0"));
                    }

                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Gender Not Inserted')</script>");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string img_path = Server.MapPath("Images/");
            string fileName = Path.GetFileName(FileUpload1.FileName);
            string extention = Path.GetExtension(fileName);
            HttpPostedFile postfile = FileUpload1.PostedFile;
            int size = postfile.ContentLength;

            if (FileUpload1.HasFile)
            {

                if (extention.ToLower() == ".jpg" || extention.ToLower() == ".jpeg" || extention.ToLower() == ".png" || extention.ToLower() == ".webp")
                {
                    if (size <= 1000000)
                    {

                        using (con = new SqlConnection(CS))
                        {
                            FileUpload1.SaveAs(img_path + fileName); //for saving image in folder
                            string img_path2 = "/AdminDashboard/Images/" + fileName; //for saving images in database


                            cmd = new SqlCommand("spAddProduct", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@PName", txtPName.Text);
                            cmd.Parameters.AddWithValue("@PShortName", txtPShortName.Text);
                            cmd.Parameters.AddWithValue("@PPrice", txtPPrice.Text);
                            cmd.Parameters.AddWithValue("@PSelling_Price", txtPSPrice.Text);
                            cmd.Parameters.AddWithValue("@PQuanity", txtQty.Text);
                            cmd.Parameters.AddWithValue("@BrandId", ddlBrand.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("@CatId", ddlCategory.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("@SizeId", ddlSize.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("@GenderId", ddlGender.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("@PImage", img_path2);
                            cmd.Parameters.AddWithValue("@PDescription", txtDesc.Text);
                            con.Open();
                            cmd.ExecuteNonQuery();

                            string Message = "Product inserted Successfully";
                            string str_alert_Msg = @"swal.fire({
                            icon: 'success',
                            title:'Great!',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                            ScriptManager.RegisterStartupScript(this, GetType(), "Success", str_alert_Msg, true);
                            Clear();
                            // lblimgError.Visible = false;
                        }

                    }
                    else
                    {
                        // lblimgError.Text = "Image size should be less than 1 MB";
                    }

                }
                else
                {
                    //lblimgError.Text = "Image  should have proper extention";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Image  should have proper extention')", true);

                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please upload image')", true);
                //Response.Redirect("<script>alert('Please upload image')</script>");
                //lblimgError.Text = "Please upload image";
            }

        }


        private void Clear()
        {
            txtPName.Text = "";
            txtPShortName.Text = "";
            txtPPrice.Text = "";
            txtPSPrice.Text = "";
            txtDesc.Text = "";
            ddlBrand.ClearSelection();
            ddlCategory.ClearSelection();
            ddlGender.ClearSelection();
            ddlSize.ClearSelection();


        }
    }
}