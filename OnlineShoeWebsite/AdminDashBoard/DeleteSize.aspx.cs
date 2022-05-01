using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineShoeWebsite.AdminDashBoard
{
    public partial class DeleteSize : System.Web.UI.Page
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
                lbl1.Visible = false;
                btnDel.Visible = false;
                //string Productid = Request.QueryString["PId"];
                //Session["Pid"] = Productid.ToString();
                //EditData();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("select SizeNumber from tblSize where SizeId = @Pid", con);
                    cmd.Parameters.AddWithValue("@Pid", txtId.Text);
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        GV1.DataSource = dt;
                        GV1.DataBind();
                        lbl1.Visible = true;
                        btnDel.Visible = true;
                    }
                    else
                    {
                        string Message = "Size ID doesnot exist";
                        string str_alert_Msg = @"swal.fire({
                            icon: 'error',
                            title:'Not Found!',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Error", str_alert_Msg, true);
                        GV1.DataSource = null;
                        GV1.DataBind();
                        lbl1.Visible = false;
                        btnDel.Visible = false;
                    }


                }
            }
            catch (Exception e1)
            {

                Response.Write(e1.ToString());
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            btnDel.Visible = true;
            try
            {
                using (con = new SqlConnection(CS))
                {

                    cmd = new SqlCommand("delete from tblSize where SizeId = @Pid", con);
                    cmd.Parameters.AddWithValue("@Pid", txtId.Text);
                    con.Open();
                    int a = cmd.ExecuteNonQuery();
                    if (a > 0)
                    {
                        string Message = "Size with " + txtId.Text + " ID Deleted Scccessfully";
                        string str_alert_Msg = @"swal.fire({
                            icon: 'success',
                            title:'Deleted',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Success", str_alert_Msg, true);
                        GV1.DataSource = null;
                        GV1.DataBind();
                        lbl1.Visible = false;
                        btnDel.Visible = false;
                        txtId.Text = "";
                    }

                    else
                    {
                        string Message = "Size with " + txtId.Text + " ID Not Deleted Scccessfully";
                        string str_alert_Msg = @"swal.fire({
                            icon: 'error',
                            title:'Error',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Error", str_alert_Msg, true);
                    }
                }
            }
            catch (Exception e2)
            {

                Response.Write(e2.ToString());
            }
        }

    }
}