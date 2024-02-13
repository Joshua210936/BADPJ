<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="icasln.UpdatePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
             @keyframes fade-in {
          0% { opacity: 0; }
          100% { opacity: 1; }
        }

        .image-fade-in {
          animation: fade-in 1s ease-out;
        }
                .fade-in-bg {
          transition: background-image 1s ease-in-out;
        }

        .fade-in-bg.fade-in {
          opacity: 1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="vh-100 fade-in-bg" style="background-image: url('https://static.vecteezy.com/system/resources/previews/002/099/717/non_2x/mountain-beautiful-landscape-background-design-illustration-free-vector.jpg'); background-size: cover; background-position: center;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://wallpapercave.com/wp/wp3247657.jpg"
                alt="login form" class="img-fluid image-fade-in" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form id="form1" runat="server">
                  <div class="d-flex align-items-center mb-3 pb-1">
                    <img src="companibot.jpeg" alt="small logo" class="me-3" style="height: 3em;" />
                    <span class="h1 fw-bold mb-0">Companibot</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Reset Password</h5>

                  <div class="form-outline mb-4">
                      <asp:Label ID="lblNewPassword" runat="server" Text="New Password:" AssociatedControlID="txtNewPassword"></asp:Label>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

                  </div>
                    <div class="form-outline mb-4">
                      <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" AssociatedControlID="txtConfirmPassword"></asp:Label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

                  </div>

                  <div class="pt-1 mb-4">
                <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" CssClass="btn btn-light" OnClick="btnUpdatePassword_Click" />
                      <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>  

                  </div>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</asp:Content>