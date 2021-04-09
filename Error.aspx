<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Assignment_Template.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Somethings Error</title>
    <style>
        #container{
            width:80%;
            margin:25px auto;
            text-align:center;
        }
        #logo_Img
        {
            width:auto;
            height:200px;
            margin:0 auto;
        }
        .homeBtn
        {
            font-size:16px;
            display:block;
            width:250px;
            margin:10px auto;
            box-sizing:border-box;
            border:1px solid black;
            line-height:50px;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.1);
        }
        .homeBtn:hover
        {
            background-color:rgb(43, 174, 226);
            transition:linear 0.3s;
            color:white;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <img src="../Master_Page/logo-social.png" alt="Logo" id="logo_Img"/>
            <h1>Sorry, That might some errors occured</h1>
            <asp:Button ID="homeBtn" runat="server" Text="Return to Home Page" PostBackUrl="~/Login.aspx" CssClass="homeBtn"/>
        </div>
    </form>
</body>
</html>
