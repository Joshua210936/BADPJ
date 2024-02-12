﻿using System;
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
    public partial class AccountDetails : System.Web.UI.Page
    {
        User customer = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

                    // Display user data in the textboxes and radio button list
                    lblUserId.Text = userId;
                    txtFirstName.Text = firstName;
                    txtLastName.Text = lastName;
                    txtEmail.Text = email;
                    txtPhoneNumber.Text = phoneNumber;
                    // Check the appropriate radio button based on gender
                    if (gender == "Female")
                        rblGender.SelectedIndex = 0;
                    else if (gender == "Male")
                        rblGender.SelectedIndex = 1;
                }
                else
                {
                    lblErrorMessage.Text = "User data not found.";
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Retrieve the user ID from the session
            string userId = Session["UserId"].ToString();

            // Retrieve updated user details from the textboxes and radio button list
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string gender = rblGender.SelectedValue;

            customer.UpdateUserData(userId, firstName, lastName, email, phoneNumber, gender);

            // Display a success message or perform any additional actions
            lblUpdateMessage.Text = "Account details updated successfully.";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();

            // Redirect the user to the login page
            Response.Redirect("~/Login.aspx");
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string userId = Session["UserId"].ToString();
            string randomString = GenerateRandomString(16); // Adjust the length as needed
            string uniquelink = randomString;
            int isChangePassword = 1;

            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
            string query = "UPDATE UserAccount SET UniqueLink = @UniqueLink, IsChangePassword = @IsChangePassword  WHERE UserId = @UserId";
                using (SqlConnection connection = new SqlConnection(connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@UniqueLink", uniquelink);
                        cmd.Parameters.AddWithValue("@IsChangePassword", isChangePassword);

                        connection.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            
            LabelLink.Text = "https://localhost:44365/UpdatePassword.aspx?userid="+ userId+ "&UniqueLink=" + uniquelink;
        
        }


        
        // Method to generate a random string of a given length
        public static string GenerateRandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            for (int i = 0; i < length; i++)
            {
                builder.Append(chars[random.Next(chars.Length)]);
            }
            return builder.ToString();
        }

        
        
    }
}

