using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Newtonsoft.Json;
using Razorpay.Api;

namespace OnlineShoeWebsite.Payout
{
    public partial class Checkout : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt = new DataTable();
        string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;


        public string _key = "";
        public string _secret = "";
        public string orderId;


        protected void Page_Load(object sender, EventArgs e)
        {
            setDetails();
        }


        private void setDetails()
        {

            int userId = Convert.ToInt32(Session["Uiid"]);

            using (con = new SqlConnection(CS))
            {

                cmd = new SqlCommand("spShowCheckoutDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("user_Id", userId);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["user_Name"].ToString();
                    txtEmail.Text = dt.Rows[0]["user_Email"].ToString();
                    Session["userMail"] = txtEmail.Text;

                }


                txtPrice.Text = Session["totPrice"].ToString();
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            int registrationAmount = Convert.ToInt32(txtPrice.Text);

            int amountInSubmits = registrationAmount * 100;
            string currency = "INR";
            string name = "Rvi";
            string description = "Razorpay Description";
            string imageLogo = "";
            string profileName = txtName.Text;
            string profileEmail = txtEmail.Text;
            string profileMobile = txtNumber.Text;

            Dictionary<string, string> notes = new Dictionary<string, string>()
            {

                {"note 1", "this is payment note" },{ "note 2", "this is another payment note"}

            };


            string orderId = CreateOrder(amountInSubmits, currency, notes);

            string jsFunction = "OpenPaymentWindow('" + _key + "','" + amountInSubmits + "','" + currency + "','" + name + "','" + description + "', '" + imageLogo + "', '" + orderId + "', '" + profileName + "', '" + profileEmail + "','" + profileMobile + "','" + JsonConvert.SerializeObject(notes) + "');";

            ClientScript.RegisterStartupScript(this.GetType(), "OpenPaymentWindow", jsFunction, true);




        }



        private string CreateOrder(int amountInSubmits, string currency, Dictionary<string, string> notes)
        {
            int userId = Convert.ToInt32(Session["Uiid"]);

            try
            {

                int paymentCapture = 1;

                RazorpayClient client = new RazorpayClient(_key, _secret);

                Dictionary<string, object> options = new Dictionary<string, object>();
                options.Add("amount", amountInSubmits); // amount in the smallest currency unit
                options.Add("payment_capture", paymentCapture);
                options.Add("currency", currency);
                options.Add("notes", notes);
                Order order = client.Order.Create(options);


                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                System.Net.ServicePointManager.Expect100Continue = false;

                //Order orderResponse = client.Order.Create(options);
                //orderId = orderResponse.Attributes["Id"].toString();
                //return orderId;



                orderId = order["id"].ToString();
                Session["orderId"] = orderId.ToString();
                string Pid1 = Session["Pid1"].ToString();


                using (con = new SqlConnection(CS))
                {
                    cmd = new SqlCommand("spUserBill", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@user_Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@user_Id", userId.ToString());
                    cmd.Parameters.AddWithValue("@user_Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Total_Price", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Mobile", txtNumber.Text);
                    cmd.Parameters.AddWithValue("@OrderId", orderId.ToString());
                    cmd.Parameters.AddWithValue("@Pid", Pid1);



                    con.Open();
                    cmd.ExecuteNonQuery();

                    Session["mob"] = txtNumber.Text;
                    Session["addr"] = txtAddress.Text;
                    Session["uid1"] = userId.ToString();
                    Session["uname1"] = txtName.Text;


                    return orderId;
                }


            }
            catch (Exception ex)
            {
                Response.Write(ex);
                throw;
            }
        }

    }
}