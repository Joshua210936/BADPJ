<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="AccountDetails.aspx.cs" Inherits="icasln.AccountDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <h2>Account Details</h2>
            <p>User ID: <asp:Label ID="lblUserId" runat="server" /></p>
            <p>First Name: <asp:TextBox ID="txtFirstName" runat="server" /></p>
            <p>Last Name: <asp:TextBox ID="txtLastName" runat="server" /></p>
            <p>Email: <asp:TextBox ID="txtEmail" runat="server" /></p>
            <p>Phone Number: <asp:TextBox ID="txtPhoneNumber" runat="server" /></p>
            <p>Gender: 
                <asp:RadioButtonList ID="rblGender" runat="server">
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Male" Value="Male" />
                </asp:RadioButtonList>
            </p>
            <asp:Label ID="lblErrorMessage" runat="server" Visible="false" ForeColor="Red" />
            <asp:Label ID="lblUpdateMessage" runat="server" Visible="false" ForeColor="Red" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</asp:Content>
