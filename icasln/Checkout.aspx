<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="icasln.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="checkout.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        
        
        <div class="container1">
            <h2>Checkout Details</h2>
        <div>
            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="txtAddress">Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div>
            <label for="txtCardNumber">Card Number:</label>
            <asp:TextBox ID="txtCardNumber" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexCardNumber" runat="server" 
                ControlToValidate="txtCardNumber" 
                ErrorMessage="Invalid card number" 
                ValidationExpression="^\d{16}$" /> <!-- Adjust regex as needed -->
        </div>
        <div>
            <label for="txtExpirationDate">Expiration Date (MM/YY):</label>
            <asp:TextBox ID="txtExpirationDate" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexExpirationDate" runat="server" 
                ControlToValidate="txtExpirationDate" 
                ErrorMessage="Invalid expiration date" 
                ValidationExpression="^(0[1-9]|1[0-2])\/?([0-9]{2})$" />
        </div>
        <div>
            <label for="txtCVV">CVV:</label>
            <asp:TextBox ID="txtCVV" runat="server" MaxLength="4"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexCVV" runat="server" 
                ControlToValidate="txtCVV" 
                ErrorMessage="Invalid CVV" 
                ValidationExpression="^\d{3,4}$" />
        </div>
        <br />
        
        <div>
            <asp:Button ID="btnConfirm" runat="server" CssClass="form-button" Text="Confirm Order" OnClick="btnConfirm_Click" />
            <asp:Button ID="btnCancel" runat="server" CssClass="form-button" Text="Cancel" OnClick="btnCancel_Click" />
        </div>
            </div>
    </form>
</asp:Content>
