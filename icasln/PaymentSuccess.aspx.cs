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
                // Assuming you have stored the user's ID and Name in session variables
                var userId = Session["UserId"]?.ToString();
                var userName = Session["UserName"]?.ToString();
                var subId = Request.QueryString["subId"]; // Get Sub_ID from the query string

                if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(subId))
                {
                    var subscription = new Subscription();
                    var selectedSub = subscription.getSubscription(subId);

                    if (selectedSub != null)
                    {
                        var subbed = new Subbed
                        {
                            UserID = userId,
                            UserName = userName,
                            SubbedID = subId,
                            Sub_Duration = selectedSub.Sub_Type, // Assuming Sub_Type is used as duration here
                            UserSubDate = DateTime.Now.ToString("yyyy-MM-dd") // Current date as the subscription date
                        };

                        // Assuming you have a method in Subbed.cs to insert a new subscription record
                        subbed.SubbedInsert(); // Implement this method to insert the subscription record
                    }

                    // Redirect to a confirmation page or display a success message
                    Response.Redirect("Premium.aspx");
                }
                else
                {
                    // Handle error or invalid access
                    Response.Redirect("ThankYou.aspx");
                }
            }
        }
    }
}