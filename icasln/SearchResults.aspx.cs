using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace icasln
{
    public partial class SearchResults : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve search criteria from the query string
                string searchCriteria = Request.QueryString["search"];

                // Check if search criteria is not null or empty
                if (!string.IsNullOrEmpty(searchCriteria))
                {
                    // Retrieve filtered questions from the database based on the search criteria
                    BindFilteredQuestions(searchCriteria);
                }
                else
                {
                    // If no search criteria, retrieve all questions from the database
                    BindQuestions();
                }
            }
        }
        private void BindQuestions()
        {
            // Assuming you have a connection string in the web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ToString();

            // SQL query to select all questions from the database
            string query = "SELECT QuestionText, AnswerText FROM Questions";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Bind the data to the repeater control
                        QuestionsRepeater.DataSource = reader;
                        QuestionsRepeater.DataBind();
                    }
                }
            }
        }



        private void BindFilteredQuestions(string searchCriteria)
        {
            // Assuming you have a connection string in the web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ToString();

            // SQL query to select questions that match the search criteria
            string query = "SELECT QuestionText,AnswerText FROM Questions WHERE QuestionText LIKE @searchCriteria";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@searchCriteria", "%" + searchCriteria + "%");

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Bind the data to the repeater control
                        QuestionsRepeater.DataSource = reader;
                        QuestionsRepeater.DataBind();
                    }
                }
            }
        }
    }
}

