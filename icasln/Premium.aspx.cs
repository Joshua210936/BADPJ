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
    public partial class Premium : System.Web.UI.Page
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

        // Inside Premium.aspx.cs
        protected void SubscriptionsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Checkout")
            {
                var userId = Session["UserId"]?.ToString();
                if (string.IsNullOrEmpty(userId))
                {
                    string script = "alert('Please log in or sign up to continue.'); window.location = 'SignUpaspx.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "loginAlert", script, true);
                }
                else
                {
                    // Create an instance of Subbed to use the new method
                    Subbed subbed = new Subbed();

                    // Check if the user already has a premium subscription
                    if (subbed.CheckUserPremiumSubscription(userId))
                    {
                        // User already has a premium subscription
                        string script = "alert('You already have a premium subscription.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alreadyPremium", script, true);
                    }
                    else
                    {
                        // User does not have a premium subscription, proceed with checkout
                        var subId = e.CommandArgument.ToString();
                        var selectedSub = aSub.getSubscription(subId); // Fetch subscription details

                        if (selectedSub != null)
                        {
                            var priceInCents = Convert.ToInt32(Convert.ToDecimal(selectedSub.Sub_Price) * 100);
                            CreateCheckoutSession(priceInCents, selectedSub.Sub_Type);
                        }
                    }
                }
            }
        }



        private void CreateCheckoutSession(int priceInCents, string productName)
        {
            StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];

            // Encode the product name to ensure the URL is valid
            string encodedProductName = HttpUtility.UrlEncode(productName);

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
                SuccessUrl = $"https://localhost:44365/PaymentSuccess.aspx?session_id={{CHECKOUT_SESSION_ID}}&subType={encodedProductName}",
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