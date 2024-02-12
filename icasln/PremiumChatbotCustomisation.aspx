<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="PremiumChatbotCustomisation.aspx.cs" Inherits="icasln.PremiumChatbotCustomisation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <h1 style="text-align:center;">Create Chatbot (Premium)</h1>
        <div>
            <label for="CustomiseInformationTextbox">Create Prompt</label>
            <asp:TextBox ID="CustomiseInformationTextbox" runat="server"/>
            <br />
            <label for="ChatbotNameTextbox">Create Chatbot Name</label>
            <asp:TextBox ID="ChatbotNameTextbox" runat="server"/>
            <asp:Button type="button" ID="Button2" runat="server" Text="Create" OnClick="CustomiseInformationButton_Click"  />
        </div>
            <h1 style="text-align:center;">Update Chatbot (Premium)</h1>
        <div>
            <label for="UpdatePromptTextbox">Update Prompt</label>
            <asp:TextBox ID="UpdatePromptTextbox" runat="server"/>
            <br />
            <label for="UpdateNameTextbox">Update Chatbot Name</label>
            <asp:TextBox ID="UpdateNameTextbox" runat="server"/>
            <asp:Button type="button" ID="Button3" runat="server" Text="Update" OnClick="UpdateInformationButton_Click"  />
        </div>
    </form>
</asp:Content>
