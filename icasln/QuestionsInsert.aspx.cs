using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using icasln;


namespace icasln
{
    public partial class QuestionsInsert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["UserId"] != null)
                {
                    // If logged in, retrieve user details and autofill the form fields
                    string userId = Session["UserId"].ToString();
                    PopulateUserDetails(userId);
                }
            }
        }

        private void PopulateUserDetails(string userId)
        {
            // Use your database logic to get user details by UserId
            // Assuming UserAccount table has columns like FirstName, LastName, and Email

            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
            string query = "SELECT FirstName, LastName, Email FROM UserAccount WHERE UserId = @UserId";

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Autofill the form fields with user details
                        tb_FirstName.Text = reader["FirstName"].ToString();
                        tb_LastName.Text = reader["LastName"].ToString();
                        tb_Email.Text = reader["Email"].ToString();
                        // Add other fields if needed
                    }
                }
            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            int result = 0;

            Questions question = new Questions();
            {
                question.FirstName = tb_FirstName.Text;
                question.LastName = tb_LastName.Text;
                question.Email = tb_Email.Text;
                question.Message = tb_Message.Text;
                question.QuestionText = tb_Message.Text; // Set QuestionText to the content of tb_Message

                result = question.QuestionInsert();
            }

            string confirmationMessage = string.Empty;

            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Your Query has been submitted!!!');", true);

                try
                {
                    // Send the main confirmation email to justinooi084@gmail.com
                    SendConfirmationEmail(question, "justinooi084@gmail.com", "justinooi084@gmail.com");
                    confirmationMessage += "\nAn email has been sent to your registered address.";

                    // Send a separate confirmation email to the email entered in tb_Email.Text
                    SendSeparateConfirmationEmail(question, tb_Email.Text);
                }
                catch (Exception ex)
                {
                    confirmationMessage = "Insert successful, but email failed to send. Please try again later.";
                    // Log the exception for further investigation
                    Console.WriteLine(ex.Message);
                }
            }
            else
            {
                confirmationMessage = "Insert NOT successful.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('{confirmationMessage}');", true);
            }

            // Display confirmation message to the user
            Label confirmLabel = FindControl("confirmLabel") as Label; // Replace with actual control ID
            if (confirmLabel != null)
            {
                confirmLabel.Text = confirmationMessage;
            }

            // Clear form fields if successful
            if (result > 0)
            {
                tb_FirstName.Text = "";
                tb_LastName.Text = "";
                tb_Email.Text = "";
                tb_Message.Text = "";
            }
        }

        private void SendConfirmationEmail(Questions product, string senderEmail, string recipientEmail)
        {
            const string password = "ywyj jpis yxbf jaif"; // Use app passwords for better security

            string mailMessage = $"From: CompaniBot\n";
            mailMessage += $"FirstName: {product.FirstName}\n";
            mailMessage += $"LastName: {product.LastName}\n";
            mailMessage += $"Email: {product.Email}\n";
            mailMessage += $"Message: {product.Message}\n";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(senderEmail, password)
            };

            smtp.Send(senderEmail, recipientEmail, "Confirmation Email", mailMessage);
        }

        private void SendSeparateConfirmationEmail(Questions product, string recipientEmail)
        {
            const string from = "justinooi084@gmail.com";
            const string password = "ywyj jpis yxbf jaif"; // Use app passwords for better security

            string mailMessage = $"Subject: Your Recent Submission Confirmation\n\n";
            mailMessage += $"Dear {product.FirstName},\n\n";
            mailMessage += $"Thank you for your recent submission to CompaniBot. We have received your information successfully. Here are the details:\n\n";
            mailMessage += $"- First Name: {product.FirstName}\n";
            mailMessage += $"- Last Name: {product.LastName}\n";
            mailMessage += $"- Email: {product.Email}\n";
            mailMessage += $"- Message: {product.Message}\n\n";
            mailMessage += "If you have any further questions or concerns, please feel free to contact us.\n\n";
            mailMessage += "Best regards,\nCompaniBot";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(from, password)
            };

            smtp.Send(from, recipientEmail, "Separate Confirmation Email", mailMessage);
        }

        protected void btn_CheckAll_Click(object sender, EventArgs e)
        {
            // Redirect page to “ProductView.aspx”
            Response.Redirect("QuestionsView.aspx");
        }
    }
}
