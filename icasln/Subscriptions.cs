using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace icasln
{
    public class Subscription
    {
        private string _connStr = ConfigurationManager.ConnectionStrings["companibotDBContext"].ConnectionString;
        private string _subID = null;
        private string _subType = string.Empty;
        private string _subDesc = "";
        private string _subImage = "";
        private decimal _subPrice = 0;
        private string _subStatus = "";



        // Default constructor
        public Subscription()
        {
        }

        // Constructor with all parameters
        public Subscription(string subID, string subType, string subDesc, string subImage, decimal subPrice , string subStatus)
        {
            _subID = subID;
            _subType = subType;
            _subDesc = subDesc;
            _subImage = subImage;
            _subPrice = subPrice;
            _subStatus = subStatus;
        }

        // Properties
        public string Sub_ID
        {
            get { return _subID; }
            set { _subID = value; }
        }
        public string Sub_Type
        {
            get { return _subType; }
            set { _subType = value; }
        }
        public string Sub_Desc
        {
            get { return _subDesc; }
            set { _subDesc = value; }
        }
        public string Sub_Image
        {
            get { return _subImage; }
            set { _subImage = value; }
        }
        public decimal Sub_Price
        {
            get { return _subPrice; }
            set { _subPrice = value; }
        }
        public string Sub_Status
        {
            get { return _subStatus; }
            set { _subStatus = value; }
        }


        // Method to get a single subscription by ID
        public Subscription getSubscription(string subID)
        {
            Subscription subDetail = null;

            string queryStr = "SELECT * FROM Subscriptions WHERE Sub_ID = @SubID";

            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("@SubID", subID);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string sub_Type = dr["Sub_Type"].ToString();
                    string sub_Desc = dr["Sub_Desc"].ToString();
                    string sub_Image = dr["Sub_Image"].ToString();
                    decimal sub_Price = decimal.Parse(dr["Sub_Price"].ToString());
                    string sub_Status = dr["Sub_Status"].ToString();

                    subDetail = new Subscription(subID, sub_Type, sub_Desc, sub_Image, sub_Price, sub_Status);
                }

                dr.Close();
            }

            return subDetail;
        }


        // Method to get all subscriptions
        public List<Subscription> getSubscriptionAll()
        {
            List<Subscription> subList = new List<Subscription>();

            string sub_ID, sub_Type, sub_Desc, sub_Image;
            decimal sub_Price;

            string queryStr = "SELECT * FROM Subscriptions ORDER BY Sub_Type";

            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                SqlCommand cmd = new SqlCommand(queryStr, conn);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    sub_ID = dr["Sub_ID"].ToString();
                    sub_Type = dr["Sub_Type"].ToString();
                    sub_Desc = dr["Sub_Desc"].ToString();
                    sub_Image = dr["Sub_Image"].ToString();
                    sub_Price = decimal.Parse(dr["Sub_Price"].ToString());
                    string sub_Status = dr["Sub_Status"].ToString();

                    Subscription sub = new Subscription(sub_ID, sub_Type, sub_Desc, sub_Image, sub_Price, sub_Status);
                    subList.Add(sub);

                    
                }

                dr.Close();
            }

            return subList;
        }

        // Additional methods for Insert, Delete, Update can be added here
        public int SubscriptionInsert()
        {

            // string msg = null;
            int result = 0;

            string queryStr = "INSERT INTO Subscriptions(Sub_Type, Sub_Desc,Sub_Image , Sub_Price)"
                + " values (@Sub_Type, @Sub_Desc, @Sub_Image ,@Sub_Price)";
            //+ "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image,@Stock_Level)";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
          
            cmd.Parameters.AddWithValue("@Sub_Type", this.Sub_Type);
            cmd.Parameters.AddWithValue("@Sub_Desc", this.Sub_Desc);
            cmd.Parameters.AddWithValue("@Sub_Image", this.Sub_Image);
            cmd.Parameters.AddWithValue("@Sub_Price", this.Sub_Price);
       

            conn.Open();
            result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();

            return result;
        }//end Insert

        public int SubscriptionDeactivate(string ID)
        {
            string queryStr = "UPDATE Subscriptions SET Sub_Status = 'inactive' WHERE Sub_ID = @ID";
            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("@ID", ID);
                conn.Open();
                int nofRow = cmd.ExecuteNonQuery();
                conn.Close();
                return nofRow;
            }
        }//end deactivate subscription

        public int SubscriptionUpdate( string sID ,string sName, decimal sUnitPrice, string sImage, string sDesc)
        {
            string queryStr = "UPDATE Subscriptions SET " +
                               // corrected table name from Subscription to Subscriptions
                               "Sub_Type = @subscriptiontype, " +
                               "Sub_Price = @subscriptionPrice, " + // added missing comma
                               "Sub_Image = @subscriptionImage, " +
                               "Sub_Desc = @subscriptionDesc " + // added missing comma
                               " WHERE Sub_ID = @subscriptionID"; // removed extra space
                               // corrected syntax

            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                SqlCommand cmd = new SqlCommand(queryStr, conn);

                cmd.Parameters.AddWithValue("@subscriptionID", sID);
                cmd.Parameters.AddWithValue("@subscriptiontype", sName);
                cmd.Parameters.AddWithValue("@subscriptionPrice", sUnitPrice);
                cmd.Parameters.AddWithValue("@subscriptionImage", sImage);
                cmd.Parameters.AddWithValue("@subscriptionDesc", sDesc);

                conn.Open();
                int nofRow = cmd.ExecuteNonQuery();
                conn.Close();

                return nofRow;
            }
        }



    }
}