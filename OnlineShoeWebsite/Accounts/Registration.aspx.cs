using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoeWebsite.Accounts
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static bool addNewUser(string user_Name, string user_Pass, string user_Email, string Name)
        {
            string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;
            SqlConnection con;
            bool status;




            using (con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spAddUsers", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@user_Name", user_Name);
                cmd.Parameters.AddWithValue("@user_Pass", user_Pass);
                cmd.Parameters.AddWithValue("@user_Email", user_Email);
                cmd.Parameters.AddWithValue("@Name", Name);
                cmd.Parameters.AddWithValue("@user_type", "user");
                con.Open();
                int a = cmd.ExecuteNonQuery();

                if (a > 0)
                {
                    status = true;
                }
                else
                {
                    status = false;
                }
                return status;

            }

        }


    }
}