<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Chatbot.aspx.cs" Inherits="icasln.Chatbot" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="chatbot.css">
    <script type="text/javascript">
        var username = '<%= Username %>'; // Inject Username variable into JavaScript
    </script>
    <script src="Chatbot.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#form1").submit(function () {
                var userInput = $("#<%= UserInputTextBox.ClientID %>").val();
                if (userInput.trim() == '') {
                    alert("Please enter a value in the textbox.");
                    return false;
                } else if (!/^[a-zA-Z0-9\s!"#$%&'()*+,\-.\/:;<=>?@[\\\]^_`{|}~]+$/.test(userInput)) {
                    alert("No emojis allowed!.");
                    return false;
                }
                return true;
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="background">
    <h1 style="text-align:center;">Chat</h1>
        <div class="title-container">
            <img src="customisable.png" width="50" height = "50" /> <span id="name" runat="server"></span><span class="title-chatbot">Chatbot <img src="companibot.jpeg" width="50" height = "50" /></span>
            </div>
            <div class="chat-container">
                <div class="split left">
                    <div>
                        <asp:Button type="button" ID="SelectChatbot" runat="server" Text="Chatbot" class="selectChatbotButton"/>
                    </div>
                </div>
                <div class="split right">
                    <div id="messages" class="overflow-scroll messages">
                        <asp:Repeater ID="rptMyRepeater" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class='<%# Eval("Message_Role").ToString() == "user" ? "question" : "response" %>'>
                                    <%# GetFormattedMessage(Eval("Message_Role").ToString(), Eval("Message_Content").ToString()) %>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>

                            </FooterTemplate>
                        </asp:Repeater>
                     </div>
                </div>
                </div>
                <div class="input-container">
                    <div class="textMessage input-group mb-3 d-flex justify-content-center">
                        <asp:TextBox ID="UserInputTextBox" runat="server" class="form-control" placeholder="Say Hello!" ValidationGroup="SendMessage"/>
                        <asp:Button type="button" ID="SubmitButton" runat="server" Text="Send" OnClick="SubmitButton_Click" class="btn btn-outline-secondary button-background"/>
                    </div>
                    <asp:Button type="button" ID="Button1" runat="server" Text="Customise" OnClick="CustomiseButton_Click" ValidationGroup="Customize" />
                </div>
            <br />
        <br />

        </form>
</asp:Content>