<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="QuestionsInsert.aspx.cs" Inherits="icasln.QuestionsInsert" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style type="text/css">
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    .image-container {
    font-size: 0; /* Set font size to 0 to eliminate the gap */
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.header-image {
    width: 50%;
    height: auto;
    display: block; /* Add display block to remove any residual spacing */
    margin: 0; /* Remove any default margins */
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
    z-index: 1;
}





    .faq-card h3 {
        color: rgba(0, 0, 34, 1);
    }

    .faq-card {
        border: 1px solid #ddd;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 30px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        height: 200px;
        background-color:#CDEEFF;
    }

    .flex-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
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
        width: 20px;
    }

    form {
        max-width: 70%;
        margin: 20px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    }

    h1 {
        text-align: center;
        color: #333;
    }

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
        width: 48%;
    }

    #btn_Submit:hover, #btn_CheckAll:hover {
        background-color: #45a049;
    }

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

    form label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #555;
    }

    .validator-message {
        color: red;
        font-size: 14px;
        margin-top: 4px;
    }

    @media (max-width: 768px) {
        .header-text {
            font-size: 18px;
        }

        .flex-container p {
            font-size: 16px;
        }

        .flex-container ul {
            font-size: 14px;
        }
    }

    .flex-container {
        display: flex;
    }

    .box {
        margin-right: 20px;
    }
</style>





    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="image-container">
        <!-- Make the image responsive by adding 'img-fluid' class -->
       <img class="header-image img-fluid" src="https://www.conovercompany.com/wp-content/uploads/2017/05/iStock-618343758.jpg" alt="Header Image" />

        <img class="header-image img-fluid" src="https://louvremedia.com/wp-content/uploads/2020/08/How-to-Improve-Customer-Service.jpg" alt="Second Image"  />


        <div class="header-text">
           WE ARE HERE FOR YOU
          
        </div>
    </div>
    <br />
    <br />
    <h1>Online Support</h1>
     <div class="faq-bars row">
     <div class="col-md-4" id="faq1">
         <div class="faq-card">
             <h3> CompaniBot strives to provide the<br /> best service possible with every<br /> contact!</h3>
             <p> We operate in an industry built on trust. This can only be achieved through<br />
                communication and experienced support – from the first contact past your ten-<br />
                year anniversary.</p>
         </div>
     </div>
     <div class="col-md-4" id="faq2">
         <div class="faq-card">
             <h3>Have Questions?</h3>
             <p>At CompaniBot you always talk to a human! Our entire team receives<br />
                specialized training regularly to ensure you're receiving the best information<br />
                possible. From basic questions to complex compliance inquiries, we're here to<br /> help!</p>
         </div>
     </div>
     <div class="col-md-4" id="faq3">
         <div class="faq-card">
             <h3>Want to know more about us?</h3>
             <p>Interested in learning more about our services? Our Account Executives take<br />
                the time to discuss your existing background screening program and help you <br />
                make smart decisions that best meet your needs</p>
         </div>
     </div>
 </div>

        <div class="center-space"></div>

            <div class="faq-bars row">
    <div class="col-md-4" id="faq1">
        <div class="faq-card">
            <h3>Coporate Office</h3>
            <p>Suntec City Mall, #02-328, 3 Temasek Boulevard, Singapore 038983</p>
        </div>
    </div>
    <div class="col-md-4" id="faq2">
        <div class="faq-card">
            <h3>Direct Contact</h3>
            <p>Phone: +65 94503273<br />
                Toll Free: 1.877.929.7878<br />
                Email: justinooi084@gmail.com</p>
        </div>
    </div>
    <div class="col-md-4" id="faq3">
        <div class="faq-card">
            <h3>Department </h3>
            <li>customerservice@choicescreening.com</li>
                <li>sales@companibot.com</li>
                <li>disputes@companibot.com</li>
                <li>compliance@companibot.com</li>
                <li>careers@companibot.com</li>
        </div>
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
       
    </form>
</asp:Content>
