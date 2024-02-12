using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace icasln
{
    /// <summary>
    /// Contains all the constants value used in the project
    /// </summary>
    public static class Constants // TODO: Explain why static class
    {
        // Database connection string
        public static readonly string DB_CONNECTION_STRING = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
        // Page Redirection URL
        public static readonly String PAGE_URL_HOME = "Home.aspx";
        public static readonly String PAGE_URL_LOGIN = "UserLogin.aspx";
        public static readonly String PAGE_URL_REGISTRATION = "Registration_Form.aspx";
        public static readonly String PAGE_URL_THANK_YOU = "ThankYou_Form.aspx";
        public static readonly String PAGE_URL_VIEW_CART = "ViewCart.aspx";
        public static readonly String PAGE_URL_PRODUCT_VIEW = "ProductView.aspx";
        public static readonly String PAGE_URL_PRODUCT_INSERT = "ProductInsert.aspx";
        public static readonly String PAGE_URL_PRODUCT_DETAILS = "ProductDetails.aspx";
        // SESSION Key
        public static readonly string SESSION_KEY_NAME = "SESSION_KEY_NAME";
        public static readonly string SESSION_KEY_NRIC = "SESSION_KEY_NRIC";
        public static readonly string SESSION_KEY_HP = "SESSION_KEY_HP";
        public static readonly string SESSION_KEY_EMAIL = "SESSION_KEY_EMAIL";
        public static readonly string SESSION_KEY_GENDER = "SESSION_KEY_GENDER";
        public static readonly string SESSION_KEY_NOTIFICATION = "SESSION_KEY_NOTIFICATION";
        public static readonly string SESSION_KEY_BIRTHDAY = "SESSION_KEY_BIRTHDAY";
        public static readonly string SESSION_KEY_CUSTOMER_CREATED = "SESSION_KEY_CUSTOMER_CREATED";

        public static readonly string SESSION_KEY_SHOPPING_CART = "MyPersonalShoppingCart";
    }

}