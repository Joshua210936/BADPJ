<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="icasln.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
        <h2>Forgot Password</h2>
        <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>    
        <asp:Button ID="btnChangePassword" runat="server" Text="Send Email" OnClick="btnChangePassword_Click" />
            <asp:Label ID="LabelLink" runat="server" Visible="true" ForeColor="Red" />
        </div>
        </form>
</asp:Content>

