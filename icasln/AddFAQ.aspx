<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="AddFAQ.aspx.cs" Inherits="icasln.AddFAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Your head content goes here -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            padding-top: 50px;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #007bff;
        }

        label {
            margin-bottom: 0.5rem;
            color: #495057;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Your Queries Our Answers</h1>
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <div class="form-group">
                <label for="tb_Question">Question:</label>
                <asp:TextBox ID="tb_Question" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_Question" runat="server" ControlToValidate="tb_Question" ErrorMessage="Please enter a question" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="tb_Answer">Answer:</label>
                <asp:TextBox ID="tb_Answer" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_Answer" runat="server" ControlToValidate="tb_Answer" ErrorMessage="Please enter an answer" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="btn_AddFAQ" runat="server" CssClass="btn btn-primary" Text="Add FAQ" OnClick="btn_AddFAQ_Click" />
        </form>
    </div>
</asp:Content>
