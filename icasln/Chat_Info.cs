using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace icasln
{
    public class Chat_Info
    {

        //Private string _connStr = Properties.Settings.Default.DBConnStr;

        //System.Configuration.ConnectionStringSettings _connStr;
        string _connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        private string _Message_ID = null;
        private string _Message_Content = "";
        private string _Message_Role = ""; // this is another way to specify empty string

        // Default constructor
        public Chat_Info()
        {
        }

        // Constructor that take in all data required to build a Product object
        public Chat_Info(string Message_ID, string Message_Content, string Message_Role)
        {
            _Message_ID = Message_ID;
            _Message_Content = Message_Content;
            _Message_Role = Message_Role;
        }

       

        // Get/Set the attributes of the Product object.
        // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
        // This is for ease of referencing.
     
        public string Message_ID { get => _Message_ID; set => _Message_ID = value; }
        public string Message_Content { get => _Message_Content; set => _Message_Content = value; }
        public string Message_Role { get => _Message_Role; set => _Message_Role = value; }


        public int MessageInsert()
        {
            int result = 0;

            string queryStr = "INSERT INTO Message_Information(Message_Content, Message_Role)"
                + " values (@Message_Content, @Message_Role)";

            SqlConnection conn = new SqlConnection(_connStr);

            SqlCommand cmd = new SqlCommand(queryStr, conn);
                    
            cmd.Parameters.AddWithValue("@Message_Content", this.Message_Content);
            cmd.Parameters.AddWithValue("@Message_Role", this.Message_Role);

            conn.Open();
            result += cmd.ExecuteNonQuery();
            conn.Close();
            return result; 
        }
        //Below as the Class methods for some DB operations. 
        public Chat_Info getChat_Info(string Message_ID)
        {

            Chat_Info ChatInfoDetail = null;

            string Message_Content, Message_Role;
      
            string queryStr = "SELECT * FROM Message_Information WHERE Message_ID = @MsgID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@MsgID", Message_ID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Message_Content = dr["Message_Content"].ToString();
                Message_Role = dr["Message_Role"].ToString();
                

                ChatInfoDetail = new Chat_Info(Message_ID, Message_Content, Message_Role);
            }
            else
            {
                ChatInfoDetail = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ChatInfoDetail;
        }

        public List<Chat_Info> getMessageInfoAll()
        {
            List<Chat_Info> ChatInfoList = new List<Chat_Info>();

            string Message_ID, Message_Content, Message_Role;

            string queryStr = "SELECT * FROM Message_Information ORDER BY Message_Content";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Message_ID = dr["Message_ID"].ToString();
                Message_Content = dr["Message_Content"].ToString();
                Message_Role = dr["Message_Role"].ToString();

                Chat_Info a = new Chat_Info(Message_ID, Message_Content, Message_Role);
                ChatInfoList.Add(a);
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return ChatInfoList;
        }

      

    }
}
