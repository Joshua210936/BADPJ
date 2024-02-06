<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subscriptionInsertt.aspx.cs" Inherits="icasln.subscriptionInsertt" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-color: #080636;
            color: #CDEEFF;
            font-family: Arial, sans-serif;
        }

        .form-container {
            padding: 20px;
            box-shadow: 1px 1px 20px 5px #CDEEFF;
            margin: auto;
            width: 50%;
            background-color: white;
            color: black;
            border-radius: 10px;
        }

        .form-container table {
            width: 100%;
        }

        .form-container td {
            padding: 10px;
        }

        .form-label {
            font-weight: bold;
            color: #080636;
            font-size: 14px;
        }

        .form-textbox {
            width: 95%;
            padding: 8px;
            border: 1px solid #080636;
            border-radius: 4px;
            box-shadow: inset 0 1px 3px #CDEEFF;
        }

        .interactive-button {
            background-color: #080636;
            margin-top:50px;
            color: #CDEEFF;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            box-shadow: 1px 1px 20px #CDEEFF;
            border-radius: 4px;
        }

        .interactive-button:hover {
            background-color: #CDEEFF;
            color: #080636;
        }

        .header {
            color: #CDEEFF;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            padding-top:50px;
            padding-bottom:30px;
        }
        .lol{
             padding-top:30px;
        }
    </style>
</head>
<body>



    <form id="form1" runat="server">
        <div class="header">Add Subscriptions</div>
        <div class="form-container">
            <table>
                <tr>
                    <td class="form-label">Subscription Name </td>
                    <td>
                        <asp:TextBox ID="tb_Sub_Type" runat="server" CssClass="form-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="form-label">Subscription Description</td>
                    <td>
                        <asp:TextBox ID="tb_Sub_Desc" runat="server" CssClass="form-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="form-label">Subscription Price</td>
                    <td>
                        <asp:TextBox ID="tb_Sub_Price" runat="server" CssClass="form-textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="form-label">Subscription Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Result </td>
                    <td>
                        <asp:Label ID="lbl_Result" runat="server" Text="<<>>"></asp:Label>
                    </td>
                </tr>
            </table>
            <div class:"lol">
                <asp:Button ID="btn_Insert" runat="server" CssClass="interactive-button" Text="Add Subscription" OnClick="btn_Insert_Click" />
                <asp:Button ID="btn_SubView" runat="server" CssClass="interactive-button" Text="View all Subscriptions" OnClick="btn_SubView_Click" />
            </div>
        </div>
    </form>
</body>
</html>

