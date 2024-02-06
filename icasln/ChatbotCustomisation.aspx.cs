using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class ChatbotCustomisation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Chatbot.aspx");
        }

        protected void CustomiseInformationButton_Click(object sender, EventArgs e)
        {
            string userCustomisation = CustomiseInformationTextbox.Text;
            Session["userCustomisation"] = userCustomisation;
        }
    }
}