using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class SignUpaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Generate a new unique user ID and assign it to the hidden field
                hf_UserId.Value = Guid.NewGuid().ToString();
            }
        }
        protected void btn_Insert_Click(object sender, EventArgs e)
        {
            int result = 0;

            // Replace tb_ with meaningful names based on your form
            User newUser = new User(
                hf_UserId.Value,
                tb_FirstName.Text,
                tb_LastName.Text,
                tb_Email.Text,
                tb_PhoneNumber.Text,
                rbl_Gender.Text,
                tb_Password.Text
            );

            // Call the appropriate method in your User class
            result = newUser.InsertUser();

            if (result > 0)
            {
                // Additional logic for successful insert
                

                Response.Write("<script>alert('Account Creation Successful');</script>");
                System.Threading.Thread.Sleep(3000);
                Response.Redirect("~/Premium.aspx");


            }
            else
            {
                // Additional logic for unsuccessful insert
                Response.Write("<script>alert('Unable to create account');</script>");
            }
        }

    }   
}