<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscriptions.aspx.cs" Inherits="icasln.Subscriptions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-color: #080636;
            color: #CDEEFF;
            font-family: Arial, sans-serif;
        }

        .gridview-container {
            padding: 20px;
        }

        #GVsubscirption {
            border-collapse: collapse;
            width: 100%;
            background-color: #fff;
            color: #333;
            box-shadow: 1px 1px 20px 5px #CDEEFF;
        }

        #GVsubscirption th {
            background-color: #080636;
            color: #CDEEFF;
            
        }

        #GVsubscirption tr:nth-child(even) {background-color: #f2f2f2;}
        #GVsubscirption tr:hover {background-color: #ddd;}

        #GVsubscirption td, #GVsubscirption th {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .gridview-button {
            background-color: #CDEEFF;
            color: #080636;
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
            background-color: #CDEEFF;
            box-shadow: 1px 1px 20px #CDEEFF;
            color: #080636;
        }
        .gridview-buttons {
            background-color: #080636;
            color: #CDEEFF;
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

        .gridview-buttons:hover {
            background-color: #CDEEFF;
            box-shadow: 1px 1px 20px #CDEEFF;
            color: #080636;
        }

        .header {
            color: #CDEEFF;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            padding-top:50px;
            padding-bottom:50px;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">Ongoing Subscriptions</div>
        <div class="gridview-container">
            <asp:GridView ID="GVsubscirption" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GVsubscirption_SelectedIndexChanged" DataKeyNames="Sub_ID" OnRowCancelingEdit="GVsubscirption_RowCancelingEdit" OnRowDeleting="GVsubscirption_RowDeleting" OnRowEditing="GVsubscirption_RowEditing" OnRowUpdating="GVsubscirption_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="Sub_ID" HeaderText="Subscription ID" ReadOnly="True" />
                    <asp:BoundField DataField="Sub_Type" HeaderText="Subscription Type" />
                    <asp:BoundField DataField="Sub_Price" HeaderText="Subscription Price" />
                    <asp:ImageField DataImageUrlField="Sub_Image" HeaderText="Subscription Image" ControlStyle-Width="100" ControlStyle-Height="100" />
                    <asp:BoundField DataField="Sub_Desc" HeaderText="Subscription Description" />
                    <asp:BoundField DataField="Sub_Status" HeaderText="Status" ReadOnly="True" />
                    <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="gridview-buttons" >
<ControlStyle CssClass="gridview-buttons"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            
            <asp:Button ID="btn_AddSubscription" runat="server" Text="Add New Subscription" OnClick="btn_AddSubscription_Click" CssClass="gridview-button" />
        </div>
    </form>

</body>
</html>
