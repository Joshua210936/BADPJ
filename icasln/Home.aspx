<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="icasln.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv='X-UA-Compatible' content="IE=edge">
  <title>Property system</title>
  <!-- Other link tags -->
  <meta charset="UTF-8">
       <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script> 
       <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />
       <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
       <link rel="stylesheet" href="Home.css">
        <style>
            .title {
                font-size: 3rem;
                border-bottom: 3px solid #CDEEFF;
                margin: 0px 15% 40px;
                padding-bottom: 25px;
                padding-top: 80px;
                margin-bottom: 70px;
                text-align: center;
            }

            .learn-more-btnn {
                padding: 10px 25px;
                border: none;
                border-radius: 20px;
                background-color: #CDEEFF;
                color: black;
                cursor: pointer;
                font-size: 1em;
                outline: none;
                transition: background-color 0.3s;
            }

            .button-wrapper {
                display: flex;
                justify-content: flex-start;
                margin-left: 40vh; /* Adjusted to remove spacing */
            }

            .learn-more-btnn:hover {
                box-shadow: 1px 1px 20px 5px #CDEEFF;
            }

            .premiumm {
                height: 120vh; /* Changed from 120vh to auto for better adaptability */
            }

            * {
                font-family: 'Kdam Thmor Pro', sans-serif;
            }

            .faq-section {
                display: flex;
                justify-content: center;
                margin: 20px;
                margin-bottom: 0px; /* Adjusted to remove bottom margin */
                padding: 20px;
                background-color: white;
            }

            .faq-category {
                width: 300px;
                margin: 20px; /* Adjusted to remove bottom margin if needed */
                height: 350px;
                background: #080636;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 1px 1px 20px 5px #CDEEFF;
                color: white;
                text-align: center;
                display:block;
            }

            .faq-category h2 {
                color: #333;
                margin-bottom: 15px;
                color: white;
            }

            .faq-category p {
                list-style: none;
                padding: 0;
                margin: 0;
            }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
        <script>
            AOS.init({
                duration: 1000, // values from 0 to 3000, with step 50ms
                once: true, // whether animation should happen only once - while scrolling down
            });
        </script>
       <div class="main-container">
        <div class="vision-section">
            <h2 data-aos="fade-down" data-aos-delay="100" >Our Vision</h2>
            <h1 data-aos="fade-right" data-aos-delay="200">Always here for you.</h1>
            <pdata-aos="fade-up" data-aos-delay="300">With our AI companion, we’ll keep you company, 
            forever. Find a friend. A teacher. A neighbor? Anything. Your imagination creating 
            possibilities.</pdata-aos="fade-up">
            <ul class="features-list"data-aos="fade-up" data-aos-delay="400">
                <li>✔ GPT-4 API</li>
                <li>✔ Always Online</li>
                <li>✔ Your Friend</li>
            </ul>
            <button class="learn-more-btn" onclick="location.href='@Url.Action("LearnMore", "Home")'"data-aos="fade-left" data-aos-delay="500">Learn More</button>
        </div>
        <div class="companion-image"data-aos="fade-left" data-aos-delay="600">
            <!-- Image of the AI companion -->
            <img src="companibot.jpeg" alt="AI Companion">
        </div>
    </div>
        <div class="features-container">
         <h1 class="title" >Customer Testimonies </h1>
        <div class="feature" id="breakFromAds">
            <img src="manthree.jpg" alt="Break from the Ads" />
            <h3>Lim Yong Heng</h3>
            <p>"This AI chat bot has exceeded all my expectations. 
                It's not only helped me organize my thoughts through engaging 
                conversations but also been a steady presence on those long
                nights of work."</p>
        </div>
        <div class="feature" id="morePersonas">
            <img src="mantwo.jpg" alt="More Personas" />
            <h3>Timmy Lim</h3>
            <p>"The AI chat bot has been an exceptional addition to my life. 
                It provides witty banter when I need a laugh and profound 
                advice when I'm facing challenges. One of the Best chatbots out there!"</p>
        </div>
        <div class="feature" id="unlimitedConversations">
            <img src="manone.jpg" alt="Unlimited Conversations" />
            <h3>James Tan</h3>
            <p>"As someone who lives alone, the AI companion has been a game-changer.
                It's always available for a chat, never judges, and constantly
                surprises me with its thoughtful responses.Great chatbot!"</p>
        </div>
        <div class="feature" id="storedChatHistory">
            <img src="women.jpg" alt="Stored Chat History" />
            <h3>Sherry Lee</h3>
            <p>"I've never felt so understood before! This AI companion is truly remarkable;
                it's like chatting with a good friend who's always there. It has made my
                daily routine so much more enjoyable.Highly reccommended !"</p>
        </div>
    </div>
    <div class="premiumm">
        <h1 class="title">GO PREMIUM WITH US NOW !</h1>
        <div class="faq-section">
         <div class="faq-category">
            <h2>Customisable CompaniBot</h2>
            <p>Personalize your Companibot to suit your preferences. Enjoy tailored interactions and experiences with your customizable digital companion.</p>
        </div>
        <div class="faq-category">
            <h2>Unlimted message request</h2>
            <p>"Enjoy 24/7 companionship with our unlimited message request feature. Stay connected with your AI CompanyBot whenever you want, for comfort .</p>
        </div>
        <div class="faq-category">
            <h2>Saved chat History</h2>
            <p>Our chat history feature stores past conversations, enabling AI to better understand your preferences and deliver personalized, engaging response."</p>
        </div>
      </div>
         <div class="button-wrapper">
           <button class="learn-more-btnn">Premium Plans</button>
        </div>
    </div>
</asp:Content>
