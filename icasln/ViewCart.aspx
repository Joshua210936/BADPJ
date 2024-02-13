<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="icasln.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="cart.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="container1">
        <asp:GridView ID="gv_CartView" CssClass="gridViewStyle" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" OnRowCommand="gv_CartView_RowCommand">
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="Product ID"></asp:BoundField>
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name"></asp:BoundField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="tb_Quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                    <br />
                    <asp:LinkButton ID="btn_Remove" runat="server" CommandArgument='<%# Eval("ItemID") %>' CommandName="Remove">Remove</asp:LinkButton>
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Product_Price" DataFormatString="{0:C}" HeaderText="Unit Price"></asp:BoundField>
            <asp:BoundField DataField="TotalPrice" DataFormatString="{0:C}" HeaderText="Price"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <br />
    <div class="totalPrice">Total Price:$
    <asp:Label ID="lbl_TotalPrice"  runat="server"></asp:Label>
    </div>
    <br />
    <asp:Label ID="lbl_Error" runat="server"></asp:Label>
    <br />
    <div>
        <asp:Button ID="btn_Update" CssClass="form-button" runat="server" Text="Update" OnClick="btn_Update_Click" />
        <asp:Button ID="btn_Clear" CssClass="form-button" runat="server" Text="Clear" OnClick="btn_Clear_Click" />
        <asp:Button ID="btn_Back" CssClass="form-button" runat="server" Text="Back" OnClick="btn_Back_Click" />
        <asp:Button ID="CheckoutButton" CssClass="CheckoutButton" runat="server" Text="Checkout" OnClick="bth_Checkout_Click" />
        <br /></div>
            </div>
   </form>
  
</asp:Content>
