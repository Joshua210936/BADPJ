<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou_Form.aspx.cs" Inherits="Lab06.ThankYou_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Thank You for your registration</h1>
            We have received your information<br />
            FirstName:
            <asp:Label ID="lbl_FirstName" runat="server" Text=""></asp:Label>
            <br />
            LastName:
            <asp:Label ID="lbl_LastName" runat="server" Text=""></asp:Label>
            <br />
            Email:
            <asp:Label ID="lbl_Email" runat="server" Text=""></asp:Label>
            <br />
            Message:
            <asp:Label ID="lbl_Message" runat="server" Text=""></asp:Label>
            <br />
            <br />
           

            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />

        </div>
    </form>
</body>
</html>
