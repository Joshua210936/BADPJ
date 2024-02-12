using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGoToPremium_Click(object sender, EventArgs e)
        {
            // Any server-side logic here

            // Redirect to Premium.aspx
            Response.Redirect("Premium.aspx");
        }
        protected void btnGoToAboutUs_Click(object sender, EventArgs e)
        {
            // Any server-side logic here

            // Redirect to Premium.aspx
            Response.Redirect("AboutUs.aspx");
        }

    }
}