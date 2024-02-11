<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="QuestionsInsert.aspx.cs" Inherits="icasln.ProductInsert" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .header-image {
            width: 100%;
            max-height: 50%; /* Set the maximum height you want */
        }

        .header-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: #fff;
            font-size: 24px;
            font-weight: bold;
        }

        .flex-container {
            display: flex;
            justify-content: space-between;
            align-items: center; /* Add this line to center the items vertically */
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        .contact-info {
            flex: 1;
            text-align: left;
            line-height: 1.8;
        }

        .center-space {
            width: 20px; /* Adjust the width as needed */
        }

        form {
            max-width: 70%;
            margin: 20px auto;
            background-color: #fff; /* White background color */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        /* Improved table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Enhanced button styling */
        #btn_Submit, #btn_CheckAll {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 15px 25px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 20px 0;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
            width: 100%;
        }

        #btn_Submit:hover, #btn_CheckAll:hover {
            background-color: #45a049;
        }

        /* Additional styling for input fields and labels */
        form input[type="text"],
        form input[type="email"],
        form textarea,
        form select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Improved label styling */
        form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        /* Required field validator styling */
        .validator-message {
            color: red;
            font-size: 14px;
            margin-top: 4px;
        }

        @media (max-width: 768px) {
            .header-text {
                font-size: 18px; /* Adjust the font size for smaller screens */
            }

            .flex-container p {
                font-size: 16px; /* Adjust the font size for smaller screens */
            }

            .flex-container ul {
                font-size: 14px; /* Adjust the font size for smaller screens */
            }
        }

        .image-container {
            display: flex;
            justify-content: space-between;
            align-items: center; /* Center vertically */
        }

      

        .header-text {
            flex: 1;
            text-align: center;
            color: #fff;
            font-size: 24px;
            font-weight: bold;
        }

        .flex-container {
            display: flex;
            justify-content: space-between;
            align-items: center; /* Center vertically */
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        .contact-info {
            flex: 1;
            text-align: left;
            line-height: 1.8;
        }

        .center-space {
            width: 20px; /* Adjust the width as needed */
        }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="image-container">
        <!-- Make the image responsive by adding 'img-fluid' class -->
        <img class="header-image img-fluid" src="https://www.conovercompany.com/wp-content/uploads/2017/05/iStock-618343758.jpg" alt="Header Image" style="width: 50% !important; height: 40% !important;" />

        <img class="header-image img-fluid" src="https://louvremedia.com/wp-content/uploads/2020/08/How-to-Improve-Customer-Service.jpg" alt="Second Image" style="width: 50% !important; height: 30% !important;" />

        <div class="header-text">
            Talk to a Human
            <br />
            <br />
            You're not going to hit a ridiculously long phone menu when you call us.
            Your email isn't going to the inbox abyss, never to be seen or heard from again.
            At CompaniBot, we provide the exceptional service we'd want to experience ourselves!
        </div>
    </div>
    <div class="flex-container" style="margin: 20px; padding: 20px; border: 1px solid #ddd; border-radius: 10px;">
        <div class="contact-info" style="flex: 1; text-align: left;">
            <p style="font-size: 30px; color: #3498db; line-height: 1.6;">
                CompaniBot strives to provide the<br /> best service possible with every<br /> contact!
            </p>
            <p style="line-height: 1.6;">
                We operate in an industry built on trust. This can only be achieved through<br />
                communication and experienced support – from the first contact past your ten-<br />
                year anniversary.
            </p>
            <p style="line-height: 1.6;">
                At CompaniBot you always talk to a human! Have questions? Our entire team receives<br />
                specialized training regularly to ensure you're receiving the best information<br />
                possible. From basic questions to complex compliance inquiries, we're here to<br /> help!
            </p>
            <p style="line-height: 1.6;">
                Interested in learning more about our services? Our Account Executives take<br />
                the time to discuss your existing background screening program and help you <br />
                make smart decisions that best meet your needs.
            </p>
        </div>

        <div class="center-space"></div>

        <div class="contact-info" style="flex: 1; text-align: left;">
            <p style="font-size: 30px; color: #3498db; line-height: 1.6;">
                Corporate Office
            </p>
            <p style="line-height: 1.6;">
                8668 Concord Center Dr.<br />
                Englewood, CO 80112
            </p>
            <p style="font-size: 30px; color: #3498db; line-height: 1.6;">
                Direct Contact
            </p>
            <p style="line-height: 1.6;">
                Phone: +65 94503273<br />
                Toll Free: 1.877.929.7878<br />
                Email: justinooi084@gmail.com
            </p>
            <p style="font-size: 30px; color: #3498db; line-height: 1.6;">
                Departments
            </p>
            <ul style="list-style-type: none; padding: 0; margin: 0;">
                <li>customerservice@choicescreening.com</li>
                <li>sales@choicescreening.com</li>
                <li>disputes@choicescreening.com</li>
                <li>compliance@choicescreening.com</li>
                <li>careers@choicescreening.com</li>
            </ul>
        </div>
    </div>

    <h1>Your Queries Our Answers </h1>
    <form id="form1" runat="server">

        <h1>Your Information</h1>
        <table>
            <tr>
                <td><label for="tb_FirstName">First Name:</label></td>
                <td>
                    <asp:TextBox ID="tb_FirstName" runat="server"></asp:TextBox>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_FirstName" runat="server" ControlToValidate="tb_FirstName" ErrorMessage="Please enter First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </td>
            </tr>
            <tr>
                <td><label for="tb_LastName">Last Name:</label></td>
                <td>
                    <asp:TextBox ID="tb_LastName" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_LastName" runat="server" ControlToValidate="tb_LastName" ErrorMessage="Please enter Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Email </td>
                <td>
                    <asp:TextBox ID="tb_Email" runat="server"></asp:TextBox>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="tb_Email" ErrorMessage="Please enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Email" runat="server" ControlToValidate="tb_Email"
                            ErrorMessage="Invalid Email. Must contain @" ForeColor="Red"
                            ValidationExpression=".*@.*"></asp:RegularExpressionValidator>
                    </td>
                </td>
            </tr>
            <tr>
                <td><label for="tb_Message">Message:</label></td>
                <td>
                    <asp:TextBox ID="tb_Message" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    <td>
                        <asp:RequiredFieldValidator ID="rfv_Message" runat="server" ControlToValidate="tb_Message" ErrorMessage="Please enter a message" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </td>
            </tr>
        </table>

        <br />
        <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
        <asp:Button ID="btn_CheckAll" runat="server" Text="Check All Queries" OnClick="btn_CheckAll_Click" />
    </form>
</asp:Content>