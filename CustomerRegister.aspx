<%@ Page Language="C#" MasterPageFile ="~/Master_Page/anonymous.Master" AutoEventWireup="true" CodeBehind="CustomerRegister.aspx.cs" Inherits="Assignment_Template.CustomerRegister" %>

<asp:Content ContentPlaceHolderID="head" runat="server">

    <title></title>
    <style>
        h1 {text-align: center;}
        .auto-style1 {
            height: 286px;
        }
        .auto-style2 {
            height: 29px;
        }
    </style>
    </asp:Content>
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div><h1>
            Customer Register</h1>
            <p>
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style2">Title : </td>
                        <td class="auto-style2">
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="Mr"></asp:ListItem>
                                <asp:ListItem Value="Ms"></asp:ListItem>
                                <asp:ListItem Value="Mrs"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Name :</td>
                        <td>
                            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone No. :</td>
                        <td>
                            <asp:TextBox ID="PhoneNo" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Date of Birth :</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="DOB" runat="server"></asp:TextBox>
                            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td>Email : </td>
                        <td>
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Address : </td>
                        <td>
                            <textarea id="Address" cols="20" name="S1" rows="2"></textarea></td>
                    </tr>
                    <tr>
                        <td>Username : </td>
                        <td>
                            <asp:TextBox ID="Username" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Password : </td>
                        <td>
                            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm Password :</td>
                        <td>
                            <asp:TextBox ID="CPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Submit" runat="server" Text="Submit" />
                        </td>
                    </tr>
                </table>
            </p>
        </div>
</asp:Content>