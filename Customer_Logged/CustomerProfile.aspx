<%@ Page Language="C#" MasterPageFile ="~/Master_Page/Customer_Account.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="Assignment_Template.CustomerProfile" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        h1 {text-align: center;}
        .auto-style1 {
            width: 125px;
            height: 103px;
        }
        #ConTable{
            width:80%;
            margin:0 auto;
        }
        
        </style>
    </asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div>
            <h1>Customer Profile</h1>
                <table id="ConTable">
                    <tr>
                        <td colspan="2">
                            <img alt="" class="auto-style1" src="../Img/Avatar.jfif" /></td>
                    </tr>
                    <tr>
                        <td>UserName : </td>
                        <td><asp:TextBox ID="UserNameBox" runat="server" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Date of Birth :</td>
                        <td><asp:TextBox ID="DobBox" runat="server" TextMode="Date" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Phone No. :</td>
                        <td><asp:TextBox ID="PhoneNoBox" runat="server"  ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Email :</td>
                        <td><asp:TextBox ID="EmailBox" runat="server"  ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Address :</td>
                        <td><asp:TextBox ID="AddressBox" runat="server" ReadOnly="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Edit" runat="server" Text="Edit" />
                        </td>
                    </tr>
                </table>
        </div>
</asp:Content>