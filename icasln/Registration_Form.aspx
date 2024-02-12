<%@ Page Language="C#" MasterPageFile="~/usermaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Registration_Form.aspx.cs" Inherits="icasln.Registration_Form" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <title>Support Page</title>
        <!-- Include Leaflet CSS -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <!-- Include your custom styles -->
        <style type="text/css">
            .header {
                text-align: center;
                background: rgba(0, 0, 34, 1);
                color: white;
                padding: 20px;
                font-size: 24px;
            }

            .section-text {
                font-size: 18px;
                margin-bottom: 10px;
                /* Adjust as needed */
            }

            .blue-section {
                padding: 20px;
                text-align: center;
                background-color: rgba(0, 0, 34, 1);
                color: white;
                border-radius: 8px;
                margin-top: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .contact-section {
                text-align: center;
            }

            #contactButton {
    margin-top: 10px;
   color:black;
    background-color: #CDEEFF; /* New background color */
    padding: 15px 30px; /* Adjust padding */
    font-size: 18px; /* Adjust font size */
    text-decoration: none; /* Remove underline for anchor tag */
    border-radius: 5px; /* Add border radius */
}


            .blue-section a {
                color: white;
            }

            .search-bar {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .search-input {
                position: relative;
                flex: 1; /* Takes up remaining space in the flex container */
                margin-right: 10px; /* Adjust as needed */
            }

            #ddlAutocomplete {
                position: absolute;
                top: 100%;
                left: 0;
                width: calc(100% - 2px); /* Adjust for borders */
                z-index: 1;
                display: none; /* Initially hide the dropdown */
                border: 1px solid #ddd;
                border-top: none;
                border-radius: 0 0 8px 8px;
                max-height: 150px; /* Adjust as needed */
                overflow-y: auto;
            }

            #searchInput:focus + #ddlAutocomplete {
                display: block; /* Show the dropdown when the input is focused */
            }

            .btn-primary {
                padding: 10px 20px;
                background-color: #CDEEFF;
                color: #007bff;
                border: 1px solid #007bff;
                cursor: pointer;
            }

            .faq-bars {
                margin-top: 2rem;
            }

            .faq-bars .col-md-4 {
                margin-bottom: 20px;
            }

            .faq-card {
                border: 1px solid #ddd;
                padding: 20px;
                border-radius: 8px;
                margin-bottom: 30px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                background-color:#CDEEFF; 
            }

            #map {
                height: 400px;
                width: 100%;
                border: 1px solid #ddd;
                border-radius: 10px;
                margin-top: 20px;
            }

            .contact-section {
                text-align: left;
                margin-top: 20px;
            }

            .contact-section p {
                margin-bottom: 10px;
            }

            .contact-section a {
                background-color: #007bff;
                color: white;
                padding: 15px 30px;
                text-decoration: none;
                border-radius: 5px;
                font-size: 18px;
            }

            .showroom-section {
                margin-top: 40px;
            }

            .showroom-details {
                font-size: 16px;
                line-height: 1.6;
            }

            /* Adjustments for smaller screens */
            @media (max-width: 768px) {
                .search-bar {
                    flex-direction: column;
                    align-items: stretch;
                }

                .search-input {
                    margin-right: 0;
                    margin-bottom: 10px;
                }
            }
        </style>

        <!-- Include jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- Include Leaflet JavaScript -->
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="header">
                <h1>Support Center</h1>
            </div>
            <br /> <br />
            <div class="container">
                <div class="search-bar">
                    <div class="search-input">
                        <input type="text" class="form-control form-control-lg" placeholder="Search..." id="searchInput" runat="server">
                        <asp:DropDownList ID="ddlAutocomplete" runat="server" CssClass="autocomplete" onchange="updateHiddenField()"></asp:DropDownList>
                    </div>
                    <asp:Button ID="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" />
                </div>

                <div class="faq-bars row">
                    <div class="col-md-4" id="faq1">
                        <div class="faq-card">
                            <h3>General Information</h3>
                            <p>What is CompaniBots?</p>
                            <p>Who Created CompaniBots?</p>
                            <p>Is CompaniBots free?</p>
                            <p>What platform/devices are supported?</p>
                            <p>What languages are available?</p>
                        </div>
                    </div>
                    <div class="col-md-4" id="faq2">
                        <div class="faq-card">
                            <h3>Setting up an account</h3>
                            <p>How to create an account?</p>
                            <p>How to change password?</p>
                            <p>How to pay for a premium account?</p>
                            <p>Why should you get a premium account?</p>
                            <p>How to recover a lost account?</p>
                        </div>
                    </div>
                    <div class="col-md-4" id="faq3">
                        <div class="faq-card">
                            <h3>About CompaniBots</h3>
                            <p>Is CompaniBots safe?</p>
                            <p>Is there human chatting with me?</p>
                            <p>Can anyone else talk to my CompaniBot?</p>
                            <p>How does CompaniBots work?</p>
                            <p>Is CompaniBots good?</p>
                        </div>
                    </div>
                </div>

                <div class="blue-section">
                    <div class="contact-section">
                        <p class="section-text">Have questions? We're here to help!</p>
                        <a href="QuestionsInsert.aspx" id="contactButton" class="btn btn-primary">Contact Us</a>
                    </div>
                </div>

                <div class="showroom-section">
                    <h2>CompaniBot Office</h2>
                    <div class="showroom-details">
                        <p><strong>Address:</strong> Suntec City Mall, #02-328, 3 Temasek Boulevard, Singapore 038983</p>
                        <p><strong>Opening Hours:</strong> <br> Sunday - Thursday: 11:00am - 9:00pm <br> Friday - Saturday: 11:00am - 10:00pm</p>
                        <p><strong>(As of 7th February 2024)</strong></p>
                    </div>
                    <div id="map" class="map-container"></div>
                    <br />
                    <br />
                </div>
            </div>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#<%= searchInput.ClientID %>").on("input", function () {
                        // Fetch autocomplete suggestions
                        $.ajax({
                            type: "POST",
                            url: "<%= ResolveUrl("~/Registration_Form.aspx/GetAutocompleteSuggestions") %>",
                            data: '{prefix: "' + $("#<%= searchInput.ClientID %>").val() + '" }',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                // Populate dropdown with suggestions
                                var ddlAutocomplete = $("#<%= ddlAutocomplete.ClientID %>");
                                ddlAutocomplete.empty();
                                $.each(data.d, function (key, value) {
                                    ddlAutocomplete.append($("<option></option>").val(value).html(value));
                                });
                            },
                            error: function (response) {
                                // Handle error
                                console.log(response.responseText);
                            }
                        });
                    });
                });

                document.addEventListener('DOMContentLoaded', function () {
                    const searchInput = document.getElementById('searchInput');
                    const searchButton = document.querySelector('.btn-primary');

                    searchButton.addEventListener('click', function () {
                        // Your search logic here
                        Response.Redirect("SearchResults.aspx");
                    });

                    var map;
                    var marker;

                    // Initial map view
                    map = L.map('map').setView([1.2959, 103.8595], 15);

                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '© OpenStreetMap contributors'
                    }).addTo(map);

                    // Fixed marker (not draggable) with popup
                    marker = L.marker([1.2959, 103.8595]).addTo(map)
                        .bindPopup('CompaniBot Office<br>Suntec City Mall, #02-328, 3 Temasek Boulevard, Singapore 038983')
                        .openPopup();

                    marker.on('click', function () {
                        var lat = marker.getLatLng().lat;
                        var lng = marker.getLatLng().lng;
                        openGoogleMaps(lat, lng);
                    });
                });

                function openGoogleMaps(lat, lng) {
                    // Open Google Maps in a new window with the specified location
                    window.open('https://www.google.com/maps?q=' + lat + ',' + lng, '_blank');
                }
            </script>
        </form>
    </body>
</asp:Content>