<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ChatbotCustomisation.aspx.cs" Inherits="icasln.ChatbotCustomisation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="chatbotcustomisation.css">
    <script type="text/javascript">
        function showAlert(message) {
            alert(message);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <% if (isPremiumUser) { %>
                        <!-- Display Premium content -->
                        <div class="Premium">
                            <% if (chatbotCreated) { %>
                                <!-- Display Update functions -->
                            <h1 style="text-align:center; margin-bottom:20px;margin-top:20px;">Update Chatbot (Premium)</h1>
                            <div class="container">
                                <div class="row background">
                                    <div class="col">
                                        <img src="companibot.jpeg" height="200" width="200"/>
                                    </div>
                                    <div class="col">
                                        
                                        <div>
                                            <label for="UpdatePromptTextbox">Update Prompt</label>
                                            <asp:TextBox ID="UpdatePromptTextbox" runat="server"/>
                                            <br />
                                            <label for="UpdateNameTextbox">Update Chatbot Name</label>
                                            <asp:TextBox ID="UpdateNameTextbox" runat="server"/>
                                            <asp:Button type="button" ID="Button3" runat="server" Text="Update" OnClick="UpdateInformationButton_Click" OnClientClick="showAlert('Chatbot Updated!');" class="form-button"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } else { %>
                                <!-- Display Create functions -->
                                <h1 style="text-align:center; margin-bottom:20px;margin-top:20px;">Create Chatbot (Premium)</h1>
                            <div class="container">
                                <div class="row background">
                                    <div class="col">
                                        <img src="companibot.jpeg" height="200" width="200"/>
                                    </div>
                                    <div class="col">
                                <div>
                                    <label for="CustomiseInformationTextbox">Create Prompt</label>
                                    <asp:TextBox ID="CustomiseInformationTextbox" runat="server"/>
                                    <br />
                                    <label for="ChatbotNameTextbox">Create Chatbot Name</label>
                                    <asp:TextBox ID="ChatbotNameTextbox" runat="server"/>
                                    <asp:Button type="button" ID="Button2" runat="server" Text="Create" OnClick="CustomiseInformationButton_Click" OnClientClick="showAlert('Chatbot Created!');" class="form-button" />
                                </div>
                                        </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    <% } else { %>
                        <!-- Display Non-Premium content -->
                        <!-- Display Select Personality function -->
                        <div class="Non-Premium">
                             <% if (chatbotCreated) { %>
                            <h1 style="text-align:center; margin-bottom:20px;margin-top:20px;">Update Chatbot(Non-Premium)</h1>
                            <div class="container">
                                <div class="row background">
                                    <div class="col">
                                        <img src="companibot.jpeg" height="200" width="200"/>
                                    </div>
                                    <div class="col">
                            <div>
                                <label for="ChatbotUpdateList">Choose a New Personality</label>
                                <asp:DropDownList id="ChatbotUpdateList" runat="server">
                                    <asp:ListItem Selected="True" Value="Chef"> Chef </asp:ListItem>
                                    <asp:ListItem Value="BoonKeng"> Boon Keng </asp:ListItem>
                                    <asp:ListItem Value="OldMan"> Old Man </asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button type="button" ID="Button5" runat="server" Text="Select" OnClick="SelectNewPersonalityButton_Click" OnClientClick="showAlert('Chatbot Updated!');" class="form-button" />
                                </div>
                                          </div>
                                </div>
                            </div>
                        <% } else { %>
                    <h1 style="text-align:center; margin-bottom:20px;margin-top:20px;">Create Chatbot(Non-Premium)</h1>
                            <div class="container">
                                <div class="row background">
                                    <div class="col">
                                        <img src="companibot.jpeg" height="200" width="200"/>
                                    </div>
                                    <div class="col">
                            <div>
                                <label for="ChatbotList">Choose a Personality</label>
                                <asp:DropDownList id="ChatbotList" runat="server">
                                    <asp:ListItem Selected="True" Value="Chef"> Chef </asp:ListItem>
                                    <asp:ListItem Value="BoonKeng"> Boon Keng </asp:ListItem>
                                    <asp:ListItem Value="OldMan"> Old Man </asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:Button type="button" ID="Button4" runat="server" Text="Select" OnClick="SelectPersonalityButton_Click" OnClientClick="showAlert('Chatbot Created!');" class="form-button" />
                            </div>
                                          </div>
                                </div>
                            </div>
                             <% } %>
                            </div>
                    <% } %>
                    </div>
                </div>
            </div>
    </form>
</asp:Content>
