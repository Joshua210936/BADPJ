using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

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

        // Method to insert a new user into the database
        public int InsertUser()
        {
            // string msg = null;
            int result = 0;

            
            string query = "INSERT INTO UserAccount (UserId, FirstName, LastName, Email, PhoneNumber, Gender, Password)" + "VALUES (@UserId, @FirstName, @LastName, @Email, @PhoneNumber, @Gender, @Password)";

            SqlConnection connection = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(query, connection);


                    cmd.Parameters.AddWithValue("@UserID", this.UserId);
                    cmd.Parameters.AddWithValue("@FirstName", this.FirstName);
                    cmd.Parameters.AddWithValue("@LastName", this.LastName);
                    cmd.Parameters.AddWithValue("@Email", this.Email);
                    cmd.Parameters.AddWithValue("@PhoneNumber", this.PhoneNumber);
                    cmd.Parameters.AddWithValue("@Gender", this.Gender);
                    cmd.Parameters.AddWithValue("@Password", this.Password);  // Add parameter for password

             connection.Open();
             result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
             connection.Close();

                    return result;

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
        