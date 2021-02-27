<%@ Page Language="C#" MasterPageFile ="~/Master_Page/anonymous.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Assignment_Template.CustomerLogin" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        h1 {text-align: center;}
        .auto-style1 {
            height: 28px;
        }
        </style>

    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <div><h1>
            Customer Login</h1>
            <p>
                <table style="width:100%;">
                    <tr>
                        <td>Email / Username :</td>
                        <td>
                            <asp:TextBox ID="EorU" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Password :</td>
                        <td>
                            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:LinkButton ID="LinkButton1" runat="server">Forgot Password</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <input id="Checkbox1" type="checkbox" />Remember Me</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Login" runat="server" Text="Login" />
                        </td>
                    </tr>
                </table>
            </p></div>
    </asp:Content>