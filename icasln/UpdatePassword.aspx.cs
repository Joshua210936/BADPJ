using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace icasln
{
    public partial class UpdatePassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userId = HttpContext.Current.Request.QueryString["userId"];
            string uniquelink = HttpContext.Current.Request.QueryString["uniquelink"];

            Dictionary<string, string> uniqueLinkMap = new Dictionary<string, string>();

            uniqueLinkMap = GetUserForPasswordChange(userId);

            if (uniqueLinkMap["UniqueLink"] == uniquelink && uniqueLinkMap["IsChangePassword"] == "True")
            {
                Console.WriteLine("Eligible for password change");

            }
            else
            {
                Response.Redirect("Home.aspx");
            }

        }

        public Dictionary<string, string> GetUserForPasswordChange(string userid)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CompanibotDBContext"].ConnectionString;
            string query = "SELECT UniqueLink, IsChangePassword FROM UserAccount WHERE UserId = @userid";

            Dictionary<string, string> uniqueLinkMap = new Dictionary<string, string>();

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userid", userid);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        String strLink = reader["UniqueLink"].ToString();
                        String strisPasswordChange = reader["IsChangePassword"].ToString();

                        uniqueLinkMap["UniqueLink"] = strLink;
                        uniqueLinkMap["IsChangePassword"] = strisPasswordChange;

                        /*
                        UniqueLink = reader["UniqueLink"].ToString(),
                        Email = reader["Email"].ToString(),
                        PhoneNumber = reader["PhoneNumber"].ToString(),
                        Gender = reader["Gender"].ToString(),
                        IsAdmin = Convert.ToBoolean(reader["IsAdmin"])

                        */

                    }
                }
            }

            return uniqueLinkMap;
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string newpassword = txtNewPassword.Text.Trim();
            string confirmpassword = txtConfirmPassword.Text.Trim();
            if (newpassword == confirmpassword)
            {
                // update the password in the database
                string userId = HttpContext.Current.Request.QueryString["userId"];
                User customer = new User();
                customer.UpdatePassword(userId, newpassword);

                lblMessage.Text = "password updated successfully.";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Text = "passwords do not match.";
                lblMessage.Visible = true;
                return;
            }


        }


    }
}