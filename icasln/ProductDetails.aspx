<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="icasln.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 50px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
    <h2>PRODUCT DETAILS</h2>
    <table class="w-50">
        <tr>
            <td rowspan="3">
                <asp:Image ID="img_Product" runat="server" Height="100px" Width="100px" />
            </td>
            <td class="auto-style1">
                <strong>
                Product Name (ID):
                    </strong>
                <asp:Label ID="lbl_ProdName" runat="server" Text="lbl_ProdName"></asp:Label>
                (<asp:Label ID="lbl_ProdID" runat="server"></asp:Label>
                )<br />

                <strong>
                Product Description:
                    </strong>
            <asp:Label ID="lbl_ProdDesc" runat="server"></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <strong>
                    Price:
                    </strong>

                    <asp:Label ID="lbl_Price" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btn_Add" runat="server" Text="Add to Cart" OnClick="btn_Add_Click" />
                
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
