<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ChatbotCustomisation.aspx.cs" Inherits="icasln.ChatbotCustomisation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="chatbot.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 style="text-align:center;">Customise Your Own Friend</h1>
    <div class="container">
        <div class="row">
            <div class="col-3">
                <asp:Button type="button" ID="Button1" runat="server" Text="Back" OnClick="BackButton_Click"  />
            </div>
            <div class="col-6">
                <div>
                    <asp:TextBox ID="CustomiseInformationTextbox" runat="server"/>
                    <asp:Button type="button" ID="Button2" runat="server" Text="Customise" OnClick="CustomiseInformationButton_Click"  />
                </div>
            </div>
            <div class="col-3">

            </div>
        </div>
    </div>
        </form>
</asp:Content>
