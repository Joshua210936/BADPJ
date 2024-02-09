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
    public partial class AccountDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user ID is stored in the session
            if (Session["UserId"] != null)
            {
                // Retrieve the user ID from the session
                string userId = Session["UserId"].ToString();

                // Initialize variables to store user data
                string firstName = "";
                string lastName = "";
                string email = "";
                string phoneNumber = "";
                string gender = "";

                // Query the database to retrieve user data based on user ID
                string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
                string query = "SELECT FirstName, LastName, Email, PhoneNumber, Gender FROM UserAccount WHERE UserId = @UserId";

                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@UserId", userId);
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            // Populate user data variables
                            firstName = reader["FirstName"].ToString();
                            lastName = reader["LastName"].ToString();
                            email = reader["Email"].ToString();
                            phoneNumber = reader["PhoneNumber"].ToString();
                            gender = reader["Gender"].ToString();
                        }
                        reader.Close();
                    }
                }

                // Display user data on the page
                lblUserId.Text = userId;
                lblFirstName.Text = firstName;
                lblLastName.Text = lastName;
                lblEmail.Text = email;
                lblPhoneNumber.Text = phoneNumber;
                lblGender.Text = gender;
            }
            else
            {
                lblErrorMessage.Text = "User data not found.";
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();

            // Redirect the user to the login page
            Response.Redirect("~/Login.aspx");
        }
    }
}

    