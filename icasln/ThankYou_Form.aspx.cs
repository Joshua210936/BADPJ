using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab06
{
    public partial class ThankYou_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Create a Customer Instance with default Constructor (with Null fields)
            Customer cust = new Customer();

            //Extract data from session object "Registration" and save it to a new Customer Object
            cust = (Customer)Session["Registration"];

            //Extract data from CUSTOMER object and display them on the label
            lbl_FirstName.Text = cust.FirstName.ToString();
            lbl_LastName.Text = cust.LastName.ToString(); 
            lbl_Email.Text = cust.Email.ToString(); 
            lbl_Message.Text = cust.Message.ToString(); 

  

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration_Form.aspx");

        }
    }
}