using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class ChatbotCustomisation : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string connectionString = WebConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        SqlConnection con;
        private string UserID = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                UserID = Session["UserId"].ToString();
            }
            else
            {
                UserID = null;
            }
        }
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Chatbot.aspx");
        }

        protected void CustomiseInformationButton_Click(object sender, EventArgs e)
        {
            int result = 0;
            string userCustomisation = CustomiseInformationTextbox.Text;
            string chatbotName = ChatbotNameTextbox.Text;
            Session["userCustomisation"] = userCustomisation;

            Chatbot_Info info = new Chatbot_Info(null, chatbotName, userCustomisation, UserID);
            {
                result = info.ChatbotInfoInsert();
            }
        }
        protected void UpdateInformationButton_Click(object sender, EventArgs e)
        {
            int result = 0;
            string updatedPrompt = UpdatePromptTextbox.Text;
            string updatedName = UpdateNameTextbox.Text;

            Chatbot_Info info = new Chatbot_Info();
            {
                result = info.ChatbotInfoUpdate(updatedName, updatedPrompt);
            }
        }
    }
}