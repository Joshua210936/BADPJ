<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ChatbotCustomisation.aspx.cs" Inherits="icasln.ChatbotCustomisation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="chatbot.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 style="text-align:center;">Create Chatbot</h1>
    <div class="container">
        <div class="row">
            <div class="col-3">
                <asp:Button type="button" ID="Button1" runat="server" Text="Back" OnClick="BackButton_Click"  />
            </div>
            <div class="col-6">
                <div>
                    <label for="CustomiseInformationTextbox">Create Prompt</label>
                    <asp:TextBox ID="CustomiseInformationTextbox" runat="server"/>
                    <br />
                    <label for="ChatbotNameTextbox">Create Chatbot Name</label>
                    <asp:TextBox ID="ChatbotNameTextbox" runat="server"/>
                    <asp:Button type="button" ID="Button2" runat="server" Text="Customise" OnClick="CustomiseInformationButton_Click"  />
                </div>
            <h1 style="text-align:center;">Update Chatbot</h1>
                <div>
                    <label for="UpdatePromptTextbox">Update Prompt</label>
                    <asp:TextBox ID="UpdatePromptTextbox" runat="server"/>
                    <br />
                    <label for="UpdateNameTextbox">Update Chatbot Name</label>
                    <asp:TextBox ID="UpdateNameTextbox" runat="server"/>
                    <asp:Button type="button" ID="Button3" runat="server" Text="Update" OnClick="UpdateInformationButton_Click"  />
                </div>
            </div>
            <div class="col-3">

            </div>
        </div>
    </div>
        </form>
</asp:Content>
