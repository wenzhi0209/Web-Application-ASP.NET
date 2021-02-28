<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="AuthorLogin.aspx.cs" Inherits="Assignment_Template.AuthorLogin" %>




<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link href="StyleSheet/Login.css" rel="stylesheet" />
    <link rel="stylesheet" href="StyleSheet/gallery_view.css" />
    <style type="text/css">
        h1{
            text-align: center;

        }
        .auto-style1 {
            height: 28px;
        }

        #ContentBox{
            width:80%;
            margin:0 auto;
        }

        #ContentBox2{
            width:80%;
            margin:0 auto;
        }
     </style>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Contain -->


        <div id="ContentBox">
            <h1>Author Login</h1>
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
                            <asp:Button ID="aLogin" runat="server" Text="Login" OnClick="aLogin_Click" />
                        </td>
                    </tr>
                </table>
         </div>
    <div id="ContentBox2">
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Customer_gallery_view.aspx"></asp:Login>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Customer_gallery_view.aspx">Continue as a Anynomous</asp:HyperLink>
    </div>

    <!-- Contain -->
</asp:Content>
