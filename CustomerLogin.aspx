<%@ Page Language="C#" MasterPageFile ="~/Master_Page/Anonymous.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Assignment_Template.CustomerLogin" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        h1{
            text-align: center;

        }
        
        #ContentBox{
            width:80%;
            margin:0 auto;
        }

        #ContentBox2{
            width:80%;
            margin:0 auto;
        }
        .auto-style1 {
            text-align: center;
        }
     </style>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div id="ContentBox">
            <h1>Customer Login</h1>
                &nbsp;<div>
                <asp:Login ID="Login1" align="center" runat="server" DestinationPageUrl="~/Customer_gallery_view.aspx" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="194px" Width="319px">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LayoutTemplate>
                        <table style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table style="height:194px;width:319px;">
                                        <tr>
                                            <td colspan="2" style="color:White;background-color:#507CD1;font-size:0.9em;font-weight:bold;">Log In</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Username:</td>
                                            <td class="auto-style1">
                                                <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td class="auto-style1">
                                                <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1" colspan="2">
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Customer_gallery_view.aspx">Continue as a Anynomous</asp:HyperLink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1" colspan="2">
                                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                </asp:Login>
            </div>
         </div>

</asp:Content>