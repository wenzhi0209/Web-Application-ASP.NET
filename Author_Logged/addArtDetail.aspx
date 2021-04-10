<%@ Page Language="C#" MasterPageFile="~/Master_Page/Author_Logged.Master" AutoEventWireup="true" CodeBehind="addArtDetail.aspx.cs" Inherits="Assignment_Template.addArtDetail" %>


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
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtArtName" Display="Dynamic" ErrorMessage="required field" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Artist ID: </td>
                <td>
                    <asp:TextBox ID="txtAuthorID" runat="server" Width="250px" Height="25px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAuthorID" Display="Dynamic" ErrorMessage="required field" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style3">Price(RM): </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" Width="100px" Height="25px"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="price is less than 0" ForeColor="Red" Font-Size="12px" MaximumValue="10000" MinimumValue="0" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="required field" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Release Date:</td>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="required field" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Image: </td>
                <td>
                    <asp:FileUpload ID="fuImg" runat="server" Width="250px" Height="25px"/>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="fuImg" Display="Dynamic" ErrorMessage="required field" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>Description:</td>
                <td>
                    <asp:TextBox ID="txtDesc" runat="server" Width="250px" Height="50px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="required field" ForeColor="Red" Font-Size="10px"></asp:RequiredFieldValidator>
                </td>
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
                    &nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>

        </table>
    </div>

    <asp:HiddenField ID="HDauthorID" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <br />
</asp:Content>
