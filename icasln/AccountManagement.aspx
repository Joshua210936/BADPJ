<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="AccountManagement.aspx.cs" Inherits="icasln.AccountManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        .table-striped>tbody>tr:nth-child(odd) {
            background-color: #f2f2f2; /* Light blue shade */
        }

        .edit-button {
            background-color: #28a745; /* Green */
            color: white;
        }

        .delete-button {
            background-color: #dc3545; /* Red */
            color: white;
        }
        .table-container {
             display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            padding-bottom: 700px; /* Add extra padding to the bottom */
        }
        .table-wrapper {
            width: 50%;
            margin: auto; /* Center the table horizontally */
        }
        .template-header {
            background-color: #add8e6; /* Blue background color */
            color: black; /* White text color */
            padding: 10px; /* Add padding */
        }


        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br>
    <h2 class="text-center mb-4">Account Management</h2>
    <div class="table-container">
    <div class="table-wrapper">
    <form id="form1" runat="server">
    <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" OnRowEditing="gvCustomer_RowEditing" OnRowUpdating="gvCustomer_RowUpdating" OnRowCancelingEdit="gvCustomer_RowCancelingEdit" OnRowDeleting="gvCustomer_RowDeleting" OnRowDataBound="gvCustomer_RowDataBound">
    <Columns>
        <asp:BoundField DataField="UserId" HeaderStyle-CssClass="template-header" HeaderText="User ID" SortExpression="UserId" ReadOnly="true" />
        <asp:TemplateField HeaderText="First Name" HeaderStyle-CssClass="template-header">
            <ItemTemplate>
                <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Last Name" HeaderStyle-CssClass="template-header">
            <ItemTemplate>
                <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email" HeaderStyle-CssClass="template-header">
            <ItemTemplate>
                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Phone Number" HeaderStyle-CssClass="template-header">
            <ItemTemplate>
                <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Gender" HeaderStyle-CssClass="template-header">
            <ItemTemplate>
                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblGenderEdit" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                    <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="edit-button" HeaderText="Update" HeaderStyle-CssClass="template-header"/>
                <asp:TemplateField HeaderText="Deletion" HeaderStyle-CssClass="template-header">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-sm delete-button" OnClientClick="return confirm('Are you sure you want to delete this user?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
    </Columns>
</asp:GridView>
        </form>
        </div>
        </div>
</asp:Content>
