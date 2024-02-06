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

            // Check if Subscription Name is filled
            if (string.IsNullOrWhiteSpace(tb_Sub_Type.Text))
            {
                lbl_Result.Text = "Subscription Name is required.";
                return;
            }

            // Check if Subscription Description is filled
            if (string.IsNullOrWhiteSpace(tb_Sub_Desc.Text))
            {
                lbl_Result.Text = "Subscription Description is required.";
                return;
            }

            // Check if an image is uploaded
            if (!FileUpload1.HasFile)
            {
                lbl_Result.Text = "Subscription Image is required.";
                return;
            }
            else
            {
                image = "Images\\" + FileUpload1.FileName;
            }

            // Validate Subscription Price
            if (string.IsNullOrWhiteSpace(tb_Sub_Price.Text) || !decimal.TryParse(tb_Sub_Price.Text, out decimal price))
            {
                lbl_Result.Text = "Subscription Price is required and must be a valid number.";
                return;
            }
            else if (price < 0 || (decimal.Remainder(price * 100, 1) > 0))
            {
                lbl_Result.Text = "Subscription Price must be a positive number with up to two decimal places.";
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
                lbl_Result.Text = "Insert successful. File saved at: " + saveimg;
                // Additional code...
            }
            else
            {
                lbl_Result.Text = "Insert NOT successful.";
            }
        }

        protected void btn_SubView_Click(object sender, EventArgs e)
        {
            Response.Redirect("Subscriptions.aspx");
        }
    }
}