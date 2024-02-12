<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subscriptionInsertt.aspx.cs" Inherits="icasln.subscriptionInsertt" MasterPageFile="~/adminmaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv='X-UA-Compatible' content="IE=edge">
  <title>Insert Subscription</title>
  <!-- Other link tags -->
  <meta charset="UTF-8">
       <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script> 
       <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />
       <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="SubscriptionInsertt.css">
 </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="Insertt">
    <form id="form1" runat="server">
        <h1 class="title" >Add New Subscriptions</h1>
        <div class="form-container">
            <div class="form-section">
                <h2 style="color: #CDEEFF; margin-bottom: 20px;">Add Subscription</h2>
                <div class="input-group">
                    <label for="tb_Sub_Type">Subscription Name</label>
                    <asp:TextBox ID="tb_Sub_Type" runat="server" CssClass="form-textbox"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="tb_Sub_Desc">Subscription Description</label>
                    <asp:TextBox ID="tb_Sub_Desc" runat="server" CssClass="form-textbox"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="tb_Sub_Price">Subscription Price</label>
                    <asp:TextBox ID="tb_Sub_Price" runat="server" CssClass="form-textbox"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="FileUpload1">Subscription Image</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <div class="input-group">
                    <asp:Label ID="lbl_Result" runat="server" Text="(Result will show here)" CssClass="red"></asp:Label>
                </div>
                <asp:Button ID="btn_Insert" runat="server" CssClass="interactive-button" Text="Add Subscription" OnClick="btn_Insert_Click" />
                <asp:Button ID="btn_SubView" runat="server" CssClass="interactive-button" Text="View all Subscriptions" OnClick="btn_SubView_Click" />
            </div>
            <div class="image-section">
                <!-- Update the src attribute to the path of your image -->
                <img src="subscriptions.jpg" alt="Subscription Image">
            </div>
        </div>
    </form>
</div>
 </asp:Content>

