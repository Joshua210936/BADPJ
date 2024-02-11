<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subscriptionInsertt.aspx.cs" Inherits="icasln.subscriptionInsertt" %>

<!DOCTYPE html>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv='X-UA-Compatible' content="IE=edge">
  <title>Insert Subscription</title>
  <!-- Other link tags -->
  <meta charset="UTF-8">
       <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script> 
       <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />
       <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
    <style>
        *{
            font-family: 'Kdam Thmor Pro', sans-serif;
        }
        .title{
            text-align: center;
            color:white;
            font-size: 3rem;
            border-bottom: 3px solid #CDEEFF ;
            margin: 0px 15% 40px;
            padding-bottom: 25px;
            padding-top: 80px;
            margin-bottom: 70px;

        } 
        body {
            color:white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 130vh;
            margin: 0;
            background-color: #080636;
        }

        .form-container {
            height:82vh;
            background: #080636;
            box-shadow: 1px 1px 20px 5px #CDEEFF;
            padding-left:20px;
            border-radius: 8px;
            color:white;
            display: flex;
            align-items: start;
         
            width: 150vh; /* Adjust max width as needed */
        }

        .form-section {
            flex: 1;
            padding-right: 20px; /* Add padding between form and image */
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            color: #CDEEFF;
            margin-bottom: 5px;
        }

        .input-group input, .input-group .form-textbox, .input-group .FileUpload {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .interactive-button {
            background-color: #CDEEFF;
            display:inline-block;
            color: black;
            border: none;
            margin-top:10px;
            margin-bottom:20px;
            margin-right: 20px;
            padding: 10px 10px;
            text-transform: uppercase;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .interactive-button:hover {
            
            box-shadow: 1px 1px 20px 5px #CDEEFF;
        }

        .image-section {
            flex: 1;
            padding-left: 20px; /* Add padding between form and image */
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
        }

        .image-section img {
            border-radius: 8px;
            width: 75vh;
            height: 82vh;
       
        }

        @media (max-width: 768px) {
            .form-container {
                flex-direction: column;
                padding: 10px;
            }
            .image-section, .form-section {
                padding-left: 0;
                padding-right: 0;
            }
            .image-section {
                order: -1; /* Image above the form on small screens */
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="title" >Add New Subscriptions</h1>
        <div class="form-container">
            <div class="form-section">
                <h2 style="color: #CDEEFF; margin-bottom: 20px;">Add Subscription</h2>
                <div class="input-group">
                    <label for="tb_Sub_Type">Subscription Name</label>
                    <asp:TextBox ID="tb_Sub_Type" runat="server" CssClass="form-textbox"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="tb_Sub_Desc">Subscription Description</label>
                    <asp:TextBox ID="tb_Sub_Desc" runat="server" CssClass="form-textbox"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="tb_Sub_Price">Subscription Price</label>
                    <asp:TextBox ID="tb_Sub_Price" runat="server" CssClass="form-textbox"></asp:TextBox>
                </div>
                <div class="input-group">
                    <label for="FileUpload1">Subscription Image</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <div class="input-group">
                    <asp:Label ID="lbl_Result" runat="server" Text="(Result will show here)"></asp:Label>
                </div>
                <asp:Button ID="btn_Insert" runat="server" CssClass="interactive-button" Text="Add Subscription" OnClick="btn_Insert_Click" />
                <asp:Button ID="btn_SubView" runat="server" CssClass="interactive-button" Text="View all Subscriptions" OnClick="btn_SubView_Click" />
            </div>
            <div class="image-section">
                <!-- Update the src attribute to the path of your image -->
                <img src="threemnth.png" alt="Subscription Image">
            </div>
        </div>
    </form>
</body>
</html>

