<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Chatbot.aspx.cs" Inherits="icasln.Chatbot" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="chatbot.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 style="text-align:center;">Chat</h1>
    <div class="container">
        <div class="row">
            <div class="col-3">
            </div>
            <div class="col-6">
                <div class="messages overflow-auto" id="messages">
                    <asp:Repeater ID="rptMyRepeater" runat="server">
                        <HeaderTemplate>

                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class ="response"><%#Eval("Message_Content") %></div>
                        </ItemTemplate>
                        <FooterTemplate>

                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="textMessage">
                    <asp:TextBox ID="UserInputTextBox" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="UserInputTextBox"></asp:RequiredFieldValidator>
                    <asp:Button type="button" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click"  />
                </div>
            </div>
            <div class="col-3">
                <asp:Button type="button" ID="Button1" runat="server" Text="Customise" OnClick="CustomiseButton_Click"  />
            </div>
        </div>
    </div>
<script src="Chatbot.js"></script>
        </form>
</asp:Content>