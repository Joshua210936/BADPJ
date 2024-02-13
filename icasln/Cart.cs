using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace icasln
{
    public class Cart
    {
        string _connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        private string _prodID = null;
        private string _prodName = string.Empty;
        private decimal _unitPrice = 0;
        private string _prodImage = "";

        public Cart()
        {
        }

        public Cart(string prodID, string prodName, 
                       decimal unitPrice, string prodImage)
        {
            _prodID = prodID;
            _prodName = prodName;

            _unitPrice = unitPrice;
            _prodImage = prodImage;

        }

        public Cart(string prodName, 
               decimal unitPrice, string prodImage)
            : this(null, prodName, unitPrice, prodImage)
        {
        }

        public string Product_ID
        {
            get { return _prodID; }
            set { _prodID = value; }
        }
        public string Product_Name
        {
            get { return _prodName; }
            set { _prodName = value; }
        }
        public decimal Unit_Price
        {
            get { return _unitPrice; }
            set { _unitPrice = value; }
        }
        public string Product_Image
        {
            get { return _prodImage; }
            set { _prodImage = value; }
        }

        public Cart getProduct(string prodID)
        {

            Cart prodDetail = null;

            string prod_Name, Prod_Image;
            decimal unit_Price;


            string queryStr = "SELECT * FROM Products WHERE Product_ID = @ProdID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProdID", prodID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                prod_Name = dr["Product_Name"].ToString();

                Prod_Image = dr["Product_Image"].ToString();
                unit_Price = decimal.Parse(dr["Unit_Price"].ToString());


                prodDetail = new Cart(prodID, prod_Name, unit_Price, Prod_Image);
            }
            else
            {
                prodDetail = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prodDetail;
        }
    }

}