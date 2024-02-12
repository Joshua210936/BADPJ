<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ChatbotCustomisation.aspx.cs" Inherits="icasln.ChatbotCustomisation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="chatbot.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <% if (isPremiumUser) { %>
                    <!-- Display Premium content -->
                    <div class="Premium">
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
                    </div>
                    <% } else { %>
                    <!-- Display Non-Premium content -->
                    <div class="Non-Premium">
                        <h1 style="text-align:center;">Create Chatbot(Non-Premium)</h1>
                        <div>
                            <label for="ChatbotList">Choose a Personality</label>
                            <asp:DropDownList id="ChatbotList" runat="server">
                                <asp:ListItem Selected="True" Value="Chef"> Chef </asp:ListItem>
                                <asp:ListItem Value="BoonKeng"> Boon Keng </asp:ListItem>
                                <asp:ListItem Value="OldMan"> Old Man </asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button type="button" ID="Button4" runat="server" Text="Select" OnClick="SelectPersonalityButton_Click"  />
                        </div>
                        <h1 style="text-align:center;">Create Chatbot(Non-Premium)</h1>
                        <div>
                            <label for="ChatbotUpdateList">Choose a New Personality</label>
                            <asp:DropDownList id="ChatbotUpdateList" runat="server">
                                <asp:ListItem Selected="True" Value="Chef"> Chef </asp:ListItem>
                                <asp:ListItem Value="BoonKeng"> Boon Keng </asp:ListItem>
                                <asp:ListItem Value="OldMan"> Old Man </asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button type="button" ID="Button5" runat="server" Text="Select" OnClick="SelectNewPersonalityButton_Click"  />
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
