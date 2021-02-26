<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="addArtDetail.aspx.cs" Inherits="Assignment_Template.addArtDetail" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
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
            <div id="addItemForm">
                <table id="addItemTable">
                    <tr>
                        <td colspan="2" style="text-align: center;">New Art Information</td>
                    </tr>
                    <tr>
                        <td>Art Name: </td>
                        <td>
                            <asp:TextBox ID="txtArtName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Artist ID: </td>
                        <td>
                            <asp:TextBox ID="txtAuthorID" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Price: </td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Release Date: </td>
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
                    </tr>
                    <tr>
                        <td>Image: </td>
                        <td>
                            <asp:FileUpload ID="fuImg" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td>
                            <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="bSubmit" runat="server" Text="Submit" BackColor="#CCFFFF" Font-Bold="True" OnClick="bSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </div>
</asp:Content>
