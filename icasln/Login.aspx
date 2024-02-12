﻿<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="icasln.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bg-image-vertical {
    position: relative;
    overflow: hidden;
    background-repeat: no-repeat;
    background-position: right center;
    background-size: auto 100%;
    }

    @media (min-width: 1025px) {
    .h-custom-2 {
    height: 100%;
    }
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <section class="vh-100">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6 text-black">

        <div class="px-5 ms-xl-4">
          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
          <span class="h1 fw-bold mb-0">CompaniBot</span>
        </div>

        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

          <form style="width: 23rem;" id="form1" runat="server">

            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Log in</h3>


            <div class="form-outline mb-4">
              <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" class="form-control form-control-lg" />
              <label class="form-label" for="form2Example18">Email address</label>
            </div>

            <div class="form-outline mb-4">
              <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" class="form-control form-control-lg" /><br />
              <label class="form-label" for="form2Example28">Password</label>
            </div>

            <div class="pt-1 mb-4">
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                <asp:Button class="btn btn-info btn-lg btn-block" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </div>

            <p class="small mb-5 pb-lg-2"><a class="text-muted" href="ForgotPassword.aspx">Forgot password?</a></p>
            <p>Don't have an account? <a href="SignUpaspx.aspx" class="link-info">Register here</a></p>

          </form>

        </div>

      </div>
      <div class="col-sm-6 px-0 d-none d-sm-block">
        <img src=""
          alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
      </div>
    </div>
  </div>
</section>
 
</asp:Content>
