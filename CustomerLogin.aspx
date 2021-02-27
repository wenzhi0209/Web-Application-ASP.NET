<%@ Page Language="C#" MasterPageFile ="~/Master_Page/Anonymous.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Assignment_Template.CustomerLogin" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
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

        <div id="ContentBox">
            <h1>Customer Login</h1>
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
         </div>
    <div id="ContentBox2">
        login 用这个比较好，要不然你需要作自定义登录处理
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Customer_gallery_view.aspx"></asp:Login>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Customer_gallery_view.aspx">Continue as a Anynomous</asp:HyperLink>
    </div>

</asp:Content>