using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            string query = "SELECT QuestionText, AnswerText FROM Questions WHERE QuestionText LIKE @searchCriteria";

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

        protected void QuestionsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Retrieve the question text from the data item
                string questionText = DataBinder.Eval(e.Item.DataItem, "QuestionText") as string;

                if (!string.IsNullOrEmpty(questionText))
                {
                    // Retrieve the search criteria from the query string
                    string searchCriteria = Request.QueryString["search"];

                    if (!string.IsNullOrEmpty(searchCriteria))
                    {
                        // Highlight the search term in the question text
                        Label lblQuestion = e.Item.FindControl("lblQuestion") as Label;
                        if (lblQuestion != null)
                        {
                            lblQuestion.Text = HighlightSearchTerm(questionText, searchCriteria);
                        }
                    }
                }
            }
        }

        private string HighlightSearchTerm(string text, string searchTerm)
        {
            // Case-insensitive highlighting of the search term using HTML
            return Regex.Replace(text, $"({Regex.Escape(searchTerm)})", "<span class='highlight'>$1</span>", RegexOptions.IgnoreCase);
        }

    }
}


