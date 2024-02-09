using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace icasln
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            try
            {
                // Fetch the hashed password from the database for the provided email
                string hashedPassword = GetHashedPassword(email);

                if (hashedPassword != null)
                {
                    // Hash the input password
                    string hashedInputPassword = HashPassword(password);

                    // Check if the hashed input password matches the hashed password fetched from the database
                    if (hashedPassword == hashedInputPassword)
                    {
                        // Successful login, create a session using the user id
                        string userId = GetUserIdByEmail(email);
                        Session["UserId"] = userId;

                        // Redirect to the dashboard or any other page
                        Response.Redirect("AccountManagement.aspx");
                    }
                    else
                    {
                        // Password mismatch, display error message
                        lblErrorMessage.Visible = true;
                        lblErrorMessage.Text = "Invalid email or password.";
                    }
                }
                else
                {
                    // Email not found, display error message
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Invalid email or password.";
                }
            }
            catch (Exception ex)
            {
                // Error occurred, display error message
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "An error occurred while processing your request.";
                // Log the exception for debugging purposes
                Console.WriteLine(ex.Message);
            }
        }

        // Method to fetch hashed password from the database based on email
        private string GetHashedPassword(string email)
        {
            string hashedPassword = null;
            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
            string query = "SELECT Password FROM UserAccount WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        hashedPassword = Convert.ToString(result);
                    }
                }
            }

            return hashedPassword;
        }

        // Method to fetch user id from the database based on email
        private string GetUserIdByEmail(string email)
        {
            string userId = null;
            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
            string query = "SELECT UserId FROM UserAccount WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        userId = Convert.ToString(result);
                    }
                }
            }

            return userId;
        }

        // Method to hash password using SHA256
        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
