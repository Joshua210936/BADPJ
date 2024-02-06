<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="icasln.ThankYou" MasterPageFile="~/usermaster.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css">
    <title>Payment Successful</title>
    <style>
        .lol {
    height: 100vh;
    margin: 0;
    font-family: 'Arial', sans-serif;
    background: #092646; /* Light blue background */
    display: flex;
    justify-content: center;
    align-items: center;
     }

    .containers {
        text-align: center;
        box-shadow: 5px 5px 18px #CDEEFF;
        border-radius: 10px;
    }

    .cardss {
        background: #FFFFFF;
        box-shadow: 10px 10px 5px 12px #CDEEFF;
        border-radius: 10px;
        padding: 40px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .icon-wrapper {
        display: inline-block;
        border-radius: 50%; /* Circle shape */
        padding: 1px;
        margin-bottom: 1px;
    }

    .checkmark-icon {
        width: 150px; /* Adjust size as needed */
        height: auto;
    }

    .success-message {
        margin: 20px 0;
        color: #333;
    }

    .divider {
        height: 1px;
        background-color: #BDBDBD;
        margin: 20px 0;
        margin-bottom: 40px;
    }

    .button-group {
        margin-top: 20px;
        display: flex;
        justify-content: center;
        gap: 10px;
    }

    .button {
        padding: 10px 20px;
        border: none;
        border-radius: 20px;
        background-color: #CDEEFF; /* Blue color */
        color: black;
        cursor: pointer;
        transition: all 0.3s ease;
        outline: none;
        font-size: 16px;
    }

        .button:hover {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            transform: translateY(-2px);
        }

        .button:active {
            transform: translateY(1px);
            box-shadow: none;
        }

    @keyframes flyInFromLeft {
        from {
            transform: translateX(-100vw);
        }

        to {
            transform: translateX(0);
        }
    }

    @keyframes flyInFromRight {
        from {
            transform: translateX(100vw);
        }

        to {
            transform: translateX(0);
        }
    }

    @keyframes flyInFromTop {
        from {
            transform: translateY(-100vh);
        }

        to {
            transform: translateY(0);
        }
    }

    @keyframes flyInFromBottom {
        from {
            transform: translateY(100vh);
        }

        to {
            transform: translateY(0);
        }
    }
    .card {
        /* existing styles */
        animation: flyInFromLeft 0.5s ease-out forwards;
    }

    .icon-wrapper {
        /* existing styles */
        animation: flyInFromRight 0.5s ease-out forwards;
    }

    .success-message {
        /* existing styles */
        animation: flyInFromTop 0.5s ease-out forwards;
    }

    .button-group {
        /* existing styles */
        animation: flyInFromBottom 0.5s ease-out forwards;
    }
    .icon-wrapper {
        animation-delay: 0.2s;
    }

    .success-message {
        animation-delay: 0.4s;
    }

    .button-group {
        animation-delay: 0.6s;
    }
    .footer {
    height: 50vh;
    padding-left: 200px;
    padding-right: 200px;
    display: flex;
    color: white;
    justify-content: space-between;
    align-items: center;
    padding-top: 50px;
    padding-bottom: 50px;
    background-color: rgba(0, 0, 34, 1);
    flex-wrap: wrap;
    font-size: 15px;
    width: 100%;
    }

    .footer-contact,
    .footer-links,
    .footer-subscribe {
        margin: 10px;
    }

    .footer-logo {
        width: 50px;
        height: auto;
        margin-bottom: 10px;
    }

    .mini-logo {
        width: 30px;
        height: 30px;
        margin-left: 10px;
        padding-top: 20px;
        align-items: center;
    }

    .footer-links h4,
    .footer-subscribe h4 {
        margin-bottom: 5px;
    }

    .footer-links {
        text-align: left;
    }

        .footer-links h4 {
            margin-bottom: 10px; /* Adjust as needed */
            color: white; /* Adjust as needed */
        }

    .links-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr); /* Creates two columns */
        gap: 30px; /* Adjust as needed */
        column-gap: 120px;
    }

    .footer-links a {
        color: white; /* Adjust as needed */
        text-decoration: none;
        line-height: 1.5; /* Adjust as needed */
    }

        .footer-links a:hover {
            text-shadow: 1px 1px 20px #CDEEFF;
        }

        .footer-links a:hover,
        .social-icon:hover {
            color: #CDEEFF;
        }

    .subscribe-form {
        display: flex;
        align-items: flex-end
    }

        .subscribe-form input[type="email"] {
            padding: 10px;
            border: 1px solid #ddd;
            margin-right: 5px;
            border-radius: 4px;
        }

        .subscribe-form button {
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

    .footer-social {
        display: flex;
        align-items: center;
    }

    .social-icon {
        font-size: 24px;
        color: white;
        margin-right: 10px;
        transition: color 0.3s ease;
        align-items: flex-start;
        padding: 20px;
    }

    .footer-bottom {
        width: 100%;
        border-top: 1px solid #ddd;
        padding-top: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }


    }

    @media (max-width: 768px) {
        .footer {
            flex-direction: column;
            align-items: center;
        }

        .footer-contact,
        .footer-links,
        .footer-subscribe {
            margin-bottom: 20px;
        }

        .footer-bottom {
            flex-direction: column;
            text-align: center;
        }

            .footer-bottom p {
                margin-bottom: 5px;
            }
    }


    
        </style>
</head>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<body>
    <div class="lol">
        <div class="containers">
            <div class="cardss">
                <div class="icon-wrapper">
                    <img src="Checkboxx.png" alt="Checkmark" class="checkmark-icon" />
                </div>
                <h1 class="success-message">Payment Successful!</h1>
                <div class="divider"></div>
                <div class="button-group">
                    <button class="button" id="startChatting">Start Chatting</button>
                    <button class="button" id="backHome">Back To Home</button>
                </div>
            </div>
        </div>
    </div>
    

    <script src="Thankyou.js"></script>
</body>
</asp:Content>