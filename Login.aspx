<%@ Page Language="C#" MasterPageFile="~/Master_Page/anonymous.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment_Template.LoginControl" %>

<asp:Content ContentPlaceHolderID="head" runat="server">

    <title></title>
    <style>
        #container{
            width:80%;
            margin:0 auto;
            text-align:center;
        }
    </style>
 </asp:Content>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div id="container">

        <h2>Customer</h2>
        <br />
        <a href="CustomerLogin.aspx"> Customer login</a>
        <br />
        <a href="CustomerRegister.aspx"> Customer Register</a>

        <br />
        <br />

        <h2>Author</h2>
        <br />
        <a href="AuthorLogin.aspx">Author login</a>
        <br />
        <a href="AuthorInfoReg.aspx">Author Register</a>
         
    </div>

</asp:Content>