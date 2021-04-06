<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="welMsg.ascx.cs" Inherits="Assignment_Template.welMsg" %>

<style>
    #container{
        display: flex;
	    flex-direction: column;
	    flex-wrap: nowrap;
	    justify-content: center;
	    align-items: flex-start;
	    align-content: flex-start;
        width:80%;
        margin:20px auto;
        font-size:24px;
    }
    .SecMsg{
        margin-left:80px;
        padding-top:10px;
        font-size:18px;
        color:rgb(128,128,128);
    }
</style>

<div id="container">
    <asp:Label ID="firstMsg" runat="server" Text=""></asp:Label>
    <asp:Label ID="SecMsg" runat="server" Text="" CssClass="SecMsg"></asp:Label>
</div>
