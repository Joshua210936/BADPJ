using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stripe;
using Stripe.Checkout;
using System.Web.Services;
using System.Configuration;

namespace icasln
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Subscription aSub = new Subscription();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSubscriptions();
            }
        }

        private void BindSubscriptions()
        {
            List<Subscription> allSubscriptions = aSub.getSubscriptionAll();
            List<Subscription> activeSubscriptions = allSubscriptions.Where(sub => sub.Sub_Status == "Active").ToList();
            SubscriptionsRepeater.DataSource = activeSubscriptions;
            SubscriptionsRepeater.DataBind();
        }

        protected void SubscriptionsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Checkout")
            {
                var subId = e.CommandArgument.ToString();
                // Assuming you have a method to fetch the subscription details by ID
                var subscription = new Subscription(); // Assuming this is your model or service class
                var selectedSub = subscription.getSubscription(subId); // Fetch subscription details

                if (selectedSub != null)
                {
                    var priceInCents = Convert.ToInt32(selectedSub.Sub_Price * 100);
                    CreateCheckoutSession(priceInCents, selectedSub.Sub_Type);
                }
            }
        }

        private void CreateCheckoutSession(int priceInCents, string productName)
        {
            StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];

            var options = new SessionCreateOptions
            {
                PaymentMethodTypes = new List<string> { "card" },
                LineItems = new List<SessionLineItemOptions>
        {
            new SessionLineItemOptions
            {
                PriceData = new SessionLineItemPriceDataOptions
                {
                    UnitAmount = priceInCents,
                    Currency = "usd",
                    ProductData = new SessionLineItemPriceDataProductDataOptions
                    {
                        Name = productName,
                    },
                },
                Quantity = 1,
            },
        },
                Mode = "payment",
                SuccessUrl = "https://localhost:44365/PaymentSuccess.aspx?subId={CHECKOUT_SESSION_ID}",
                CancelUrl = "https://localhost:44365/Premium.aspx",
            };

            var service = new SessionService();
            Session session = service.Create(options);
            var redirectUrl = session.Url;
            HttpContext.Current.Response.Redirect(redirectUrl, endResponse: false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
    }
}