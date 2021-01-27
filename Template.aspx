<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="Assignment_Template.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Layout.css" />
    <script src="Layout.js"></script>
</head>
<body>
    <div id="topBar">
        <img href="#" src="logo-social.png" id="logo_Img" onclick="clear()" />
        <div id='back' onclick="navM()">
            <nav id="topNav">
                <a>Home</a>
                <a>Own Gallery</a>
                <a>Profile</a>
                <a>Logout</a>
            </nav>
        </div>
        <div id='icon' onclick="navM()">
            <div id='line1'></div>
            <div id='line2'></div>
            <div id='line3'></div>
        </div>
    </div>

    <form id="form1" runat="server">
        <div>
            <div id="sample"></div>
        </div>
    </form>

    <div id="bottomBar">
        <p id="copy">Copyright © 2019. Something PTE. LTD. (201834583-Z). All Rights Reserved.</p>
    </div>
</body>
</html>
