using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace icasln
{
    public partial class AddFAQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic, if needed
        }

        protected void btn_AddFAQ_Click(object sender, EventArgs e)
        {
            // Get the connection string from the web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;

            // Create a SqlConnection using the connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Open the connection
                connection.Open();

                // Insert the question and answer into the database
                string query = "INSERT INTO Questions (QuestionText, AnswerText) VALUES (@QuestionText, @AnswerText)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@QuestionText", tb_Question.Text.Trim());
                    command.Parameters.AddWithValue("@AnswerText", tb_Answer.Text.Trim());
                    command.ExecuteNonQuery();
                }
            }

            // Show a pop-up message using JavaScript
            string script = "alert('Data inserted successfully.');";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

            // Optionally, redirect to another page after adding the FAQ
            Response.Redirect("Home.aspx");
        }
    }
}
