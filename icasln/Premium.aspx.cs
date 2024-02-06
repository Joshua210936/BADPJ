using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stripe;
using Stripe.Checkout;


namespace icasln
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Subscription aSub = new Subscription();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSubscriptions();
            }
        }

        private void BindSubscriptions()
        {
            // Fetch the list of all subscriptions.
            List<Subscription> allSubscriptions = aSub.getSubscriptionAll();

            // Filter the list to include only active subscriptions.
            List<Subscription> activeSubscriptions = allSubscriptions.Where(sub => sub.Sub_Status == "Active").ToList();

            // Bind the filtered list to the Repeater.
            SubscriptionsRepeater.DataSource = activeSubscriptions;
            SubscriptionsRepeater.DataBind();
        }


    }


}


