﻿<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ChatbotCustomisation.aspx.cs" Inherits="icasln.ChatbotCustomisation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="chatbot.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-3">
                <asp:Button type="button" ID="Button1" runat="server" Text="Back" OnClick="BackButton_Click"  />
            </div>
            <div class="col-6">
                
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
            <div class="col-3">

            </div>
        </div>
    </div>
        </form>
</asp:Content>
