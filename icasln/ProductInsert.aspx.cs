﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using Lab06;

namespace icasln
{
    public partial class ProductInsert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialization code (if needed)
            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            int result = 0;

            Product prod = new Product(tb_FirstName.Text, tb_LastName.Text, tb_Email.Text, tb_Message.Text);
            {
                result = prod.ProductInsert();
            }

            string confirmationMessage = string.Empty;

            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Your Query has been submitted!!!');", true);

                try
                {
                    // Send the main confirmation email to justinooi084@gmail.com
                    SendConfirmationEmail(prod, "justinooi084@gmail.com", "justinooi084@gmail.com");
                    confirmationMessage += "\nAn email has been sent to your registered address.";

                    // Send a separate confirmation email to the email entered in tb_Email.Text
                    SendSeparateConfirmationEmail(prod, tb_Email.Text);
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

        private void SendConfirmationEmail(Product product, string senderEmail, string recipientEmail)
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

        private void SendSeparateConfirmationEmail(Product product, string recipientEmail)
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
            Response.Redirect("ProductView.aspx");
        }
    }
}

