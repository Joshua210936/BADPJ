<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="icasln.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Login</h1>

    <form id="form1" runat="server">
        <div>
            <h2>Login</h2>
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            <br />
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" /><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" /><br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</asp:Content>
