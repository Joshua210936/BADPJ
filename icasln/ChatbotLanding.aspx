<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ChatbotLanding.aspx.cs" Inherits="icasln.ChatbotLanding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <asp:Button ID="GoToChatbot" runat="server" Text="Chat" OnClick="GoToChatbot_Click" />

        <asp:Button ID="GoToCustomisation" runat="server" Text="Customise" OnClick="GoToCustomisation_Click"/>
    </form>
</asp:Content>
