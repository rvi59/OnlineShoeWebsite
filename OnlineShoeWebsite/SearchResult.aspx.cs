using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace OnlineShoeWebsite
{
    public partial class SearchResult : System.Web.UI.Page
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
                btnBack.Visible = false;
                try
                {
                    String Searchtxt = Session["Searchtxt"].ToString();

                    using (con = new SqlConnection(CS))
                    {
                        cmd = new SqlCommand("spSearchProd", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Searchtxt", Searchtxt);
                        sda = new SqlDataAdapter(cmd);
                        dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            DataListSearch.DataSource = dt;
                            DataListSearch.DataBind();

                            DataListSearch.Visible = true;


                            lblSearch.Text = "Search Result For " + Searchtxt;
                            lblSearch.Font.Bold = true;
                            lblSearch.Visible = true;

                        }
                        else
                        {

                            string Message = "No data Found";
                            string str_alert_Msg = @"swal.fire({
                            icon: 'error',
                            title:'Not Found!',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                            ScriptManager.RegisterStartupScript(this, GetType(), "Failed", str_alert_Msg, true);

                            btnBack.Visible = true;
                            //lblSearch.Text = "No data Found";

                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);

                }
            }
        }



    }
}