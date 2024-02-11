<%@ Page Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="SignUpaspx.aspx.cs" Inherits="icasln.SignUpaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1
            width: 258px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">            

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span class="h1 fw-bold mb-0">CompaniBot</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Account Creation</h5>
    <table class="auto-style2">
                <asp:HiddenField ID="hf_UserId" runat="server" />
                <tr>
                    <td>First Name</td>
                    <td>
                        <asp:TextBox ID="tb_FirstName" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="Rfv_FirstName" runat="server" ControlToValidate="tb_FirstName" ErrorMessage="Enter a First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>
                        <asp:TextBox ID="tb_LastName" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="Rfv_LastName" runat="server" ControlToValidate="tb_LastName" ErrorMessage="Enter a Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="tb_Email" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lbl_EmailError" runat="server" Text="" ForeColor="Red"></asp:Label>
                        <asp:RequiredFieldValidator ID="Rfv_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="Enter an Email Address" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Rev_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="Enter a valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButtonList ID="rbl_Gender" runat="server">
                            <asp:ListItem Value="Female"></asp:ListItem>
                            <asp:ListItem Value="Male"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="Rfv_03" runat="server" ControlToValidate="rbl_Gender" ErrorMessage="Please Choose a Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td>
                        <asp:TextBox ID="tb_PhoneNumber" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="Rfv_PhoneNumber" runat="server" ControlToValidate="tb_PhoneNumber" ErrorMessage="Enter a Phone Number" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Rev_PhoneNumber" runat="server" ControlToValidate="tb_PhoneNumber" ErrorMessage="Enter a valid 8-digit Phone Number" ForeColor="Red" ValidationExpression="\d{8}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="tb_Password" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="Rfv_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="Enter a Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Rev_Password" runat="server" ControlToValidate="tb_Password" ErrorMessage="Password must be at least 8 characters long" ForeColor="Red" ValidationExpression="^.{8,}$"></asp:RegularExpressionValidator>
                       </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btn_Insert" runat="server" Text="Create Account" OnClick="btn_Insert_Click" />
                    </td>
                    <td class="auto-style1">
                        &nbsp;</td>
                </tr>
            </table>
    </form>
</asp:Content>
