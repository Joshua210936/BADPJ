using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace icasln
{
    public class Subbed
    {
        string _connStr = ConfigurationManager.ConnectionStrings["CompaniBotDBContext"].ConnectionString;

        // Adapted properties for the UserSubscription table
        private int _userSubID;
        private string _userID = string.Empty;
        private string _userName = string.Empty;
        private string _subbedID = string.Empty;
        private string _subDuration = string.Empty;
        private string _userSubDate = string.Empty; // This will be set based on the query date

        // Default constructor
        public Subbed()
        {
        }

        // Constructor that takes in all data required to build a Subbed object
        public Subbed(int userSubID, string userID, string userName, string subbedID, string subDuration, string userSubDate)
        {
            _userSubID = userSubID;
            _userID = userID;
            _userName = userName;
            _subbedID = subbedID;
            _subDuration = subDuration;
            _userSubDate = userSubDate;
        }

        // Properties
        public int UserSub_ID
        {
            get { return _userSubID; }
            set { _userSubID = value; }
        }

        public string UserID
        {
            get { return _userID; }
            set { _userID = value; }
        }

        public string UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }

        public string SubbedID
        {
            get { return _subbedID; }
            set { _subbedID = value; }
        }

        public string Sub_Duration
        {
            get { return _subDuration; }
            set { _subDuration = value; }
        }

        public string UserSubDate
        {
            get { return _userSubDate; }
            set { _userSubDate = value; }
        }

        // Method to retrieve a specific subscription by UserSub_ID
        public Subbed getSubbed(string userSubID)
        {
            Subbed subDetail = null;

            string userID, userName, subbedID, subDuration, userSubDate;

            string queryStr = "SELECT * FROM UserSubscription WHERE UserSub_ID = @UserSubID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@UserSubID", userSubID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                userID = dr["UserID"].ToString();
                userName = dr["UserName"].ToString();
                subbedID = dr["SubbedID"].ToString();
                subDuration = dr["Sub_Duration"].ToString();
                userSubDate = dr["UserSubDate"].ToString();

                subDetail = new Subbed(int.Parse(userSubID), userID, userName, subbedID, subDuration, userSubDate);
            }
            else
            {
                subDetail = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return subDetail;
        }

        // Method to retrieve all subscriptions
        public List<Subbed> getSubbedAll()
        {
            List<Subbed> subList = new List<Subbed>();

            int userSubID;
            string userID, userName, subbedID, subDuration, userSubDate;

            string queryStr = "SELECT * FROM UserSubscription ORDER BY UserSubDate DESC";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                userSubID = int.Parse(dr["UserSub_ID"].ToString());
                userID = dr["UserID"].ToString();
                userName = dr["UserName"].ToString();
                subbedID = dr["SubbedID"].ToString();
                subDuration = dr["Sub_Duration"].ToString();
                userSubDate = dr["UserSubDate"].ToString();

                Subbed sub = new Subbed(userSubID, userID, userName, subbedID, subDuration, userSubDate);
                subList.Add(sub);
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return subList;
        }

        public int SubbedInsert()
        {
            int result = 0;
            string queryStr = "INSERT INTO UserSubscription(UserID, UserName, SubbedID, Sub_Duration, UserSubDate)" +
                              "VALUES (@UserID, @UserName, @SubbedID, @Sub_Duration, @UserSubDate)";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@UserID", this.UserID);
            cmd.Parameters.AddWithValue("@UserName", this.UserName);
            cmd.Parameters.AddWithValue("@SubbedID", this.SubbedID);
            cmd.Parameters.AddWithValue("@Sub_Duration", this.Sub_Duration);
            cmd.Parameters.AddWithValue("@UserSubDate", this.UserSubDate);

            try
            {
                conn.Open();
                result = cmd.ExecuteNonQuery(); // Returns the number of rows affected. Should be > 0 for success
            }
            catch (Exception ex)
            {
                // Ideally, handle the exception (e.g., logging)
                throw; // Re-throwing the exception here for simplicity
            }
            finally
            {
                conn.Close();
            }

            return result; // Returns the result of the operation
        }

    }
}