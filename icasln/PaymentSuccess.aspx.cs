using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                // Extract user details
                var userId = Session["UserId"]?.ToString();
                var firstName = Session["FirstName"]?.ToString();
                var lastName = Session["LastName"]?.ToString();
                var userName = $"{firstName} {lastName}";

                if (!string.IsNullOrEmpty(userId))
                {
                    var subbed = new Subbed();
                    // Assuming you determine the subscription duration and start date in another way
                    string subDuration = "6 Month"; // Example duration
                    string userSubDate = DateTime.Now.ToString("yyyy-MM-dd");

                    // Insert the subscription record without SubId
                    int result = subbed.SubbedInsert(userId, userName, subDuration, userSubDate);

                    if (result > 0)
                    {
                        // Successful insertion
                        Response.Redirect("ThankYou.aspx");
                    }
                    else
                    {
                        // Handle insertion failure
                        Response.Write("Error in subscription process.");
                    }
                }
                else
                {
                    // Invalid user ID

                    Response.Redirect("SignUpaspx.aspx");
                }
            }
        }
    }
}
