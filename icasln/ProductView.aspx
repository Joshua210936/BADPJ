<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="icasln.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="view.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form runat="server">
    
        <asp:ImageButton ID="IB_Cart" runat="server" Image="CartBtn.jpeg" OnClick="IB_Cart_Click" Height="50px" Width="50px" ImageUrl="~/CartBtn.jpg" />
        <br />
        
    
        <asp:GridView ID="gvProduct" runat="server" CssClass="gridViewStyle" AutoGenerateColumns="False" OnSelectedIndexChanged="gvProduct_SelectedIndexChanged" DataKeyNames="Product_ID" OnRowDeleting="gvProduct_RowDeleting" OnRowCancelingEdit="gvProduct_RowCancelingEdit" OnRowEditing="gvProduct_RowEditing" OnRowUpdating="gvProduct_RowUpdating">
        <Columns>
            <asp:BoundField DataField="Product_ID" HeaderText="Product Ref" />
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
            <asp:BoundField DataField="Unit_Price" HeaderText="Product Price" />
            <asp:CommandField ControlStyle-CssClass="button" ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />

        </Columns>
    </asp:GridView>
    
    <br />
    <asp:Button ID="btn_AddProduct" CssClass="form-button" runat="server" Text="Add New Product" OnClick="btn_AddProduct_Click" />
    <br />
    <br />
    </form>         

    </asp:Content>
