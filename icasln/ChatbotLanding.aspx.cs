using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class ChatbotLanding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoToChatbot_Click(object sender, EventArgs e)
        {
            Response.Redirect("Chatbot.aspx");
        }

        protected void GoToCustomisation_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChatbotCustomisation.aspx");
        }
    }
}