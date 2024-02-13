<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ChatbotLanding.aspx.cs" Inherits="icasln.ChatbotLanding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="chatbotlanding.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <h1 style="text-align:center; margin-bottom:20px;margin-top:20px;">Chatbot</h1>
        <div class="content container">
            <div class="row">
                
                    <div class="faq-card col glow-button">
                        <a href="Chatbot.aspx">
                            <img src="chatting.png" width="250" height="300"/>
                            <br />
                            <h2 style="color:black;">Start Chatting</h2>
                        </a>
                    </div>
                
                <div class="faq-card col glow-button">
                    <a href="ChatbotCustomisation.aspx">
                    <img src="friendchange.png" width="250" height="300"/>
                    <br />
                    <h2 style="color:black;">Change Your Friend</h2>
                    </a>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
