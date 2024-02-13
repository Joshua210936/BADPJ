<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="icasln.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 50px;
            padding-top:50px;
        }
        .auto-style2 {
            width: 330px;
        }
        .auto-style3 {
            padding:50px;
        }
        .auto-style4 {
            padding-bottom: 50px;   
        }
    </style>
        <link href="details.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form runat="server">
        <div class="container1">
            
            <table class="table1">

                <tr>
                    <td rowspan="3" class="auto-style2">
                        <asp:Image ID="img_Product" runat="server" Height="300px" Width="300px" CssClass="auto-style3" />
                    </td>
                    <td class="auto-style1">
                        <strong>
                        Product Name (ID):
                            </strong>
                        <asp:Label ID="lbl_ProdName" runat="server" Text="lbl_ProdName"></asp:Label>
                        (<asp:Label ID="lbl_ProdID" runat="server"></asp:Label>)
                        <br />
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
                    <td class="auto-style4">
                        <strong>
                            Price:
                            </strong>
                            <asp:Label ID="lbl_Price" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="btn_Add" class="form-button" runat="server" Text="Add to Cart" OnClick="btn_Add_Click" />
                    </td>
                </tr>

            </table>
                
        </div>
            </form>
    
</asp:Content>
