<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="addArtDetail.aspx.cs" Inherits="Assignment_Template.addArtDetail" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link rel="stylesheet" href="StyleSheet/gallery_view.css" />
    <style type="text/css">
        #addTableContainer {
            width: 80%;
            margin: 0 auto;
            font-family: 'Times New Roman';
            font-size: 18px;
        }
        
        #addTableContainer table{
            width: 80%;
            margin: 0 auto;
        }

        #addTableContainer tr{
            height:25px;
        }

        .auto-style1 {
            width: 30%;
        }

        
        .auto-style2 {
            width: 30%;
            height: 25px;
        }
        .auto-style3 {
            height: 25px;
        }

        
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="addTableContainer">
        <table>
            <tr style="height:60px">
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2" style="text-align: center; font-weight: bold; font-size: 28px;">Add New Art Information</td>
                <td class="auto-style1">&nbsp;</td>            
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Art Name: </td>
                <td>
                    <asp:TextBox ID="txtArtName" runat="server" Width="250px" Height="25px"></asp:TextBox>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Artist ID: </td>
                <td>
                    <asp:TextBox ID="txtAuthorID" runat="server" Width="250px" Height="25px"></asp:TextBox>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Price(RM): </td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" Width="100px" Height="25px"></asp:TextBox>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td> Date: </td>
                <td>
                    <asp:Calendar ID="cRealeaseDate" runat="server" OnSelectionChanged="cRealeaseDate_SelectionChanged">
                        <DayHeaderStyle BackColor="#59acf0" ForeColor="Black" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#b6d0fa" Font-Bold="True" ForeColor="Black" />
                        <SelectorStyle BackColor="#b6d0fa" ForeColor="Black" />
                        <TitleStyle BackColor="#333566" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#dcddf2" Height="25px" />
                        <TodayDayStyle BackColor="#affafa" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#eadefa" />
                    </asp:Calendar>
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Image: </td>
                <td>
                    <asp:FileUpload ID="fuImg" runat="server" Width="250px" Height="25px"/>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Description:</td>
                <td>
                    <asp:TextBox ID="txtDesc" runat="server" Width="250px" Height="50px"></asp:TextBox>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">
                    <asp:Button ID="bSubmit" runat="server" Text="Add" BackColor="#CCFFFF" Font-Bold="True" OnClick="bSubmit_Click" Style="margin-left: 135px; width:50px; height:25px;" />
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">
                    <asp:Label runat="server" ID="lblAddSuccess"></asp:Label>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>

        </table>
    </div>


</asp:Content>
