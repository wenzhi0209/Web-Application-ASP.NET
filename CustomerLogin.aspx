<%@ Page Language="C#" MasterPageFile ="~/Master_Page/anonymous.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="WebAssignment.CustomerLogin" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        h1 {text-align: center;}
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
                            <asp:Button ID="Login" runat="server" Text="Login" />
                        </td>
                    </tr>
                </table>
            </p></div>
    </form>
</body>
</html>
    </asp:Content>