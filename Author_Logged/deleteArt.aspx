<%@ Page Language="C#" MasterPageFile="~/Master_Page/Author_Logged.Master" AutoEventWireup="true" CodeBehind="deleteArt.aspx.cs" Inherits="Assignment_Template.deleteArt" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheet/gallery_view.css" />
    <style type="text/css">
        #addTableContainer {
            width: 80%;
            margin: 0 auto;
            font-family: 'Times New Roman';
            font-size: 16px;
        }
        
        #addTableContainer table{
            width: 80%;
            margin: 0 auto;
        }

        .auto-style1 {
            width: 30%;
        }

    
        </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="addTableContainer">
        <table>
            <tr style="height:60px">
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2" style="text-align: center; font-weight: bold; font-size: 28px;">Delete Art</td>
                <td class="auto-style1">&nbsp;</td>            
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Enter Art ID:</td>
                <td>
                    <asp:TextBox ID="txtArtID" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Enter" OnClick="Button1_Click" />
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
                    <asp:Label ID="lblDeleteMsg" runat="server"></asp:Label>
                <td class="auto-style1">&nbsp;</td>
            </tr>
        </table>

    </div>

</asp:Content>
