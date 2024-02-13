<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="AddFAQ.aspx.cs" Inherits="icasln.AddFAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* General Styling */
        body {
            font-family: 'Kdam Thmor Pro', sans-serif;
            margin: 0; /* Remove default body margin for better alignment */
            padding: 0; /* Remove default body padding for better alignment */
        }

        /* Styling for Textboxes and Textareas */
input[type="text"],
textarea {
    background-color: #F2F2F2;
    color: #333333;
    border: 2px solid #CDEEFF;
    padding: 10px;
    border-radius: 15px;
    font-size: 16px;
    width: 100%; /* Make the TextBox take up the whole width */
    margin-bottom: 15px;
    box-sizing: border-box; /* Include padding and border in element's total width and height */
}


        input[type="text"]:focus,
        textarea:focus {
            outline: none;
            border-color: #A4D4EF;
            box-shadow: 0 0 5px #A4D4EF;
        }

        /* Styling for Form Buttons */
        .form-button {
            padding: 10px 25px;
            border: none;
            border-radius: 20px;
            background-color: #CDEEFF;
            color: black;
            cursor: pointer;
            font-size: 1em;
            outline: none;
            transition: background-color 0.3s, box-shadow 0.3s, border 0.3s;
        }

        .form-button:hover {
            background-color: #0056b3;
            box-shadow: 1px 1px 20px 5px #CDEEFF;
        }

        .form-button:focus {
            border: 2px solid #2c2c54;
        }

        /* Styling for Content Container */
        .content-container {
            color: white;
            padding: 50px 10%;
            background: #080636;
            box-sizing: border-box; /* Include padding and border in element's total width and height */
        }

/* Additional Styling for Form Container */
.form-container {
    min-height: 100vh; /* Use min-height to ensure it takes at least 100% of the viewport height */
    width: 100%; /* Adjust the width as needed */
    margin: auto; /* Center the container horizontally */
    padding: 5%;
    background: #080636;
    box-shadow: 1px 1px 20px 5px #CDEEFF;
    border-radius: 8px;
    color: white;
    display: flex;
    flex-direction: column; /* Stack child elements vertically */
    justify-content: center; /* Center content vertically */
    align-items: center; /* Center content horizontally */
}




        /* Table Styling */
        table.auto-style2 {
            width: 100%;
            margin-bottom: 15px;
        }

        table.auto-style2 tr {
            margin-bottom: 10px;
        }

        table.auto-style2 td {
            padding: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h1>Enter The FAQ</h1>
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

            <asp:Button ID="btn_AddFAQ" runat="server" CssClass="form-button" Text="Add FAQ" OnClick="btn_AddFAQ_Click" />
        </form>
    </div>
</asp:Content>
