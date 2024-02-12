<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="icasln.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <title>About Us</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style type="text/css">
            body {
                font-family: 'Arial', sans-serif;
                background-color: #fff;
                color: #333;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                text-align: center;
            }

            /* Header styles */
            h1 {
                font-size: 36px;
                color: #007bff;
            }
    
            /* Section styles */
            .who-we-are {
                margin-top: 20px;
                text-align: left;
                display: flex;
                justify-content: space-around;
                background-color: #CDEEFF;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out;
                overflow: hidden;
                padding: 20px;
            }

            .who-we-are:hover {
                transform: scale(1.05);
            }

            h2 {
                text-align: center;
                margin-top: 20px;
                color: #007bff;
            }

            p {
                font-size: 16px;
                line-height: 1.6;
                color: #555;
            }

            /* Team section styles */
            .row {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    background-color: #ffffff; /* White background */
    padding: 20px;
}

            .column {
                width: 30%;
                margin-bottom: 16px;
                padding: 0 8px;
                display: flex;
                flex-direction: column;
                background-color: #CDEEFF;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease-in-out;
            }

            .column:hover {
                transform: scale(1.05);
            }

            .card img {
                width: 100%;
                height: 500px;
                
            }

            .container {
                padding: 0 16px;
            }

            .title {
                color: grey;
            }

            .button {
                border: none;
                outline: 0;
                display: inline-block;
                padding: 8px;
                color: white;
                background-color: #007bff;
                text-align: center;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s ease-in-out;
            }

            .button:hover {
                background-color: #0056b3;
            }

            @media screen and (max-width: 650px) {
                .column {
                    width: 100%;
                    display: block;
                }
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <h1>About Us</h1>

                <div class="who-we-are">
                    <h2>Who We Are</h2>
                    <p>Welcome to CompaniBots, where innovation meets companionship. At the heart of our company is a passion for leveraging AI to create a revolutionary product - your very own digital companion.</p>
                </div>

                <div class="who-we-are">
                    <!-- Intelligence Assistant Section -->
                    <div class="section-container">
                        <h2>Intelligence Assistant</h2>
                        <p>CompaniBot is more than just a chatbot; it's a sophisticated AI that learns from your interactions and proactively provides intelligent assistance. From answering queries to helping you organize your day, it's here to make your life better.</p>
                    </div>

                    <!-- Adaptive Personality Section -->
                    <div class="section-container">
                        <h2>Adaptive Personality</h2>
                        <p>We understand that everyone is unique, and so is their interaction style. CompaniBots are designed to adapt its personality to suit yours, creating a personalized and enjoyable experience every time you engage.</p>
                    </div>

                    <!-- Privacy and Security Section -->
                    <div class="section-container">
                        <h2>Privacy and Security</h2>
                        <p>Your privacy is our top priority. CompaniBots are built with robust security measures, ensuring that your personal information remains confidential. You can trust your digital companion to be a secure and reliable part of your life.</p>
                    </div>
                </div>

                <h2>Our Team</h2>
                <div class="row">
                    <div class="column">
                        <div class="card">
                            <img src="https://i.pinimg.com/originals/1c/5f/44/1c5f44d08e2b95c887c28d6f0e45b855.jpg" alt="Joshua Lim">
                            <div class="container">
                                <h2>Joshua Lim</h2>
                                <p class="title">CEO & Founder</p>
                                <p>I am the CEO of this Company and I will try to solve all your issues.</p>
                                <p>joshua524@gmail.com</p>
                                <p><a href="https://mail.google.com/mail/u/0/?hl=en#inbox?compose=new" class="button">Contact</a></p>

                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="card">
                            <img src="https://s-media-cache-ak0.pinimg.com/originals/32/52/53/325253e43d3e492bfade64752cb4791f.jpg" alt="Justin Ooi">
                            <div class="container">
                                <h2>Justin Ooi</h2>
                                <p class="title">Art Director</p>
                                <p>I am the arts director and I am pleased to help you.</p>
                                <p>justinooi@gmail.com</p>
                                <p><button class="button">Contact</button></p>
                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="card">
                            <img src="https://i.pinimg.com/originals/93/d4/3c/93d43c25b863001ad11b70c3500c0e77.jpg" alt="Rayne Wong" >
                            <div class="container">
                                <h2>Rayne Wong</h2>
                                <p class="title">Designer</p>
                                <p>I am the designer and hope you all like my design</p>
                                <p>rayne123@gmail.com</p>
                                <p><button class="button">Contact</button></p>
                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="card">
                            <img src="https://i.pinimg.com/originals/d3/66/3f/d3663fdddd03e7bb18638234e3d1e2bd.png" alt="Keefe Seow">
                            <div class="container">
                                <h2>Keefe Seow</h2>
                                <p class="title">Inventory Manager</p>
                                <p>I am the Inventory Manager</p>
                                <p>keefe123@gmail.com</p>
                                <p><button class="button">Contact</button></p>
                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="card">
                            <img src="https://tse4.mm.bing.net/th?id=OIP.APE53ORg8Aw2ZPskjRzsfQHaE7&pid=Api&P=0&h=220" alt="Emerson Koh">
                            <div class="container">
                                <h2>Emerson Koh</h2>
                                <p class="title">Head Developer</p>
                                <p>I am the head developer and I hope u like our product.</p>
                                <p>Emerson345@gmail.com</p>
                                <p><button class="button">Contact</button></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</asp:Content>
