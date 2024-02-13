using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Clear the session
            Session.Clear();

            // Redirect the user to the home page
            Response.Redirect("~/Home.aspx");
        }
    }
}