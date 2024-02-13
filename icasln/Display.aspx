<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="icasln.Display" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="display.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form runat="server">
        <div class="container1">
        <asp:ImageButton ID="IB_Cart" runat="server" CssClass="viewCart" Image="CartBtn.jpeg" OnClick="IB_Cart_Click" Height="50px" Width="50px" ImageUrl="~/CartBtn.jpg" />
        <br />
        
    
        <asp:GridView ID="gvProduct" runat="server" CssClass="gridViewStyle" AutoGenerateColumns="False" OnSelectedIndexChanged="gvProduct_SelectedIndexChanged" DataKeyNames="Product_ID">
        <Columns>


            <asp:BoundField DataField="Product_ID" HeaderText="Product Ref" />
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
            <asp:BoundField DataField="Unit_Price" HeaderText="Product Price" />

            
            <asp:CommandField ControlStyle-CssClass="button" ShowSelectButton="True" />

        </Columns>
    </asp:GridView>
    
            </div>
    </form>         

    </asp:Content>
