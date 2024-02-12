<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="icasln.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
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

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Login to your account</h5>

                  <div class="form-outline mb-4">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address" class="form-control form-control-lg" />
                  </div>

                  <div class="form-outline mb-4">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" class="form-control form-control-lg" />
                  </div>

                  <div class="pt-1 mb-4">
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                    <asp:Button class="btn btn-dark btn-lg btn-block" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                  </div>

                  <p class="small mb-5 pb-lg-2"><a class="text-muted" href="ForgotPassword.aspx">Forgot password?</a></p>
                  <p>Don't have an account? <a href="SignUpaspx.aspx" style="color: #393f81;">Register here</a></p>

                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
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
