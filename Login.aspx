<%@ Page Language="C#" MasterPageFile="~/Master_Page/anonymous.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment_Template.LoginControl" %>

<asp:Content ContentPlaceHolderID="head" runat="server">

    <title>User Login</title>
    <style>
        #container{
            width:80%;
            margin:0 auto;
            text-align:center;
        }
        h1{
            text-align:center;
        }
        a{
            text-decoration:none;
            font-weight:bold;
        }
        #Customer_Sect{
            width:80%;
            margin:30px auto;
        }
        #Customer_Sect a{
            display:block;
            width:65%;
            margin:10px auto;
            box-sizing:border-box;
            border:1px solid black;
            line-height:50px;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.1);
        }
        #Customer_Sect a:hover{
            background-color:rgb(43, 174, 226);
            transition:linear 0.3s;
            color:white;
        }
        #Author_Sect{
            width:80%;
            margin:30px auto;
        }
        #Author_Sect a{
            display:block;
            width:65%;
            margin:10px auto;
            box-sizing:border-box;
            border:1px solid black;
            line-height:50px;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.1);
        }
        #Author_Sect a:hover{
            background-color:rgb(43, 174, 226);
            transition:linear 0.3s;
            color:white;
        }
    </style>
 </asp:Content>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div id="container">
        <h1>LOGO User Login</h1>

        <div id="Customer_Sect">
            <h2>Customer</h2>
            <div><a href="CustomerLogin.aspx"> Customer login</a></div>
            <div><a href="CustomerRegister.aspx"> Customer Register</a></div>
        </div>

        <div id="Author_Sect">
            <h2>Author</h2>
            <div><a href="AuthorLogin.aspx">Author login</a></div>
            <div><a href="AuthorInfoReg.aspx">Author Register</a></div>
        </div> 
         
    </div>

</asp:Content>