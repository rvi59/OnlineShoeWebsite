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

namespace OnlineShoeWebsite.AdminDashBoard
{
    public partial class ProductList : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //PopulateProduct();
            }
        }


        //private void PopulateProduct()
        //{
        //    using (con = new SqlConnection(CS))
        //    {
        //        cmd = new SqlCommand("spShowProductList", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        sda = new SqlDataAdapter(cmd);

        //        //sda = new SqlDataAdapter("Select * from tblBrand", con);
        //        dt = new DataTable();
        //        sda.Fill(dt);

        //    }
        //    if (dt.Rows.Count > 0)
        //    {
        //        gvProduct.DataSource = dt;
        //        gvProduct.DataBind();
        //    }
        //}



        [WebMethod]
        public static UserDetails[] BindDatatable()
        {
            DataTable dt = new DataTable();
            List<UserDetails> details = new List<UserDetails>();
            string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spShowProductList", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                foreach (DataRow dtrow in dt.Rows)
                {
                    UserDetails user = new UserDetails();
                    user.PId = Convert.ToInt32(dtrow["PId"]);
                    user.PName = dtrow["PName"].ToString();
                    user.PPrice = Convert.ToInt32(dtrow["PPrice"]);
                    user.PSelling_Price = Convert.ToInt32(dtrow["PSelling_Price"]);
                    user.PQuantity = Convert.ToInt32(dtrow["PQuantity"]);
                    user.BrandName = dtrow["BrandName"].ToString();
                    user.CatName = dtrow["CatName"].ToString();
                    user.GenderName = dtrow["GenderName"].ToString();
                    user.PImage = dtrow["PImage"].ToString();
                    user.PDescription = dtrow["PDescription"].ToString();
                    user.SizeNumber = Convert.ToInt32(dtrow["SizeNumber"]);
                    details.Add(user);
                }

            }
            return details.ToArray();
        }
        public class UserDetails
        {
            public int PId { get; set; }
            public string PName { get; set; }
            public int PPrice { get; set; }
            public int PSelling_Price { get; set; }
            public int PQuantity { get; set; }
            public string BrandName { get; set; }
            public string CatName { get; set; }
            public string GenderName { get; set; }
            public string PImage { get; set; }
            public string PDescription { get; set; }
            public int SizeNumber { get; set; }
        }
    }
}