using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace icasln
{
    public class Chatbot_Info
    {

        //Private string _connStr = Properties.Settings.Default.DBConnStr;

        //System.Configuration.ConnectionStringSettings _connStr;
        string _connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        private string _ChatbotID = null;
        private string _ChatbotName = "";
        private string _ChatbotPrompt = ""; // this is another way to specify empty string
        private string _UserID = "";

        public string ChatbotID { get => _ChatbotID; set => _ChatbotID = value; }
        public string ChatbotName { get => _ChatbotName; set => _ChatbotName = value; }
        public string ChatbotPrompt { get => _ChatbotPrompt; set => _ChatbotPrompt = value; }
        public string UserID { get => _UserID; set => _UserID = value; }

        // Default constructor
        public Chatbot_Info()
        {
        }

        // Constructor that take in all data required to build a Product object
        public Chatbot_Info(string ChatbotID, string ChatbotName, string ChatbotPrompt, string UserID)
        {
            _ChatbotID = ChatbotID;
            _ChatbotName = ChatbotName;
            _ChatbotPrompt = ChatbotPrompt;
            _UserID = UserID;
        }

        public int ChatbotInfoInsert()
        {
            int result = 0;

            string queryStr = "INSERT INTO ChatbotInfo(ChatbotName, ChatbotPrompt, UserID)"
                + " values (@ChatbotName, @ChatbotPrompt, @UserID)";

            SqlConnection conn = new SqlConnection(_connStr);

            SqlCommand cmd = new SqlCommand(queryStr, conn);

            cmd.Parameters.AddWithValue("@ChatbotName", this.ChatbotName);
            cmd.Parameters.AddWithValue("@ChatbotPrompt", this.ChatbotPrompt);
            cmd.Parameters.AddWithValue("@UserID", this.UserID);

            conn.Open();
            result += cmd.ExecuteNonQuery();
            conn.Close();
            return result;
        }

        public int ChatbotInfoUpdate(string ChatbotName, string ChatbotPrompt)
        {
            int nofRow = 0;
            string queryStr = "UPDATE ChatbotInfo SET" +
                " ChatbotName = @ChatbotName," +
                " ChatbotPrompt = @ChatbotPrompt," +
                " WHERE ChatbotName = @ChatbotName";

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@ChatbotName", ChatbotName);
                        cmd.Parameters.AddWithValue("@ChatbotPrompt", ChatbotPrompt);

                        conn.Open();
                        nofRow = cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.Write($"An SqlException has occurred - {ex}!");
                nofRow = -1;
            }
            catch (Exception ex)
            {
                Console.Write($"An Exception has occurred - {ex}!");
                nofRow = -2;
            }

            return nofRow;
        }


        internal int ChatbotInfoUpdate(string tid, string tname, decimal v)
        {
            throw new NotImplementedException();
        }

        //Below as the Class methods for some DB operations. 
        public Chatbot_Info getChatbotInfo(string ChatbotID)
        {

            Chatbot_Info ChatbotDetail = null;

            string ChatbotName, ChatbotPrompt, UserID;

            string queryStr = "SELECT * FROM ChatbotInfo WHERE ChatbotID = @ChatbotID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ChatbotID", ChatbotID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                ChatbotName = dr["ChatbotName"].ToString();
                ChatbotPrompt = dr["ChatbotPrompt"].ToString();
                UserID = dr["UserID"].ToString();


                ChatbotDetail = new Chatbot_Info(ChatbotID, ChatbotName, ChatbotPrompt, UserID);
            }
            else
            {
                ChatbotDetail = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ChatbotDetail;
        }
    }
}
