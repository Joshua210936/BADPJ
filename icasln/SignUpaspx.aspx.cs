using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


namespace icasln
{
    public partial class SignUpaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Generate a new unique user ID and assign it to the user object
                User newUser = new User();
                hf_UserId.Value = newUser.GenerateNewUserId().ToString();
            }
        }

        protected void btn_Insert_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int result = 0;

                // Check if the email already exists in the database
                if (!IsEmailExists(tb_Email.Text))
                {
                    // Replace tb_ with meaningful names based on your form
                    User newUser = new User(
                        hf_UserId.Value,
                        tb_FirstName.Text,
                        tb_LastName.Text,
                        tb_Email.Text,
                        tb_PhoneNumber.Text,
                        rbl_Gender.SelectedValue,
                        tb_Password.Text
                    );

                    // Call the appropriate method in your User class
                    result = newUser.InsertUser();

                    if (result > 0)
                    {
                        // Additional logic for successful insert
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "setTimeout(function() { alert('Account created successfully'); window.location.href = 'Login.aspx'; }, 1);", true);

                    }
                    else
                    {
                        // Additional logic for unsuccessful insert
                        lbl_EmailError.Text = "Unable to create account";
                    }
                }
                else
                {
                    // Email already exists, show error message
                    lbl_EmailError.Text = "Email already exists";
                }
            }
        }

        // Method to check if the email already exists in the database
        private bool IsEmailExists(string email)
        {
            // Connection string from configuration
            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;

            // Query to check if email exists in the database
            string query = "SELECT COUNT(*) FROM UserAccount WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Parameterized query to prevent SQL injection
                    command.Parameters.AddWithValue("@Email", email);

                    // Opening the database connection
                    connection.Open();

                    // Executing the query
                    int count = (int)command.ExecuteScalar();

                    // Return true if count is greater than 0 (email exists), false otherwise
                    return count > 0;
                }
            }
        }
    }
}
