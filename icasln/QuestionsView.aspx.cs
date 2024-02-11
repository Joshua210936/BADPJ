using icalsn;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class ProductView : System.Web.UI.Page
    {
        Questions aProd = new Questions();
        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO: Explain what is IsPostBack
            if (!IsPostBack)
            {
                bind();
            }
        }

        protected void bind()
        {
            //List<Product> listOfProduct = product.getProductAll();
            //this.gvProduct.DataSource = listOfProduct;
            //this.gvProduct.DataBind();


            List<Questions> prodList = new List<Questions>();
            prodList = aProd.getProductAll();
            gvProduct.DataSource = prodList;
            gvProduct.DataBind();

        }




        protected void btn_AddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuestionsInsert.aspx");
        }

        protected void gvProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int result = 0;
            Questions prod = new Questions();
            string categoryID = gvProduct.DataKeys[e.RowIndex].Value.ToString();
            result = prod.ProductDelete(categoryID);

            if (result > 0)
            {
                Response.Write("<script>alert('Product Remove successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Product Removal NOT successfully');</script>");
            }

            Response.Redirect("QuestionsView.aspx");

        }

        protected void gvProduct_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProduct.EditIndex = e.NewEditIndex;
            bind();
        }

        protected void gvProduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int result = 0;
            Questions prod = new Questions();
            GridViewRow row = (GridViewRow)gvProduct.Rows[e.RowIndex];
            string FirstName = gvProduct.DataKeys[e.RowIndex].Value.ToString();

            string LastName = ((TextBox)row.Cells[1].Controls[0]).Text;
            string Email = ((TextBox)row.Cells[2].Controls[0]).Text;
            string Message = ((TextBox)row.Cells[3].Controls[0]).Text;

            result = prod.ProductUpdate(FirstName, LastName, Email, Message);
            if (result > 0)
            {
                Response.Write("<script>alert('Product updated successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Product NOT updated');</script>");
            }
            gvProduct.EditIndex = -1;
            bind();

        }

        protected void gvProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Your code logic for the selected index changed event
        }


        protected void gvProduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProduct.EditIndex = -1;
            bind();
        }

    }

}