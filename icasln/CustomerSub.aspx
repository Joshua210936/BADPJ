<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="CustomerSub.aspx.cs" Inherits="icasln.CustomerSub" MasterPageFile="~/adminmaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet" />
        <style>
        *{
        font-family: 'Kdam Thmor Pro', sans-serif;
        }
    body {
        background-color: #080636;
        color: floralwhite;
        height: 150vh;
    }

    .gridview-button {
        background-color: #CDEEFF;
        color: black;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-flex;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 4px;
    }

    .gridview-button:hover {
        box-shadow: 1px 1px 20px 5px #CDEEFF;
    }

    .scrollable-table {
        width: 90%;
        margin: 20px auto;
        max-height: 500px;
        overflow-y: auto;
        border-radius: 5px;
        background-color: #fffaf0;
        padding: 20px;
        box-shadow: 1px 1px 20px 5px #CDEEFF;
        margin-bottom: 50px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 18px;
    }

    table th, table td {
        padding: 15px;
        border: 1px solid grey;
        text-align: center;
        background-color: #080636;
        color: white;
    }

    table th {
        background-color: #CDEEFF;
        color: #3c3f44;
    }

    table tr:nth-child(even) {
        background-color: #3c3f44;
        color: white;
    }

    table tr:hover {
        background-color: #f1f1f1;
        color: #3c3f44;

    }
     .title{
            text-align: center;
           font-size: 3rem;
            border-bottom: 3px solid #CDEEFF ;
   
            margin: 0px 15% 40px;
            padding-bottom: 25px;
            padding-top: 80px;
            margin-bottom: 70px;

        } 
</style>
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="title" >Customer Subscriptions</h1>
       <div class="scrollable-table">
           <h2 style="padding-top: 25px; padding-bottom:30px; font-size:2rem; color:black;text-align:center;">All subscriptions</h2>
    <asp:GridView ID="gvSubbed" runat="server" AutoGenerateColumns="False" CssClass="table">
        <Columns>
            <asp:BoundField DataField="UserSub_ID" HeaderText="User Subscription ID" ReadOnly="True" />
            <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="True"/>
            <asp:BoundField DataField="Sub_Duration" HeaderText="Subscription Duration" ReadOnly="True"/>
            <asp:BoundField DataField="UserSubDate" HeaderText="Start Date" ReadOnly="True"/>
        </Columns>
    </asp:GridView>
</div>

  

    </form>
 </asp:Content>
