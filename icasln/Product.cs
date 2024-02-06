using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace icasln
{
    public class Product
    {


        //Private string _connStr = Properties.Settings.Default.DBConnStr;

        //System.Configuration.ConnectionStringSettings _connStr;
        string _connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        private string _FirstName = null;
        private string _LastName = string.Empty;
        private string _Email = ""; // this is another way to specify empty string
        private string _Message = "";



        // Constructor that take in all data required to build a Product object
        public Product(string FirstName, string LastName, string Email, string Message)
        {
            _FirstName = FirstName;
            _LastName = LastName;
            _Email = Email;
            _Message = Message;

        }

        public Product()
        {
        }


        // Get/Set the attributes of the Product object.
        // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
        // This is for ease of referencing.
        public string FirstName
        {
            get { return _FirstName; }
            set { _FirstName = value; }
        }
        public string LastName
        {
            get { return _LastName; }
            set { _LastName = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string Message
        {
            get { return _Message; }
            set { _Message = value; }
        }





        //Below as the Class methods for some DB operations. 
        public Product getProduct(string prodID)
        {
            Product prodDetail = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@ProdID", prodID);

                        conn.Open();
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read())
                        {
                            string FirstName = dr["FirstName"].ToString();
                            string LastName = dr["LastName"].ToString();
                            string Email = dr["Email"].ToString();
                            string Message = dr["Message"].ToString();


                            prodDetail = new Product(FirstName, LastName, Email, Message);
                        }
                        else
                        {
                            prodDetail = null;
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.Write($"An SqlException have occurred - {ex}!");
                prodDetail = null;
            }
            catch (Exception ex)
            {
                Console.Write($"An Exception have occurred - {ex}!");
                prodDetail = null;
            }


            return prodDetail;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <returns>List of Products. null if Exception</returns>
        public List<Product> getProductAll()
        {
            List<Product> prodList = new List<Product>();

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    string queryStr = "SELECT * FROM Products Order By FirstName";
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        conn.Open();
                        SqlDataReader dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            string FirstName = dr["FirstName"].ToString();
                            string LastName = dr["LastName"].ToString();
                            string Email = dr["Email"].ToString();
                            string Message = dr["Message"].ToString();

                            Product a = new Product(FirstName, LastName, Email, Message);
                            prodList.Add(a);
                        }
                    }
                }
            }

            catch (SqlException ex)
            {
                Console.Write($"An SqlException have occurred - {ex}!");
                prodList = null;
            }
            catch (Exception ex)
            {
                Console.Write($"An Exception have occurred - {ex}!");
                prodList = null;
            }

            return prodList;
        }

        public int ProductInsert()
        {

            // string msg = null;
            int result = 0;


            try
            {
                string queryStr = "INSERT INTO Products(FirstName,LastName, Email, Message)"
                  + " values (@FirstName,@LastName, @Email, @Message)";


                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", this.FirstName);
                        cmd.Parameters.AddWithValue("@LastName", this.LastName);
                        cmd.Parameters.AddWithValue("@Email", this.Email);
                        cmd.Parameters.AddWithValue("@Message", this.Message);


                        conn.Open();
                        result += cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0

                    }
                }
            }
            catch (SqlException ex)
            {
                Console.Write($"An SqlException have occurred - {ex}!");
                result = -1;
            }
            catch (Exception ex)
            {
                Console.Write($"An Exception have occurred - {ex}!");
                result = -2;
            }
            finally
            {
                // TODO: Executed regardless of whether Exception or not.
            }

            return result;
        }//end Insert

        public int ProductDelete(string ID)
        {
            int nofRow = 0;
            try
            {
                string queryStr = "DELETE FROM Products WHERE FirstName=@ID";
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@ID", ID);
                        conn.Open();
                        nofRow = cmd.ExecuteNonQuery();
                        //  Response.Write("<script>alert('Delete successful');</script>");
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.Write($"An SqlException have occurred - {ex}!");
                nofRow = -1;
            }
            catch (Exception ex)
            {
                Console.Write($"An Exception have occurred - {ex}!");
                nofRow = -2;
            }
            return nofRow;
        }//end Delete

        public int ProductUpdate(string FirstName, string LastName, string Email, string Message)
        {
            int nofRow = 0;
            string queryStr = "UPDATE Products SET" +
                " FirstName = @firstname," +
                " LastName = @lastname," +
                " Email = @email," +
                " Message = @message" +
                " WHERE FirstName = @name";

            try
            {
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(queryStr, conn))
                    {
                        cmd.Parameters.AddWithValue("@firstname", FirstName);
                        cmd.Parameters.AddWithValue("@lastname", LastName);
                        cmd.Parameters.AddWithValue("@email", Email);
                        cmd.Parameters.AddWithValue("@message", Message);
                        cmd.Parameters.AddWithValue("@name", FirstName);

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


        internal int ProductUpdate(string tid, string tname, decimal v)
        {
            throw new NotImplementedException();
        }
    }

}

