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

                // Extract the subscription type from the query string
                var subType = Request.QueryString["subType"];
                if (!string.IsNullOrEmpty(subType))
                {
                    // URL decode the subType in case it was URL encoded
                    string subDuration = HttpUtility.UrlDecode(subType);

                    if (!string.IsNullOrEmpty(userId))
                    {
                        var subbed = new Subbed();
                        string userSubDate = DateTime.Now.ToString("yyyy-MM-dd");

                        // Use the subType as the subscription duration
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
                else
                {
                    // Handle case where subType is missing
                    Response.Write("Error: Subscription type is missing.");
                }
            }
        }

    }
}
