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
        string premiumUserID = string.Empty;
        protected bool isPremiumUser;

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
            con = new SqlConnection(connectionString);
            con.Open();
            try
            {
                string sqlPremium = "SELECT UserID FROM UserSubscriptionn WHERE UserID = @UserID";
                cmd = new SqlCommand(sqlPremium, con);
                cmd.Parameters.AddWithValue("@UserID", UserID);
                premiumUserID = cmd.ExecuteScalar()?.ToString();
                cmd.Dispose();
                con.Close();

                
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            isPremiumUser = !string.IsNullOrEmpty(premiumUserID);

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

            Chatbot_Info info2 = new Chatbot_Info(null, updatedName, updatedPrompt, UserID);
            // Call the ChatbotInfoUpdate method passing updatedName, updatedPrompt, and userID
            result = info2.ChatbotInfoUpdate(updatedName, updatedPrompt, UserID);


        }
        protected void SelectPersonalityButton_Click(object sender, EventArgs e)
        {
            if(ChatbotList.SelectedValue == "Chef")
            {
                int result = 0;
                string ChefPrompt = "Imagine youre a culinary expert sharing secret recipes and culinary wisdom with aspiring chefs.";
                string ChefName = "Chef";

                Chatbot_Info info = new Chatbot_Info(null, ChefName, ChefPrompt, UserID);
                {
                    result = info.ChatbotInfoInsert();
                }
            }

            if (ChatbotList.SelectedValue == "BoonKeng")
            {
                int result = 0;
                string BoonKengPrompt = "Speak in Singlish. Imagine you are speaking to a good friend.";
                string BoonKengName = "Boon Keng";

                Chatbot_Info info = new Chatbot_Info(null, BoonKengName, BoonKengPrompt, UserID);
                {
                    result = info.ChatbotInfoInsert();
                }
            }
            if (ChatbotList.SelectedValue == "OldMan")
                {
                    int result = 0;
                    string OldManPrompt = "Imagine youre an old man. Keep talking about how good the past was. Start each memory with: Back in my day,";
                    string OldManName = "Old Man";

                    Chatbot_Info info = new Chatbot_Info(null, OldManName, OldManPrompt, UserID);
                    {
                        result = info.ChatbotInfoInsert();
                    }
                }
        }

        protected void SelectNewPersonalityButton_Click(object sender, EventArgs e)
        {
            if (ChatbotList.SelectedValue == "Chef")
            {
                int result = 0;
                string ChefPrompt2 = "Imagine youre a culinary expert sharing secret recipes and culinary wisdom with aspiring chefs.";
                string ChefName2 = "Chef";

                Chatbot_Info info2 = new Chatbot_Info(null, ChefName2, ChefPrompt2, UserID);
                // Call the ChatbotInfoUpdate method passing updatedName, updatedPrompt, and userID
                result = info2.ChatbotInfoUpdate(ChefName2, ChefPrompt2, UserID);
            }

            if (ChatbotList.SelectedValue == "BoonKeng")
            {
                int result = 0;
                string BoonKengPrompt2 = "Speak in Singlish. Imagine you are speaking to a good friend.";
                string BoonKengName2 = "Boon Keng";

                Chatbot_Info info2 = new Chatbot_Info(null, BoonKengName2, BoonKengPrompt2, UserID);
                // Call the ChatbotInfoUpdate method passing updatedName, updatedPrompt, and userID
                result = info2.ChatbotInfoUpdate(BoonKengName2, BoonKengPrompt2, UserID);
            }
            if (ChatbotList.SelectedValue == "OldMan")
            {
                int result = 0;
                string OldManPrompt2 = "Imagine youre an old man. Keep talking about how good the past was. Start each memory with: Back in my day,";
                string OldManName2 = "Old Man";

                Chatbot_Info info2 = new Chatbot_Info(null, OldManName2, OldManPrompt2, UserID);
                // Call the ChatbotInfoUpdate method passing updatedName, updatedPrompt, and userID
                result = info2.ChatbotInfoUpdate(OldManName2, OldManPrompt2, UserID);
            }
        }


    }
}
