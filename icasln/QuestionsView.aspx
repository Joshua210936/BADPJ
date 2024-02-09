<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="QuestionsView.aspx.cs" Inherits="icasln.QuestionsView" %>

<asp:Content ID ="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .gridViewStyle {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        border-radius: 8px; /* Add subtle rounded corners */
        font-family: sans-serif; /* Ensure consistent font */
    }

    .gridViewStyle th,
    .gridViewStyle td {
        padding: 12px 16px; /* Increase padding for better readability */
        border: 1px solid #e0e0e0;
        text-align: left;
        vertical-align: middle; /* Align content vertically */
    }

    .gridViewStyle th {
        background-color: #f0f0f0; /* Light gray for visual appeal */
        color: #333; /* Dark text for better contrast */
        font-weight: bold;
    }

    .gridViewStyle tr:nth-child(even) {
        background-color: #f5f5f5; /* Lighter gray for contrast */
    }

    .gridViewCommandStyle {
        text-align: center;
    }

    .buttonStyle {
        margin-top: 20px;
        padding: 10px 25px;
        font-size: 16px;
        background-color: #f0f0f0; /* Light gray for consistency */
        color: #333; /* Dark text for better contrast */
        border: 1px solid #ccc; /* Border for a subtle button appearance */
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.2s ease-in-out; /* Add hover transition */
    }

    .buttonStyle:hover {
        background-color: #e0e0e0; /* Slightly darker gray on hover */
    }
</style>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
     
       <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvProduct_SelectedIndexChanged" DataKeyNames="FirstName" OnRowCancelingEdit="gvProduct_RowCancelingEdit" OnRowDeleting="gvProduct_RowDeleting" OnRowEditing="gvProduct_RowEditing" OnRowUpdating="gvProduct_RowUpdating" CssClass="gridViewStyle" style="background-color: white;">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
                <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="btn_AddProduct" runat="server" Text="Add New Product" OnClick="btn_AddProduct_Click" />
    </form>
</asp:Content>