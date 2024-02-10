using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace icasln
{
    public partial class Registration_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your existing code here
        }

        [WebMethod]
        public static string[] GetAutocompleteSuggestions(string prefix)
        {
            // Implement your logic to fetch suggestions from the database
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HealthDBContext"].ToString());
            string query = "SELECT QuestionText FROM Questions WHERE QuestionText LIKE @prefix + '%'";

            using (SqlConnection connection = new SqlConnection(con.ConnectionString))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@prefix", prefix);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        System.Collections.Generic.List<string> suggestions = new System.Collections.Generic.List<string>();
                        while (reader.Read())
                        {
                            suggestions.Add(reader["QuestionText"].ToString());
                        }
                        return suggestions.ToArray();
                    }
                }
            }
        }
    }
}