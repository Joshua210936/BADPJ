<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscriptions.aspx.cs" Inherits="icasln.Subscriptions" MasterPageFile="~/adminmaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<html xmlns="http://www.w3.org/1999/xhtml">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv='X-UA-Compatible' content="IE=edge">
  <title>subscription page</title>
  <meta charset="UTF-8">
       <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script> 
       <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />
       <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="Subscriptions.css">

 </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                

    <form id="form1" runat="server">

          <h1 class="title" >View subscriptions</h1>
            <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="subscriptionStatus" runat="server" />
        <div class="tabs">
            <button type="button" class="tablinks" onclick="filterSubscriptions('All')">All Subscriptions</button>
            <button type="button" class="tablinks" onclick="filterSubscriptions('Active')">Active Subscriptions</button>
            <button type="button" class="tablinks" onclick="filterSubscriptions('Inactive')">Inactive Subscriptions</button>
        </div>
        <div class="scrollable-table">
             <h2 style="padding-top: 25px; padding-bottom:0px; font-size:2rem; color:black;text-align:center;">All subscriptions</h2>
            <span id="message" style="font-size: 1.5rem; padding-bottom: 60px;"></span> <hr/>
            <asp:GridView ID="GVsubscirption" runat="server" AutoGenerateColumns="False" CssClass="table"  DataKeyNames="Sub_ID" OnRowCancelingEdit="GVsubscirption_RowCancelingEdit" OnRowDeleting="GVsubscirption_RowDeleting" OnRowEditing="GVsubscirption_RowEditing" OnRowUpdating="GVsubscirption_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="Sub_ID" HeaderText="Subscription ID" ReadOnly="True" />
                    <asp:BoundField DataField="Sub_Type" HeaderText="Subscription Type" />
                    <asp:BoundField DataField="Sub_Price" HeaderText="Subscription Price" />
                    <asp:ImageField DataImageUrlField="Sub_Image" HeaderText="Subscription Image" ControlStyle-Width="100" ControlStyle-Height="100" />
                    <asp:BoundField DataField="Sub_Desc" HeaderText="Subscription Description" />
                    <asp:BoundField DataField="Sub_Status" HeaderText="Status" ReadOnly="True" />
                    <asp:CommandField  ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="gridview-button" >

                        <ControlStyle CssClass="gridview-button"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:Button ID="btn_AddSubscription" runat="server" Text="Add New Subscription" OnClick="btn_AddSubscription_Click" CssClass="gridvieww-button"  />
    </form>
    <script type="text/javascript">
        function filterSubscriptions(status) {
            // Set a hidden field value based on the status and then submit the form
            document.getElementById('subscriptionStatus').value = status;
            __doPostBack('UpdatePanel1', '');
        }
    </script>


</asp:Content>
