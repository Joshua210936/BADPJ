<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="icasln.SearchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <title>Search Results</title>
        <style type="text/css">
            .search-results {
                margin-top: 20px;
            }

            .question {
                border: 1px solid #ddd;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .highlight {
                background-color: yellow;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <h1>Commonly Asked Questions </h1>
                <div class="search-results">
                   <asp:Repeater ID="QuestionsRepeater" runat="server" OnItemDataBound="QuestionsRepeater_ItemDataBound">
    <ItemTemplate>
        <div class="question">
            <h3>
                <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("QuestionText") %>'></asp:Label>
            </h3>
            <p><%# Eval("AnswerText") %></p>
        </div>
    </ItemTemplate>
</asp:Repeater>

                </div>
            </div>
        </form>
    </body>
</asp:Content>