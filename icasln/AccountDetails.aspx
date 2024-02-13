<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="AccountDetails.aspx.cs" Inherits="icasln.AccountDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
        function allowOnlyDigits(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                evt.preventDefault ? evt.preventDefault() : (evt.returnValue = false); // Prevent non-numeric input
            }
        }    
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section style="background-color: #eee; padding-bottom: 70px;">
        <h2 class="text-center">Account Details</h2>
        <br>
        <br>
        <form id="form1" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135823.png" alt="avatar"
                                    class="rounded-circle img-fluid" style="width: 150px;">
                                <h5 class="my-3"><asp:Label ID="lblProfile" runat="server" Text="" /></h5>
                                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-9">
                                        <p>First Name: <asp:TextBox ID="txtFirstName" runat="server" />
                                            </p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-9">
                                        <p>
                                            Last Name: <asp:TextBox ID="txtLastName" runat="server" />
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-9">
                                        <p>Email: <asp:TextBox ID="txtEmail" runat="server" /></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-9">
                                        <p>Phone Number: <asp:TextBox ID="txtPhoneNumber" runat="server" onkeypress="allowOnlyDigits(event)" MaxLength="8"></asp:TextBox></p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-9">
                                        <p>Gender: 
                                            <asp:RadioButtonList ID="rblGender" RepeatDirection="Horizontal" runat="server" Width="150px">
                                                <asp:ListItem Text="Female" Value="Female" />
                                                <asp:ListItem Text="Male" Value="Male" />
                                            </asp:RadioButtonList>
                                        </p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-9">
                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                        <asp:Label ID="lblErrorMessage" runat="server" Visible="true" ForeColor="Red" />
                                        <asp:Label ID="lblUpdateMessage" runat="server" Visible="false" ForeColor="Red" />
                                        <asp:Label ID="LabelLink" runat="server" Visible="true" ForeColor="Red" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</asp:Content>

