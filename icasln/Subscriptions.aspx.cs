using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class Subscriptions : System.Web.UI.Page
    {
        Subscription aSub = new Subscription();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        protected void bind()
        {
            List<Subscription> subList = new List<Subscription>();
            subList = aSub.getSubscriptionAll();
            GVsubscirption.DataSource = subList;
            GVsubscirption.DataBind();
        }

        protected void GVsubscirption_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GVsubscirption.SelectedRow;

            // Get Product ID from the selected row, which is the 
            // first row, i.e. index 0.
            string subID = row.Cells[0].Text;

            // Redirect to next page, with the Product Id added to the URL,
            // e.g. ProductDetails.aspx?ProdID=1
            Response.Redirect("SubscriptionDetails.aspx?SubID=" + subID);

        }


        protected void btn_AddSubscription_Click(object sender, EventArgs e)
        {
            Response.Redirect("SubscriptionInsertt.aspx");
        }

        protected void GVsubscirption_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int result = 0;
            string subID = GVsubscirption.DataKeys[e.RowIndex].Value.ToString();
            result = aSub.SubscriptionDeactivate(subID);

            if (result > 0)
            {
                Response.Write("<script>alert('Subscription status updated to inactive');</script>");
            }
            else
            {
                Response.Write("<script>alert('Unable to update subscription status');</script>");
            }

            bind(); // Rebind the GridView to reflect changes
        }


        protected void GVsubscirption_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVsubscirption.EditIndex = e.NewEditIndex;
            bind();

        }

        protected void GVsubscirption_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVsubscirption.EditIndex = -1;
            bind();

        }

        protected void GVsubscirption_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int result = 0;
            Subscription sub = new Subscription();
            GridViewRow row = (GridViewRow)GVsubscirption.Rows[e.RowIndex];
            string id = GVsubscirption.DataKeys[e.RowIndex].Value.ToString();
            string tid = row.Cells[0].Text;
            string ttype = ((TextBox)row.Cells[1].Controls[0]).Text;
            string tprice = ((TextBox)row.Cells[2].Controls[0]).Text;
            string timage = ((TextBox)row.Cells[3].Controls[0]).Text;
            string tdesc = ((TextBox)row.Cells[4].Controls[0]).Text;

            result = sub.SubscriptionUpdate(tid , ttype, decimal.Parse(tprice) ,timage , tdesc);
            if (result > 0)
            {
                Response.Write("<script>alert('Product updated successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Product NOT updated');</script>");
            }
            GVsubscirption.EditIndex = -1;
            bind();

        }

    }
}