using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace icasln
{
    public partial class ForgotPassword : System.Web.UI.Page
    {

        User userdata = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            //string userId = Session["UserId"].ToString();
            //retrieve userid here
            String userID = userdata.GetUserDataByEmail(txtEmail.Text).UserId;




            // if userid can be retireved
            string randomString = GenerateRandomString(16); // Adjust the length as needed
            string uniquelink = randomString;
            int isChangePassword = 1;

            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
            string query = "UPDATE UserAccount SET UniqueLink = @UniqueLink, IsChangePassword = @IsChangePassword  WHERE UserId = @UserId";
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userID);
                    cmd.Parameters.AddWithValue("@UniqueLink", uniquelink);
                    cmd.Parameters.AddWithValue("@IsChangePassword", isChangePassword);

                    connection.Open();
                    cmd.ExecuteNonQuery();
                }
            }


            string resetlink = "https://localhost:44365/UpdatePassword.aspx?userid=" + userID + "&UniqueLink=" + uniquelink;
            SendPasswordResetEmail(txtEmail.Text, resetlink);
        }



        // Method to generate a random string of a given length
        public static string GenerateRandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            for (int i = 0; i < length; i++)
            {
                builder.Append(chars[random.Next(chars.Length)]);
            }
            return builder.ToString();
        }
        private void SendPasswordResetEmail(string userEmail, string resetLink)
        {
            using (MailMessage message = new MailMessage())
            {
                message.From = new MailAddress("companibotmail@gmail.com", "Companibot");
                message.To.Add(new MailAddress(userEmail));
                message.Subject = "Password Reset Link";
                message.Body = $"Please click the following link to reset your password: <a href='{resetLink}'>{resetLink}</a>";
                message.IsBodyHtml = true;

                using (SmtpClient client = new SmtpClient("smtp.gmail.com"))
                {
                    client.Port = 587;
                    client.Credentials = new NetworkCredential("companibotmail@gmail.com", "wkwp jnhv sqwf fecu");
                    client.EnableSsl = true;
                    client.Send(message);
                }
            }
        }

    }
}
