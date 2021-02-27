<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="ChangePasswordaspx.aspx.cs" Inherits="Assignment_Template.ChangePasswordaspx" %>




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
                <table class="loginBox">
                    <tr>
                        <td class="auto-style3">Current password</td>
                        <td>
                            <asp:TextBox ID="Oldpass" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">New password</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="NewPass" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Confirm New Password</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Button ID="Button1" runat="server" PostBackUrl="~/artistProfileInfo.aspx" Text="Update" />
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>


    <!-- Contain -->
</asp:Content>
