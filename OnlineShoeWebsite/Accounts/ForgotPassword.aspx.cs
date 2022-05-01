using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;

namespace OnlineShoeWebsite.Accounts
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMail_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;
            SqlConnection con;
            try
            {

                using (con = new SqlConnection(CS))
                {

                    SqlCommand cmd = new SqlCommand("spIsEmailValid", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@user_Email", txtmail.Text.Trim());
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {


                        string myGuid = Guid.NewGuid().ToString();
                        int uid = Convert.ToInt32(dt.Rows[0][0]);
                        DateTime myDate = DateTime.Now;
                        SqlCommand cmd2 = new SqlCommand("spForgetPass", con);
                        cmd2.CommandType = CommandType.StoredProcedure;
                        cmd2.Parameters.AddWithValue("@Id", myGuid);
                        cmd2.Parameters.AddWithValue("@user_Id", uid);
                        cmd2.Parameters.AddWithValue("@RequestDateTime", myDate);
                        //con.Open();
                        cmd2.ExecuteNonQuery();


                        // Send Reset Link via Email Start

                        string ToEmailAddress = dt.Rows[0][3].ToString();
                        string Username = dt.Rows[0][1].ToString();

                        string EmailBody = "Hi , " + Username + ",<br/><br/> Click the link below to reset your Password <br/> <br/> http://localhost:65401/Accounts/RecoverPassword.aspx?id=" + myGuid;


                        MailMessage PasRecMail = new MailMessage("ravikumar.yadav1000@gmail.com", ToEmailAddress);
                        PasRecMail.Body = EmailBody;
                        PasRecMail.IsBodyHtml = true;
                        PasRecMail.Subject = "Reset Password";



                        using (SmtpClient smtp = new SmtpClient())
                        {

                            smtp.UseDefaultCredentials = false;
                            smtp.Credentials = new NetworkCredential("ravikumar.yadav1000@gmail.com", "rvind5599");
                            smtp.EnableSsl = true;

                            smtp.Host = "smtp.gmail.com";
                            smtp.Port = 587;
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                            smtp.Send(PasRecMail);

                        }
                        string Message = "Please Check Your Mail";
                        string str_alert_Msg = @"swal.fire({
                            icon: 'success',
                            title:'Open Your Mail!',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Success", str_alert_Msg, true);

                        txtmail.Text = "";
                    }
                    else
                    {

                        string Message1 = "Email is Invalid";
                        string str_alert_Msg1 = @"swal.fire({
                            icon: 'Invalid',
                            title:'Email Not Found',
                            text: '" + Message1 + @"',                                                                 
                           
                            });";

                        ScriptManager.RegisterStartupScript(this, GetType(), "Faild", str_alert_Msg1, true);





                        Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                        Match match = regex.Match(txtmail.Text.Trim());

                        if (txtmail.Text == "")
                        {
                            string Message0 = "Email Cannot be empty";
                            string str_alert_Msg0 = @"swal.fire({
                            icon: 'error',
                            title:'Enter Email Id',
                            text: '" + Message0 + @"',                                                                 
                           
                            });";

                            ScriptManager.RegisterStartupScript(this, GetType(), "Failed", str_alert_Msg0, true);
                        }

                        if (match.Success)
                        {
                        }
                        else
                        {

                            string Message = "Email Id is in InCorrect Format";
                            string str_alert_Msg = @"swal.fire({
                            icon: 'error',
                            title:'Incorrect Format',
                            text: '" + Message + @"',                                                                 
                           
                            });";

                            ScriptManager.RegisterStartupScript(this, GetType(), "Failed", str_alert_Msg, true);
                        }

                    }
                }


            }
            catch (Exception)
            {
                throw;
            }
        }

        //[WebMethod(EnableSession = true)]
        //public static void forgotPass(string emailid)
        //{
        //    string CS = ConfigurationManager.ConnectionStrings["MYCS"].ConnectionString;
        //    SqlConnection con;
        //    try
        //    {

        //        using (con = new SqlConnection(CS))
        //        {

        //            SqlCommand cmd = new SqlCommand("spIsEmailValid", con);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@user_Email", emailid);
        //            con.Open();
        //            SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            sda.Fill(dt);
        //            if (dt.Rows.Count > 0)
        //            {


        //                string myGuid = Guid.NewGuid().ToString();
        //                int uid = Convert.ToInt32(dt.Rows[0][0]);
        //                DateTime myDate = DateTime.Now;
        //                SqlCommand cmd2 = new SqlCommand("spForgetPass", con);
        //                cmd2.CommandType = CommandType.StoredProcedure;
        //                cmd2.Parameters.AddWithValue("@Id", myGuid);
        //                cmd2.Parameters.AddWithValue("@user_Id", uid);
        //                cmd2.Parameters.AddWithValue("@RequestDateTime", myDate);
        //                //con.Open();
        //                cmd2.ExecuteNonQuery();


        //                // Send Reset Link via Email Start

        //                string ToEmailAddress = dt.Rows[0][3].ToString();
        //                string Username = dt.Rows[0][1].ToString();

        //                string EmailBody = "Hi , " + Username + ",<br/><br/> Click the link below to reset your Password <br/> <br/> http://localhost:57589/RecoverPassword.aspx?id=" + myGuid;


        //                MailMessage PasRecMail = new MailMessage("Ravikumar.yadav1000@gmail.com", ToEmailAddress);
        //                PasRecMail.Body = EmailBody;
        //                PasRecMail.IsBodyHtml = true;
        //                PasRecMail.Subject = "Reset Password";



        //                using (SmtpClient smtp = new SmtpClient())
        //                {

        //                    smtp.UseDefaultCredentials = false;
        //                    smtp.Credentials = new NetworkCredential("Ravikumar.yadav1000@gmail.com", "rvind5599");
        //                    smtp.EnableSsl = true;

        //                    smtp.Host = "smtp.gmail.com";
        //                    smtp.Port = 587;
        //                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

        //                    smtp.Send(PasRecMail);

        //                }

        //            }
        //            else
        //            {

        //                ForgotPassword p = new ForgotPassword();
        //                p.ErroMess();
        //            }
        //        }


        //    }
        //    catch (Exception)
        //    {
        //        throw;               
        //    }
        //}

    }
}