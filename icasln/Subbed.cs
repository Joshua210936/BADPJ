using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace icasln
{
    public class Subbed
    {
        private string _connStr = ConfigurationManager.ConnectionStrings["CompaniBotDBContext"].ConnectionString;

        // Properties excluding SubbedID
        public int UserSub_ID { get; set; }
        public string UserID { get; set; }
        public string UserName { get; set; }
        public string Sub_Duration { get; set; }
        public string UserSubDate { get; set; }

        // Default constructor
        public Subbed() { }

        // Method to retrieve a specific subscription by UserSub_ID, adjusted to exclude SubbedID
        public Subbed GetSubbed(int userSubID)
        {
            Subbed subDetail = null;

            string queryStr = "SELECT UserID, UserName, Sub_Duration, UserSubDate FROM UserSubscriptionn WHERE UserSub_ID = @UserSubID";
            using (SqlConnection conn = new SqlConnection(_connStr))
            using (SqlCommand cmd = new SqlCommand(queryStr, conn))
            {
                cmd.Parameters.AddWithValue("@UserSubID", userSubID);
                conn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        subDetail = new Subbed
                        {
                            UserSub_ID = userSubID,
                            UserID = dr["UserID"].ToString(),
                            UserName = dr["UserName"].ToString(),
                            Sub_Duration = dr["Sub_Duration"].ToString(),
                            UserSubDate = dr["UserSubDate"].ToString()
                        };
                    }
                }
            }

            return subDetail;
        }

        // Method to retrieve all subscriptions, adjusted to exclude SubbedID
        public List<Subbed> GetSubbedAll()
        {
            List<Subbed> subList = new List<Subbed>();

            string queryStr = "SELECT UserSub_ID, UserID, UserName, Sub_Duration, UserSubDate FROM UserSubscriptionn ORDER BY UserSubDate DESC";
            using (SqlConnection conn = new SqlConnection(_connStr))
            using (SqlCommand cmd = new SqlCommand(queryStr, conn))
            {
                conn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Subbed sub = new Subbed
                        {
                            UserSub_ID = Convert.ToInt32(dr["UserSub_ID"]),
                            UserID = dr["UserID"].ToString(),
                            UserName = dr["UserName"].ToString(),
                            Sub_Duration = dr["Sub_Duration"].ToString(),
                            UserSubDate = dr["UserSubDate"].ToString()
                        };
                        subList.Add(sub);
                    }
                }
            }

            return subList;
        }

        // Method for inserting a new subscription, adjusted to exclude SubbedID
        public int SubbedInsert(string userID, string userName, string subDuration, string userSubDate)
        {
            int result = 0;
            string queryStr = "INSERT INTO UserSubscriptionn (UserID, UserName, Sub_Duration, UserSubDate)" +
                              "VALUES (@UserID, @UserName, @Sub_Duration, @UserSubDate)";
            using (SqlConnection conn = new SqlConnection(_connStr))
            using (SqlCommand cmd = new SqlCommand(queryStr, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@UserName", userName);
                cmd.Parameters.AddWithValue("@Sub_Duration", subDuration);
                cmd.Parameters.AddWithValue("@UserSubDate", userSubDate);

                conn.Open();
                result = cmd.ExecuteNonQuery();
            }

            return result;
        }
    }
}
