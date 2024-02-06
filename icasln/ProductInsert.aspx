<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ProductInsert.aspx.cs" Inherits="icasln.ProductInsert" %>
<asp:Content ID ="Content1" ContentPlaceHolderID="head" runat="server">
    
     
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 50%;
            margin: 20px auto;
            background-color: ; /* White background color */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        /* Improved table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Enhanced button styling */
        #btn_Submit, #btn_CheckAll {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 15px 25px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 20px 0;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
            width: 100%;
        }

        #btn_Submit:hover, #btn_CheckAll:hover {
            background-color: #45a049;
        }

        /* Additional styling for input fields and labels */
        form input[type="text"],
        form input[type="email"],
        form textarea,
        form select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Improved label styling */
        form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        /* Required field validator styling */
        .validator-message {
            color: red;
            font-size: 14px;
            margin-top: 4px;
        }
    </style>
  
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="form1" runat="server">
            <div>
                <h1>Your Queries Our Answers</h1>
                <table class="auto-style1">
                    <tr>
                        <td>First Name</td>
                        <td>
                            <asp:TextBox ID="tb_FirstName" runat="server"></asp:TextBox>
                            <td>
                                 <asp:RequiredFieldValidator ID="rfv_FirstName" runat="server" ControlToValidate="tb_FirstName" ErrorMessage="Please enter First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td>
                            <asp:TextBox ID="tb_LastName" runat="server"></asp:TextBox></td>
                           <td>
                                <asp:RequiredFieldValidator ID="rfv_LastName" runat="server" ControlToValidate="tb_LastName" ErrorMessage="Please enter Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                    </tr>
                    <tr>
                        <td>Email </td>
                        <td>
                            <asp:TextBox ID="tb_Email" runat="server"></asp:TextBox>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="Please enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                        </td>
                    </tr>
                    <tr>
                        <td>Message</td>
                        <td>
                            <asp:TextBox ID="tb_Message" runat="server"></asp:TextBox>
                           <td>
                                <asp:RequiredFieldValidator ID="rfv_Message" runat="server" ControlToValidate="tb_Message" ErrorMessage="Please enter a message" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                        </td>
                    </tr>
                </table>

            </div>
            <br />
            <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" Height="50px"/>
            <asp:Button ID="btn_CheckAll" runat="server" Text="Check All Queries" OnClick="btn_CheckAll_Click" Height="50px" />
        </form>
</asp:Content> 
