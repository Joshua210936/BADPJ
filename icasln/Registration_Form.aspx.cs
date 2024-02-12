using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;

namespace icasln
{
    public partial class Registration_Form : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ScriptManager scriptManager = ScriptManager.GetCurrent(this);
                if (scriptManager != null)
                {
                    scriptManager.RegisterPostBackControl(ddlAutocomplete);
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Your existing code here
        }

        [WebMethod]
        public static string[] GetAutocompleteSuggestions(string prefix)
        {
            // Implement your logic to fetch suggestions from the database
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ToString());
            string query = "SELECT QuestionText FROM Questions WHERE QuestionText LIKE @prefix + '%'";

            using (SqlConnection connection = new SqlConnection(con.ConnectionString))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@prefix", prefix);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        List<string> suggestions = new List<string>();
                        while (reader.Read())
                        {
                            suggestions.Add(reader["QuestionText"].ToString());
                        }
                        return suggestions.ToArray();
                    }
                }
            }
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            // Redirect page to “SearchResults.aspx” with search criteria
            string searchCriteria = searchInput.Value.Trim(); // Use .Value for HtmlInputText
            Response.Redirect($"SearchResults.aspx?search={Server.UrlEncode(searchCriteria)}");
        }
    }
}

