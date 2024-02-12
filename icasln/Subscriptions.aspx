<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscriptions.aspx.cs" Inherits="icasln.Subscriptions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv='X-UA-Compatible' content="IE=edge">
  <title>subscription page</title>
  <meta charset="UTF-8">
       <script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.js"></script> 
       <script type="text/javascript" src="https://unpkg.com/web3@0.20.5/dist/web3.min.js"></script>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />
       <link href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&display=swap" rel="stylesheet" />
   <style type="text/css">
        *{
        font-family: 'Kdam Thmor Pro', sans-serif;
        }
    </style>
<head runat="server">
    <title></title>
    <style>
        *{
            font-family: 'Kdam Thmor Pro', sans-serif;
        }
        body {
            background-color: #080636; /* Adjust body background to match MainLedger */
            color: floralwhite; /* Adjust text color to match MainLedger */
        }
        .tabs {
            text-align: center;
            margin: 10px 0;
            margin-bottom: 30px;
        }

        .tablinks {
            background-color: #fffaf0;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 10px 20px;
            transition: 0.3s;
            font-size: 16px;
            margin: 0 4px; /* Adjust as needed */
        }

        .tablinks:hover {
            background-color: #ddd;
            box-shadow: 1px 1px 20px 5px #CDEEFF;/* Lighter effect on hover */
        }

        .scrollable-table {
            width: 90%;
            margin: 20px auto;
            max-height: 500px; /* Adjust this value based on your preference */
            overflow-y: auto;
            border-radius: 5px;
            background-color: #fffaf0;
            padding: 20px;
            box-shadow: 1px 1px 20px 5px #CDEEFF;
        }

        table {
            width: 100%; /* Full width of the container */
            border-collapse: collapse; /* Collapse borders */
            font-size: 18px; /* Increase font size */
        }


        table th, table td {
            padding: 15px; /* Adjust padding */
            border: 1px solid grey; /* Lighter border color */
            text-align: center; /* Center align text */
            background-color: #080636; /* Background color */
            color: white; /* Text color */
        }

        table th {
            background-color: #CDEEFF; /* Header background color */
            color: #3c3f44; /* Header text color */
        }

        table tr:nth-child(even) {
            background-color: #3c3f44; /* Even row background color */
            color: white; /* Adjust text color for even rows */
        }

        table tr:hover {
            background-color: #f1f1f1; /* Hover effect color */
            color: #3c3f44; /* Hover text color */
        }

        .gridview-button {
            background-color: #CDEEFF;
            display:block;
            color: black;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        .gridview-button:hover {
            box-shadow: 1px 1px 20px 5px #CDEEFF;
       
        }

        .gridvieww-button{
            background-color: #CDEEFF;
            color: black;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
            margin-top:20px;
            margin-left:50px;
        }
        .gridvieww-button:hover {
            box-shadow: 1px 1px 20px 5px #CDEEFF;
       
        }

        .header {
            color: #3c3f44;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        } 
        .title{
            text-align: center;
           font-size: 3rem;
           border-bottom: 3px solid #CDEEFF ;
            margin: 0px 15% 40px;
            padding-bottom: 25px;
            padding-top: 80px;
            margin-bottom: 70px;

        } 
       
    </style>
</head>
<body>
    <form id="form1" runat="server">

          <h1 class="title" >View subscriptions</h1>
            <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="subscriptionStatus" runat="server" />
        <div class="tabs">
            <button type="button" class="tablinks" onclick="filterSubscriptions('All')">All Subscriptions</button>
            <button type="button" class="tablinks" onclick="filterSubscriptions('Active')">Active Subscriptions</button>
            <button type="button" class="tablinks" onclick="filterSubscriptions('Inactive')">Inactive Subscriptions</button>
        </div>
        <div class="scrollable-table">
             <h2 style="padding-top: 25px; padding-bottom:0px; font-size:2rem; color:black;text-align:center;">All subscriptions</h2>
            <span id="message" style="font-size: 1.5rem; padding-bottom: 60px;"></span> <hr/>
            <asp:GridView ID="GVsubscirption" runat="server" AutoGenerateColumns="False" CssClass="table"  DataKeyNames="Sub_ID" OnRowCancelingEdit="GVsubscirption_RowCancelingEdit" OnRowDeleting="GVsubscirption_RowDeleting" OnRowEditing="GVsubscirption_RowEditing" OnRowUpdating="GVsubscirption_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="Sub_ID" HeaderText="Subscription ID" ReadOnly="True" />
                    <asp:BoundField DataField="Sub_Type" HeaderText="Subscription Type" />
                    <asp:BoundField DataField="Sub_Price" HeaderText="Subscription Price" />
                    <asp:ImageField DataImageUrlField="Sub_Image" HeaderText="Subscription Image" ControlStyle-Width="100" ControlStyle-Height="100" />
                    <asp:BoundField DataField="Sub_Desc" HeaderText="Subscription Description" />
                    <asp:BoundField DataField="Sub_Status" HeaderText="Status" ReadOnly="True" />
                    <asp:CommandField  ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="gridview-button" >

                        <ControlStyle CssClass="gridview-button"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:Button ID="btn_AddSubscription" runat="server" Text="Add New Subscription" OnClick="btn_AddSubscription_Click" CssClass="gridvieww-button"  />
    </form>
    <script type="text/javascript">
        function filterSubscriptions(status) {
            // Set a hidden field value based on the status and then submit the form
            document.getElementById('subscriptionStatus').value = status;
            __doPostBack('UpdatePanel1', '');
        }
    </script>

</body>
</html>
