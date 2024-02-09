<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="CustomerSub.aspx.cs" Inherits="icasln.CustomerSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1>View customer subscriptions</h1> 
        <asp:GridView ID="gvSubbed" runat="server" AutoGenerateColumns="False" >
            <Columns>
                <asp:BoundField DataField="UserSub_ID" HeaderText="User Subscription ID" ReadOnly="True" />
                <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="True"/>
                <asp:BoundField DataField="UserName" HeaderText="User Name" ReadOnly="True"/>
                <asp:BoundField DataField="SubbedID" HeaderText="Subscription ID" ReadOnly="True"/>
                <asp:BoundField DataField="Sub_Duration" HeaderText="Subscription Duration" ReadOnly="True"/>
                <asp:BoundField DataField="UserSubDate" HeaderText="Start Date" ReadOnly="True"/>
            </Columns>
        </asp:GridView>
  

    </form>

</asp:Content>