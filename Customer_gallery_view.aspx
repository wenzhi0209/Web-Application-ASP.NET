<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_gallery_view.aspx.cs" Inherits="Assignment_Template.Customer_gallery_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
    <link rel="stylesheet" href="Layout.css" />
    <link rel="stylesheet" href="Homepage res/homepage.css" />
    <script src="Layout.js"></script>
</head>
<body>
     <!-- Top Bar -->
    <div id="topBar">
        <img href="#" src="logo-social.png" id="logo_Img" onclick="clear()" />
        <div id='back' onclick="navM()">
            <nav id="topNav">
                <a>Home</a>
                <a>Login</a>
            </nav>
        </div>
        <div id='icon' onclick="navM()">
            <div id='line1'></div>
            <div id='line2'></div>
            <div id='line3'></div>
        </div>
    </div>

    <!-- Contain -->

    <form id="form2" runat="server">
        <div id="art_Gallery">
            <div class="artBox">
                <img src="Homepage res/A-TEST.jpg"/>
                <div class="buttonCon">
                    <div class="ctrlBtn"><img src="Homepage res/favorite_border-24px.svg" /></div>
                    <div class="ctrlBtn"><img src="Homepage res/add_shopping_cart-24px.svg" /></div>
                </div>
                <p class="artTitle">No title for this ark</p>
                <p class="artist">Unknown</p>
                <p class="price">RM 18</p>
            </div>
            <div class="artBox"><img src="Homepage res/B-TEST.jpg"/></div>
            <div class="artBox"><img src="Homepage res/C-TEST.jpg"/></div>
            <div class="artBox"><img src="Homepage res/B-TEST.jpg"/></div>
            <div class="artBox"><img src="Homepage res/A-TEST.jpg"/></div>
            <div class="artBox"><img src="Homepage res/C-TEST.jpg"/></div>
            <div class="artBox"><img src="Homepage res/A-TEST.jpg"/></div>
            <div class="artBox"><img src="Homepage res/D-TEST.jpg"/></div>
            <div class="artBox"><img src="Homepage res/E-TEST.jpg"/></div>
        </div>
    </form>

    <!-- Contain -->


    <!-- Bottom Bar-->
    <div id="bottomBar">
        <p id="copy">Copyright © 2019. Something PTE. LTD. (201834583-Z). All Rights Reserved.</p>
    </div>
</body>
</html>
