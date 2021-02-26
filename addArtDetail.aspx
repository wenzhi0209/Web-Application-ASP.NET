<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addArtDetail.aspx.cs" Inherits="Assignment_Template.addArtDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Master_Page/Layout.css" />
    <script src="Master_Page/Layout.js"></script>
</head>
<body>
    <!-- Top Bar -->
    <div id="topBar">
        <img href="#" src="Master_Page/logo-social.png" id="logo_Img" onclick="clear()" />
        <div id='back' onclick="navM()">
            <nav id="topNav">
                <a>Home</a>
                <a>Own Gallery</a>
                <a>Profile</a>
                <a>Logout</a>
            </nav>
        </div>
        <div id='icon' onclick="navM()">
            <div id='line1'></div>
            <div id='line2'></div>
            <div id='line3'></div>
        </div>
    </div>

    <!-- Contain -->

    <form id="form1" runat="server">
        <div>
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
        </div>
    </form>

    <!-- Contain -->


    <!-- Bottom Bar-->
    <div id="bottomBar">
        <p id="copy">Copyright © 2019. Something PTE. LTD. (201834583-Z). All Rights Reserved.</p>
    </div>
</body>
</html>

