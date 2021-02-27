<%@ Page Language="C#" MasterPageFile ="~/Master_Page/Customer_Loged.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="Assignment_Template.CustomerProfile" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        h1 {text-align: center;}
        .auto-style1 {
            width: 77px;
            height: 64px;
        }
        </style>
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div><h1>
            Customer Profile</h1>
            <p>
                <table style="width:100%;">
                    <tr>
                        <td colspan="2">
                            <img alt="" class="auto-style1" src="" /></td>
                    </tr>
                    <tr>
                        <td>Name : </td>
                        <td>Ms. Tan Yee Ruu</td>
                    </tr>
                    <tr>
                        <td>Date of Birth :</td>
                        <td>1/1/2000</td>
                    </tr>
                    <tr>
                        <td>Phone No. :</td>
                        <td>012-3456789</td>
                    </tr>
                    <tr>
                        <td>Email :</td>
                        <td>yr123@gmail.com</td>
                    </tr>
                    <tr>
                        <td>Address :</td>
                        <td>123, jalan abc<br />
                            11600 Penang.</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Edit" runat="server" Text="Edit" />
                        </td>
                    </tr>
                </table>
            </p></div>
  </asp:Content>