<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment_Template.Login" %>




<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link href="StyleSheet/Login.css" rel="stylesheet" />
    <link rel="stylesheet" href="StyleSheet/gallery_view.css" />
    <style type="text/css">
        #addItemForm
        {
            width:80%;
            margin:0 auto;
        }
        #addItemForm table
        {
            width:80%;
            margin:0 auto;
        }
    </style>


</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Contain -->

  
        <div>
            <div id="sample">
                <table Class="loginBox">
                    <tr>
                        <td class="auto-style2">Username:</td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Password:</td>
                        <td>
                            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/InfoReg.aspx">Not A User? Create Account Now!</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="lBtn" runat="server" Text="Login" CssClass="lBtn" PostBackUrl="~/artistProfileInfo.aspx" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    <!-- Contain -->
</asp:Content>
