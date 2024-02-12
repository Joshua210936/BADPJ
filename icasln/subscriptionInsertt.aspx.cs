using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class subscriptionInsertt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Insert_Click(object sender, EventArgs e)
        {
            // Initialize result variable
            int result = 0;
            string image = "";

            // Function to set error message with red color
            Action<string> setError = (message) =>
            {
                lbl_Result.ForeColor = System.Drawing.Color.Red;
                lbl_Result.Text = message;
            };

            // Function to set success message with green color
            Action<string> setSuccess = (message) =>
            {
                lbl_Result.ForeColor = System.Drawing.Color.Green;
                lbl_Result.Text = message;
            };

            // Check if Subscription Name is filled
            if (string.IsNullOrWhiteSpace(tb_Sub_Type.Text))
            {
                setError("Subscription Name is required.");
                return;
            }

            // Check if Subscription Description is filled
            if (string.IsNullOrWhiteSpace(tb_Sub_Desc.Text))
            {
                setError("Subscription Description is required.");
                return;
            }

            // Check if an image is uploaded
            if (!FileUpload1.HasFile)
            {
                setError("Subscription Image is required.");
                return;
            }
            else
            {
                image = "Images\\" + FileUpload1.FileName;
            }

            // Validate Subscription Price
            if (string.IsNullOrWhiteSpace(tb_Sub_Price.Text) || !decimal.TryParse(tb_Sub_Price.Text, out decimal price))
            {
                setError("Subscription Price is required and must be a valid number.");
                return;
            }
            else if (price < 0 || (decimal.Remainder(price * 100, 1) > 0))
            {
                setError("Subscription Price must be a positive number with up to two decimal places.");
                return;
            }

            // Proceed with subscription insertion
            Subscription sub = new Subscription
            {
                Sub_Type = tb_Sub_Type.Text,
                Sub_Desc = tb_Sub_Desc.Text,
                Sub_Image = FileUpload1.FileName,
                Sub_Price = price
            };

            result = sub.SubscriptionInsert();

            if (result > 0)
            {
                string saveimg = Server.MapPath(" ") + "\\" + image;
                FileUpload1.SaveAs(saveimg);
                setSuccess("Insert successful. File saved at: " + saveimg);
                // Additional code...
            }
            else
            {
                setError("Insert NOT successful.");
            }
        }

        protected void btn_SubView_Click(object sender, EventArgs e)
        {
            Response.Redirect("Subscriptions.aspx");
        }
    }
}