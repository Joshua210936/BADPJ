using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Web;

namespace icasln
{
    public class ProperShoppingCart
    {

        public static ProperShoppingCart GetSessionCart()
        {
            return HttpContext.Current.Session[icasln.Constants.SESSION_KEY_SHOPPING_CART] as ProperShoppingCart;
        }


        public ProperShoppingCart()
        {
            this.items = new List<ShoppingCartItem>();
        }

        private List<ShoppingCartItem> items;

        public List<ShoppingCartItem> Items
        {
            get
            {
                return items;
            }

            private set
            {
                items = value;
            }
        }

        public void AddItem(string ProductID, Product prod)
        {

            // Determine if a similar item is already in the cart or requires a new row
            bool itemUpdatedToCart = false;
            foreach (ShoppingCartItem item in Items)
            {
                if (String.Compare(ProductID, item.ItemID, StringComparison.OrdinalIgnoreCase) == 0) // Item already in the Shopping Cart, just increment count
                {
                    item.Quantity++;
                    itemUpdatedToCart = true;
                    break;
                }
            }
            if (!itemUpdatedToCart)
            {
                //ShoppingCartItem newItem = new ShoppingCartItem(ProductID);
                ShoppingCartItem newItem = new ShoppingCartItem(ProductID, prod)
                {
                    Quantity = 1,
                };
                Items.Add(newItem);
            }
        }

        public void SetItemQuantity(string ProductID, int quantity)
        {
            if (quantity == 0)
            {
                RemoveItem(ProductID);
                return;
            }

            ShoppingCartItem updatedItem = new ShoppingCartItem(ProductID);

            foreach (ShoppingCartItem item in Items)
            {
                if (String.Compare(ProductID, item.ItemID, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    item.Quantity = quantity;
                    return;
                }
            }
        }

        // Remove a ShoppingCartItem from the ShoppingCart Instance by providing a Product ID 
        public void RemoveItem(string ProductID)
        {
            //Items.Remove(ShoppingCart.Instance.getAShopptingCartItem(ProductID));

            ShoppingCartItem itemToRemove = null;
            foreach (ShoppingCartItem item in Items)
            {
                if (String.Compare(ProductID, item.ItemID, StringComparison.OrdinalIgnoreCase) == 0) // Item already in the Shopping Cart, just increment count
                {
                    itemToRemove = item;
                    break;
                }
            }
            if (itemToRemove != null)
            {
                this.Items.Remove(itemToRemove);
            }
            else
            {
                // Nothing to remove. Can consider returning something for a pop-up message.
            }
        }

        public decimal GetSubTotal()
        {
            decimal subTotal = 0;
            foreach (ShoppingCartItem item in Items)
            {
                subTotal += item.TotalPrice;
            }
            return subTotal;
        }

        public void ClearCart()
        {
            this.Items.Clear();
        }

    }
}