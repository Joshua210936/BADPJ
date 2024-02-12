using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace icasln
{
    public class User
    {
        private string _connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        private string _userId;
        private string _firstName;
        private string _lastName;
        private string _email;
        private string _phoneNumber;
        private string _gender;
        private string _password;
        private bool _isAdmin;

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

        internal object GetUserDataById(string userId)
        {
            throw new NotImplementedException();
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

        public bool IsAdmin
        {
            get { return _isAdmin; }
            set { _isAdmin = value; }
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

        public void UpdatePassword(string userId, string newPassword)
        {
            // Hash the new password (assuming you have a method to hash passwords)
            string hashedPassword = HashPassword(newPassword);

            // Define the SQL query to update the password
            string query = "UPDATE UserAccount SET Password = @Password, IsChangePassword = 'False' WHERE UserId = @UserId";

            // Create and open a connection to the database
            using (SqlConnection connection = new SqlConnection(_connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Set parameters for the SQL query
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@Password", hashedPassword);

                    // Open the connection
                    connection.Open();

                    // Execute the SQL command
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Method to insert a new user into the database
        public int InsertUser()
        {
            int result = 0; // Initialize result to track the number of rows affected

            // Hash the password before inserting into the database
            string hashedPassword = HashPassword(_password);

            string query = "INSERT INTO UserAccount (UserId, FirstName, LastName, Email, PhoneNumber, Gender, Password, IsAdmin)" +
                           "VALUES (@UserId, @FirstName, @LastName, @Email, @PhoneNumber, @Gender, @Password, @IsAdmin)";

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
                cmd.Parameters.AddWithValue("@IsAdmin", 0);  // Set IsAdmin to 0 for regular users

                connection.Open();
                result = cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
                connection.Close();
            }

            return result;
        }

        public User GetUserDataByEmail(string email)
        {
            User userData = null;

            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
            string query = "SELECT UserId, FirstName, LastName, Email, PhoneNumber, Gender, IsAdmin FROM UserAccount WHERE Email = @Email";

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        userData = new User
                        {
                            UserId = reader["UserId"].ToString(),
                            FirstName = reader["FirstName"].ToString(),
                            LastName = reader["LastName"].ToString(),
                            Email = reader["Email"].ToString(),
                            PhoneNumber = reader["PhoneNumber"].ToString(),
                            Gender = reader["Gender"].ToString(),
                            IsAdmin = Convert.ToBoolean(reader["IsAdmin"])
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
        public void UpdateUserData(string userId, string newFirstName, string newlastName, string newemail, string newphoneNumber, string newgender/*, add other parameters as needed */)
        {

            string query = "UPDATE UserAccount SET FirstName = @FirstName, LastName = @LastName, Email = @Email, " +
                           "PhoneNumber = @PhoneNumber, Gender = @Gender WHERE UserId = @UserId";

            using (SqlConnection connection = new SqlConnection(_connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@FirstName", newFirstName);
                    cmd.Parameters.AddWithValue("@LastName", newlastName);
                    cmd.Parameters.AddWithValue("@Email", newemail);
                    cmd.Parameters.AddWithValue("@PhoneNumber", newphoneNumber);
                    cmd.Parameters.AddWithValue("@Gender", newgender);


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
