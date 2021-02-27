<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="editArt.aspx.cs" Inherits="Assignment_Template.editArt" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheet/gallery_view.css" />
    <style type="text/css">
        


    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="addTableContainer">
        <table>
            <tr style="height:60px">
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2" style="text-align: center; font-weight: bold; font-size: 28px;">Edit Art Information</td>
                <td class="auto-style1">&nbsp;</td>            
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Art Name:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td></td>
                <td></td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td></td>
                <td></td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td></td>
                <td></td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td></td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td></td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2" id="labelBox">
                <td class="auto-style1">&nbsp;</td>
            </tr>
        </table>

    </div>

</asp:Content>

