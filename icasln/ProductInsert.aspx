<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ProductInsert.aspx.cs" Inherits="icasln.ProductInsert" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="insert.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        
    <div class="d-flex justify-content-center align-items-center" style="min-height: 80vh;">

    <div style ="background-color: rgba(0, 0, 34, 1); color: white; padding: 20px; border-radius: 10px;">

    <table class="auto-style2">
        <tr>
            <td>Product ID</td>
            <td>
                <asp:TextBox ID="tb_ProductID" runat="server" Width="450px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="rfv_ProductID" runat="server" ControlToValidate="tb_ProductID" ErrorMessage="Please enter Product ID." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Product Name</td>
            <td>
                <asp:TextBox ID="tb_ProductName" runat="server" Width="450px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="rfv_ProductName" runat="server" ControlToValidate="tb_ProductName" ErrorMessage="Please enter a product name." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Product Desc</td>
            <td>
                <asp:TextBox ID="tb_ProductDesc" runat="server" Rows="10" TextMode="MultiLine" Width="451px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="rfv_ProductDesc" runat="server" ControlToValidate="tb_ProductDesc" ErrorMessage="Please enter a description for the product." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Unit Price</td>
            <td>
                <asp:TextBox ID="tb_UnitPrice" runat="server" Width="450px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="rfv_UnitPrice" runat="server" ControlToValidate="tb_UnitPrice" ErrorMessage="Please enter a Unit Price for the product." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Stock Level</td>
            <td>
                <asp:TextBox ID="tb_StockLevel" runat="server" Width="450px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="rfv_StockLevel" runat="server" ControlToValidate="tb_StockLevel" ErrorMessage="Please enter a value for the Stock Value. " ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="cv_StockLevel" runat="server" ControlToValidate="tb_StockLevel" ErrorMessage="Only a Numeric Integer is allowed." ForeColor="Red" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>Product Image</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="450px" />
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="rfv_ProductImage" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Please select a Product Image." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lbl_Result" runat="server" ></asp:Label>
            </td>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btn_Insert" CssClass="form-button" runat="server" Text="Insert" OnClick="btn_Insert_Click" />
                <asp:Button ID="btn_ProductView" CssClass="form-button" runat="server" Text="View Product List" OnClick="btn_ProductView_Click" CausesValidation="False" />
            </td>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
    </table>
        </div>
    <asp:ValidationSummary id="ValidationSummary1" 
                       runat="server" 
                       ShowMessageBox="True" 
                       ShowSummary="False" />
        </div>
       
        </form>
</asp:Content>