using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace icasln
{
    public class User
    {
        string _connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        private string _userId;
        private string _firstName;
        private string _lastName;
        private string _email;
        private string _phoneNumber;
        private string _gender;
        private string _password;  

        public User()
        {
        }

        public User(string userId, string firstName, string lastName, string email, string phoneNumber, string gender, string password)
        {
            _userId = userId;
            _firstName = firstName;
            _lastName = lastName;
            _email = email;
            _phoneNumber = phoneNumber;
            _gender = gender;
            _password = password;
        }

        public string UserId
        {
            get { return _userId; }
            set { _userId = value; }
        }

        public string FirstName
        {
            get { return _firstName; }
            set { _firstName = value; }
        }

        public string LastName
        {
            get { return _lastName; }
            set { _lastName = value; }
        }

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        public string PhoneNumber
        {
            get { return _phoneNumber; }
            set { _phoneNumber = value; }
        }

        public string Gender
        {
            get { return _gender; }
            set { _gender = value; }
        }

        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }

        public int GenerateNewUserId()
        {
            int newUserId = 0;

            // Connect to the database and get the maximum existing user ID
            string query = "SELECT MAX(UserId) FROM UserAccount";

            using (SqlConnection connection = new SqlConnection(_connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        // If there are existing user IDs, increment the maximum by 1
                        newUserId = Convert.ToInt32(result) + 1;
                    }
                    else
                    {
                        // If no existing user IDs, start from 1
                        newUserId = 1;
                    }
                }
            }

            return newUserId;
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        // Method to insert a new user into the database
        public int InsertUser()
        {
            int result = 0; // Initialize result to track the number of rows affected

            // Hash the password before inserting into the database
            string hashedPassword = HashPassword(_password);

            string query = "INSERT INTO UserAccount (UserId, FirstName, LastName, Email, PhoneNumber, Gender, Password)" +
                           "VALUES (@UserId, @FirstName, @LastName, @Email, @PhoneNumber, @Gender, @Password)";

            using (SqlConnection connection = new SqlConnection(_connStr))
            {
                SqlCommand cmd = new SqlCommand(query, connection);

                cmd.Parameters.AddWithValue("@UserId", _userId);
                cmd.Parameters.AddWithValue("@FirstName", _firstName);
                cmd.Parameters.AddWithValue("@LastName", _lastName);
                cmd.Parameters.AddWithValue("@Email", _email);
                cmd.Parameters.AddWithValue("@PhoneNumber", _phoneNumber);
                cmd.Parameters.AddWithValue("@Gender", _gender);
                cmd.Parameters.AddWithValue("@Password", hashedPassword);  // Use hashed password

                connection.Open();
                result = cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
                connection.Close();
            }

            return result;
        }

        // Method to retrieve user data from the database based on session ID
        public static User GetUserDataById(string userId)
        {
            User userData = null;

            // Connection string from configuration
            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;

            // Query to retrieve user data from the database based on user ID
            string query = "SELECT UserId, FirstName, LastName, Email, PhoneNumber, Gender FROM UserAccount WHERE UserId = @UserId";

            // Using SqlConnection and SqlCommand for database interaction
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Parameterized query to prevent SQL injection
                    command.Parameters.AddWithValue("@UserId", userId);

                    // Opening the database connection
                    connection.Open();

                    // Executing the query
                    SqlDataReader reader = command.ExecuteReader();

                    // If data is found, populate the User object
                    if (reader.Read())
                    {
                        userData = new User
                        {
                            UserId = reader["UserId"].ToString(),
                            FirstName = reader["FirstName"].ToString(),
                            LastName = reader["LastName"].ToString(),
                            Email = reader["Email"].ToString(),
                            PhoneNumber = reader["PhoneNumber"].ToString(),
                            Gender = reader["Gender"].ToString()
                        };
                    }
                }
            }

            return userData;
        }


        public List<User> GetAllUsers()
        {
            List<User> users = new List<User>();

            string query = "SELECT * FROM UserAccount";

            using (SqlConnection connection = new SqlConnection(_connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            User user = new User(
                                userId: reader["UserId"].ToString(),
                                firstName: reader["FirstName"].ToString(),
                                lastName: reader["LastName"].ToString(),
                                email: reader["Email"].ToString(),
                                phoneNumber: reader["PhoneNumber"].ToString(),
                                gender: reader["Gender"].ToString(),
                                password: reader["Password"].ToString()
                            );

                            users.Add(user);
                        }
                    }
                }
            }

            return users;
        }
        public void UpdateUserData(string userId, string newFirstName /*, add other parameters as needed */)
        {
            string query = "UPDATE UserAccount SET FirstName = @FirstName WHERE UserId = @UserId";

            using (SqlConnection connection = new SqlConnection(_connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@FirstName", newFirstName);

                    connection.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Method to delete user from the database
        public void DeleteUser(string userId)
        {
            string query = "DELETE FROM UserAccount WHERE UserId = @UserId";

            using (SqlConnection connection = new SqlConnection(_connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    connection.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
        