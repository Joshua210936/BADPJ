<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Premium.aspx.cs" Inherits="icasln.Premium" MasterPageFile="~/usermaster.Master" %>

<asp:Content ID ="Content1" ContentPlaceHolderID="head" runat="server">

    <html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet" />
    <title>Premium page</title>
    <link rel="stylesheet" href="Premium.css">
    <style type="text/css">
        *{
        font-family: 'Kdam Thmor Pro', sans-serif;
        }
        .price {
            font-size: 18px; /* Larger font size for emphasis */
            font-weight: bold; /* Bolder font for visibility */
            color: #ffcc00; /* Color to make the price stand out */
            margin-bottom: 10px; /* Space between price and description */
        }
        .icon {
            width: 80px;
            height: auto;
            margin: 0 auto 20px; /* Center the image and add margin at the bottom */
            display: block; /* Change display to block to enable horizontal centering */
            transition: transform 0.2s; /* Smooth transition for the icon */
        }

.card {
    background: rgba(0, 0, 34, 1);
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    padding-top: 50px; /* Adjust this value as needed for space above the icon */
    text-align: center;
    width: 300px;
    height: auto;
    transition: transform 0.2s, box-shadow 0.2s;
    cursor: pointer;
    margin-left: auto;
    margin-right: auto;
    opacity: 0; /* Start with the cards hidden */
    transform: translateX(-100%); /* Positioned for left swirl animation */
}

.card:nth-child(odd) {
    transform: translateX(100%); /* Positioned for right swirl animation for odd cards */
}

.card.swirl-in-left {
    animation: swirlInFromLeft 1s forwards;
}

.card.swirl-in-right {
    animation: swirlInFromRight 1s forwards;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class =" headerr">
            <header class="main-header">
                <h1>Message without limits.
                </h1>
                <p>Send millions of messages ad-free, on demand, limitless.</p>
                
                <button class="get-started-btn" type="button">Get started &rarr;</button>
                <br />
            </header>
        </div>
<div class:"featuress">
    <h1 class="oop">Never feel lonely again</h1>
    <div class="feature">
    <div class="feature-text">
            <h2>Unlimited Message Requests</h2>
            <p>"Enjoy 24/7 companionship with our unlimited message request feature. Stay connected with your AI CompanyBot whenever you want, for comfort and assistance on-demand, making it your ideal companion for any occasion</p>
        </div>
        <img src="unlimtedtext.png" alt="Unlimited message requests feature image">
    </div>
    <div class="feature">
        <img src="chathistory.png" alt="Saved chats history feature image">
        <div class="feature-text">
            <h2>Saved Chats History</h2>
            <p>Unlimited Message Requests</p>
            <p>"Our chat history feature stores past conversations, enabling AI to better understand your preferences and deliver personalized, engaging response which enhances your overall user experience."</p>
        </div>
    </div>
    <div class="feature">
        <div class="feature-text">
            <h2>Customizable Companibot</h2>
            <p>Personalize your Companibot to suit your preferences. Enjoy tailored interactions and experiences with your customizable digital companion.</p>
        </div>
        <img src="customisable.png" alt="Customizable Companibot feature image">
    </div>
</div>
           <div class="premiumm">
            <div class="header">
                <h1>Our Premium Plan</h1>
                <h2>Introducing CompaniBots: Your personal Bot, to accompany you</h2>
                <p class="price">For only 4.99$ a month:</p>
            </div>

            <div class="cards-container">
                <asp:Repeater ID="SubscriptionsRepeater" runat="server" OnItemCommand="SubscriptionsRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="card">
                            <img src='<%# Eval("Sub_Image") %>' alt="Subscription Image" class="icon">
                            <h2 class="title"><%# Eval("Sub_Type") %></h2>
                            <p class="price">Price: <%# Eval("Sub_Price") %> per month</p>
                            <p class="description"><%# Eval("Sub_Desc") %></p>
                            <asp:Button ID="CheckoutButton" runat="server" Text="Checkout" CommandName="Checkout" CommandArgument='<%# Eval("Sub_ID") %>' CssClass="subscribe-button" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>            
        </div>
     </form>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const features = document.querySelectorAll('.feature');

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate');
                    }
                });
            }, { threshold: 0.5 });

            features.forEach((feature, index) => {
                const animationName = index % 2 === 0 ? 'swirlInLeft' : 'swirlInRight';
                feature.style.animation = `${animationName} 2s forwards`;
                observer.observe(feature);
            });
        });
        document.addEventListener('DOMContentLoaded', () => {
            const premiumSection = document.querySelector('.premiumm');
            const cards = document.querySelectorAll('.premiumm .card');

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        cards.forEach((card, index) => {
                            card.classList.add(index % 2 === 0 ? 'swirl-in-left' : 'swirl-in-right');
                        });
                    }
                });
            }, { threshold: 0.1 });

            observer.observe(premiumSection);
        });
    </script>
 
</asp:Content>





