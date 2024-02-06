﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;
using System.Net.Http;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace icasln
{
    public partial class Chatbot : System.Web.UI.Page
    {
        static string apiKey = "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";
        static string apiUrl = "https://api.openai.com/v1/chat/completions";
        public List<Dictionary<string, string>> conversationHistory = new List<Dictionary<string, string>>();
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string connectionString = WebConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        SqlConnection con;
        private string userCustomisation = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userCustomisation"] != null)
            {
                userCustomisation = Session["userCustomisation"].ToString();
            }
            con = new SqlConnection(connectionString);
            con.Open();
            try
            {
                string sql = "SELECT Message_Content FROM Message_Information ORDER BY Message_ID";
                cmd = new SqlCommand(sql, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);

                rptMyRepeater.DataSource = ds;
                rptMyRepeater.DataBind();

                cmd.Dispose();
                con.Close();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            // Check if the page is being loaded for the first time
            if (!IsPostBack)
            {
              
            }
        }


        protected async void SubmitButton_Click(object sender, EventArgs e)
        {
            
            int result = 0;
            string userInput = UserInputTextBox.Text;
            conversationHistory.Add(new Dictionary<string, string> { { "role", "user" }, { "content", userInput } }); //user message in list

            string response = await ChatWithGPT(userInput, userCustomisation);
            conversationHistory.Add(new Dictionary<string, string> { { "role", "assistant" }, { "content", response } }); //chatbot message in list

            
                
            Page.ClientScript.RegisterStartupScript(this.GetType(), "addQuestionMessageBoxDiv", "addQuestionMessageBoxDiv();", true); //pulls js function to create boxes divs
            Page.ClientScript.RegisterStartupScript(this.GetType(), "updateUserMessageDiv", $"updateUserMessageDiv('{userInput}');", true); //pulls js function to input user message
            Chat_Info info = new Chat_Info(null, userInput, "user");
            {
                result = info.MessageInsert();
            }
                
                
            Page.ClientScript.RegisterStartupScript(this.GetType(), "addResponseMessageBoxDiv", "addResponseMessageBoxDiv();", true);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "updateChatbotMessageDiv", $"updateChatbotMessageDiv('{response}');", true);//pulls js function to input chatbot message
            Page.ClientScript.RegisterStartupScript(this.GetType(), "sendMessage", $"sendMessage('{userInput}');", true);
            Chat_Info info2 = new Chat_Info(null, response, "chatbot");
            {
                result = info2.MessageInsert();
            }
                
        }

        protected void CustomiseButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChatbotCustomisation.aspx");

        }

        public static string ToJSONString(List<Dictionary<string, string>> conversationHistory) //message list
        {
            StringBuilder json = new StringBuilder("[");
            foreach (var message in conversationHistory)
            {
                json.Append("{");
                foreach (var pair in message)
                {
                    json.Append($"\"{pair.Key}\":\"{pair.Value}\","); //appends role then content after every chatbot response
                }
                json.Remove(json.Length - 1, 1);
                json.Append("},");
            }
            json.Remove(json.Length - 1, 1); 
            json.Append("]");
            return json.ToString(); //adds to list
        }

        public static async Task<string> ChatWithGPT(string prompt, string userCustomisation)
        {
            
            using (var httpClient = new HttpClient())
            {
                httpClient.DefaultRequestHeaders.Add("Authorization", $"Bearer {apiKey}");

                var requestData = new
                {
                    model = "gpt-3.5-turbo",
                    messages = new[]
                    {
                    new { role = "assistant", content = $"{userCustomisation}" }, //change prompt here
                    new { role = "user", content = prompt }
                    }
                };
                var content = new StringContent(Newtonsoft.Json.JsonConvert.SerializeObject(requestData), Encoding.UTF8, "application/json");

                var response = await httpClient.PostAsync(apiUrl, content);

                if (response.IsSuccessStatusCode)
                {
                    var responseContent = await response.Content.ReadAsStringAsync();
                    var jsonResponse = JObject.Parse(responseContent);
                    var finalresponse = jsonResponse["choices"][0]["message"]["content"].Value<string>();
                    return finalresponse;
                }
                else
                {
                    // Handle error
                    return "Error: " + response.StatusCode;
                }
            }
        }



    }
}