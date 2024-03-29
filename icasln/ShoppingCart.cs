﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace icasln
{
    public class ShoppingCart
    {
        public List<ShoppingCartItem> Items { get; private set; }

        //public static readonly ShoppingCart Instance;
        public static ShoppingCart Instance; // CYL: This is not the proper way to create a Shopping Cart since static means the value is shared across the entire Application ie Users across multiple computers and browsers are sharing the same Instance.

        // A Static Default ShoppingCart Constructor. Meaning developers need not use the New keyword.   CYL: This is a wrong usage of Static
        static ShoppingCart()
        {
            if (HttpContext.Current.Session["CSharpShoppingCart"] == null)
            {
                Instance = new ShoppingCart();
                //Instance.Items = new List<ShoppingCartItem>(); // YL: This should be done at the constructor side
                HttpContext.Current.Session["CSharpShoppingCart"] = Instance;
            }
            else
            {
                Instance = (ShoppingCart)HttpContext.Current.Session["CSharpShoppingCart"];
            }
        }

        // A Default ShoppingCart Constructor. 
        public ShoppingCart()
        {
            this.Items = new List<ShoppingCartItem>();
        }

        // Find a ShoppingCartItem inside the ShoppingCart Instance by providing a Product ID
        public ShoppingCartItem getAShopptingCartItem(string ProductID)
        {

            //ShoppingCartItem newItem = new ShoppingCartItem(ProductID, prod);

            if (!Items.Equals(null))
            {
                foreach (ShoppingCartItem item in Items)
                {
                    if (item.ItemID == ProductID)
                    {
                        return item;
                    }
                }
            }
            return null;
        }

        // Add a ShoppingCartItem into the ShoppingCart Instance by providing a Product ID and Product object
        public void AddItem(string ProductID, Product prod)
        {
            //ShoppingCartItem newItem = new ShoppingCartItem(ProductID);
            ShoppingCartItem newItem = new ShoppingCartItem(ProductID, prod);

            if (Items.Contains(newItem)) // YL: Take note that this is object comparison. Recommend to use ProductID for comparison instead.
            {
                foreach (ShoppingCartItem item in Items)
                {
                    if (item.Equals(newItem))
                    {
                        item.Quantity++;
                        return;
                    }
                }
            }
            else
            {
                newItem.Quantity = 1;
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

            foreach (ShoppingCartItem Item in Items)
            {
                if (Item.Equals(updatedItem))
                {
                    Item.Quantity = quantity;
                    return;
                }
            }
        }

        // Remove a ShoppingCartItem from the ShoppingCart Instance by providing a Product ID 
        public void RemoveItem(string ProductID)
        {
            Items.Remove(ShoppingCart.Instance.getAShopptingCartItem(ProductID));
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


    }

}
