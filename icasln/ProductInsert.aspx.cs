using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Text;
using icasln;

namespace icasln
{
    public partial class ProductInsert : System.Web.UI.Page
    {
        private object confirm;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Insert successful');", true);

                try
                {
                    SendConfirmationEmail(prod, tb_Email.Text);
                    confirmationMessage += "\nAn email has been sent to your registered address.";
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

            // Display confirmation message to user
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

        private void SendConfirmationEmail(Product product, string senderEmail)
        {
            string to = ConfigurationManager.AppSettings["SmtpRecipientEmail"];
            string password = ConfigurationManager.AppSettings["SmtpPassword"];

            string mailMessage = $"From: CompaniBot\n";
            mailMessage += $"FirstName: {product.FirstName}\n";
            mailMessage += $"LastName: {product.LastName}\n";
            mailMessage += $"Email: {product.Email}\n";
            mailMessage += $"Message: {product.Message}\n";


            var smtp = new SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(senderEmail, password);
                
            }

            smtp.Send(senderEmail, to, "Confirmation Email", mailMessage);

        }

        protected void btn_CheckAll_Click(object sender, EventArgs e)
        {
            // Re-direct page to “ProductView.aspx”
            Response.Redirect("ProductView.aspx");
        }
    }
}
