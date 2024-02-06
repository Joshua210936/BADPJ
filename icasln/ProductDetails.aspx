<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="icasln.ProductDetails" %>

<asp:Content ID ="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #btn_Submit {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 4px;
        }

        #btn_Submit:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div>
            <h1>Customer Details Database </h1>
            <table class="auto-style1">
                <tr>
                    <td>First Name</td>
                    <td>
                        <asp:Label ID="lbl_FirstName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>
                        <asp:Label ID="lbl_LastName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:Label ID="lbl_Email" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Message</td>
                    <td>
                        <asp:Label ID="lbl_Message" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>
