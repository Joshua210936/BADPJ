using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class usermaster : System.Web.UI.MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            

            
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();

            // Redirect the user to the login page
            Response.Redirect("~/Login.aspx");
        }
    }
}