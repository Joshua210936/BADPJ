using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class Checkout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // Retrieve entered details (for demonstration purposes)
            string name = txtName.Text;
            string address = txtAddress.Text;
            string cardNumber = txtCardNumber.Text;
            string expirationDate = txtExpirationDate.Text;
            string cvv = txtCVV.Text;

            // Mock payment processing
            // In a real application, integrate with a payment gateway here
            bool paymentSuccess = ProcessMockPayment(cardNumber, expirationDate, cvv);

            if (paymentSuccess)
            {
                // Redirect to a success page or display a success message
                Response.Redirect("SuccessPayment.aspx"); // Replace with the appropriate page
            }
            else
            {
                // Handle payment failure (e.g., display error message)
                // This block can be reached if you implement some basic validation
            }
        }

        private bool ProcessMockPayment(string cardNumber, string expirationDate, string cvv)
        {
            // Simulate payment success
            return true; // Return false to simulate a failed transaction
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Redirect to previous page or home page
            Response.Redirect("ViewCart.aspx"); // Replace with the appropriate page
        }
        
    }
}