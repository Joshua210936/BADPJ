<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="AccountDetails.aspx.cs" Inherits="icasln.AccountDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">
        <div>
            <h2>Account Details</h2>
            <p>User ID: <asp:Label ID="lblUserId" runat="server" /></p>
            <p>First Name: <asp:Label ID="lblFirstName" runat="server" /></p>
            <p>Last Name: <asp:Label ID="lblLastName" runat="server" /></p>
            <p>Email: <asp:Label ID="lblEmail" runat="server" /></p>
            <p>Phone Number: <asp:Label ID="lblPhoneNumber" runat="server" /></p>
            <p>Gender: <asp:Label ID="lblGender" runat="server" /></p>
            <asp:Label ID="lblErrorMessage" runat="server" Visible="false" ForeColor="Red" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</asp:Content>
