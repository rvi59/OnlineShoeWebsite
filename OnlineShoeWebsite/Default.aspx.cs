using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Services;

namespace OnlineShoeWebsite
{
    public partial class Default : System.Web.UI.Page
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
                BindCasual();
                BindFormal();
                BindSports();
            }
        }

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{

        //    Session["Searchtxt"] = txtSearch.Text;
        //    Response.Redirect("SearchResult.aspx");

        //}


        private void BindCasual()
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("spLatestCasual", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlCasual.DataSource = dt;
                        dlCasual.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }



        private void BindFormal()
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("spLatestFormal", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlFormal.DataSource = dt;
                        dlFormal.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }


        private void BindSports()
        {
            try
            {
                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("spLatestSports", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dlSports.DataSource = dt;
                        dlSports.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }


        protected void btnMen_Click(object sender, EventArgs e)
        {
            Response.Redirect("MensList.aspx");
        }

        protected void btnWomen_Click(object sender, EventArgs e)
        {
            Response.Redirect("WomensList.aspx");
        }

    }
}