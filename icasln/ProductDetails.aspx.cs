using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        Product prod = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    Product aProd = new Product();

                    // Get Product ID from querystring
                    string prodID = Request.QueryString["ProdID"];

                    if (!string.IsNullOrEmpty(prodID))
                    {
                        prod = aProd.getProduct(prodID);

                        if (prod != null)
                        {
                            lbl_FirstName.Text = prod.FirstName;
                            lbl_LastName.Text = prod.LastName;
                            lbl_Email.Text = prod.Email;
                            lbl_Message.Text = prod.Message;
                        }
                        else
                        {
                            // Handle the case where getProduct returns null
                            // Display an error message or redirect the user to an error page
                            Response.Write("Product not found.");
                        }
                    }
                    else
                    {
                        // Handle the case where ProdID is missing in the query string
                        // Display an error message or redirect the user to an error page
                        Response.Write("Product ID not provided.");
                    }
                }
                catch (Exception ex)
                {
                    // Handle other exceptions
                    Response.Write($"An error occurred: {ex.Message}");
                }
            }
        }
    }
}


