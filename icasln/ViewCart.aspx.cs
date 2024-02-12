using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icasln
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }

        }
        protected void LoadCart()
        {
            #region True Session Cart
            var myShoppingCart = ProperShoppingCart.GetSessionCart();
            if (myShoppingCart == null)
            {
                myShoppingCart = new ProperShoppingCart(); // to ensure something to bind
            }
            gv_CartView.DataSource = myShoppingCart.Items;
            gv_CartView.DataBind();
            lbl_TotalPrice.Text = myShoppingCart.GetSubTotal().ToString("c");
            #endregion

            //bind the Items inside the Session/ShoppingCart Instance with the Datagrid
            gv_CartView.DataSource = ShoppingCart.Instance.Items;
            gv_CartView.DataBind();

            decimal total = 0.0m;
            foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
            {
                total = total + item.TotalPrice;
            }
            lbl_TotalPrice.Text = total.ToString();
        }


        protected void gv_CartView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (String.Compare(e.CommandName, "Remove", true) == 0) // Use this for String comparison instead of ==
            {
                lbl_Error.Text = "Message : " + e.CommandArgument.ToString();
                string productId = e.CommandArgument.ToString();
                ShoppingCart.Instance.RemoveItem(productId);

                #region True Session Cart
                var myShoppingCart = ProperShoppingCart.GetSessionCart();
                if (myShoppingCart != null)
                {
                    myShoppingCart.RemoveItem(productId);
                }
                //Session[Constants.SESSION_KEY_SHOPPING_CART] = myShoppingCart;
                #endregion

                LoadCart();
            }
        }


        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect(icasln.Constants.PAGE_URL_PRODUCT_VIEW);
        }

        protected void btn_Clear_Click(object sender, EventArgs e)
        {
            #region True Session Cart
            var myShoppingCart = ProperShoppingCart.GetSessionCart();
            if (myShoppingCart != null)
            {
                myShoppingCart.ClearCart();
            }
            //Session[Constants.SESSION_KEY_SHOPPING_CART] = myShoppingCart;
            #endregion

            ShoppingCart.Instance.Items.Clear();
            LoadCart();
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {

            #region True Session Cart
            var myShoppingCart = ProperShoppingCart.GetSessionCart();
            #endregion

            foreach (GridViewRow row in gv_CartView.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    try
                    {
                        string productId = gv_CartView.DataKeys[row.RowIndex].Value.ToString();
                        //row.Cells[2] means that the quantity textbox must be in column 3.
                        int quantity = int.Parse(((TextBox)row.Cells[2].FindControl("tb_Quantity")).Text);
                        ShoppingCart.Instance.SetItemQuantity(productId, quantity);

                        #region True Session Cart
                        myShoppingCart.SetItemQuantity(productId, quantity);
                        #endregion
                    }
                    catch (FormatException e1)
                    {
                        lbl_Error.Text = e1.Message.ToString();
                    }
                }
            }
            LoadCart();
        }
    }
}