<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="AuthorInfoReg.aspx.cs" Inherits="Assignment_Template.InfoReg" %>




<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link href="StyleSheet/Profile1.css" rel="stylesheet" />
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
 <!-- Contain -->

    
        <div>
            <div id="sample">
                <table class="artistBox">
                    <tr>
                        <td class="auto-style2">UserName</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pUser" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Password</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pPass" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Name</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">DOB</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pDOB" runat="server" TextMode="Date" CssClass="pHover"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Type Of Art</td>
                      <td class="auto-style6">
                        <asp:DropDownList ID="pType" runat="server" CssClass="pHover">
                            <asp:ListItem>Modern Art</asp:ListItem>
                            <asp:ListItem>19th Century</asp:ListItem>
                            <asp:ListItem>Renaissance Art</asp:ListItem>
                            <asp:ListItem>Abstract Art</asp:ListItem>
                            <asp:ListItem>Pop Art</asp:ListItem>
                            <asp:ListItem>Cubism</asp:ListItem>
                            <asp:ListItem>Art Deco</asp:ListItem>
                            <asp:ListItem>Art Nouveau</asp:ListItem>
                            <asp:ListItem>Surrealism</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Phone Number</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pPhone" runat="server" TextMode="Phone"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Address</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pAddress" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">City</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pCity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Postal Code</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="pPostal" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">State</td>
                     <td class="auto-style3">
                        <asp:DropDownList ID="pState" runat="server" CssClass="pHover">
                            <asp:ListItem>                  </asp:ListItem>
                            <asp:ListItem>Johor</asp:ListItem>
                            <asp:ListItem>Kedah</asp:ListItem>
                            <asp:ListItem>Kelantan</asp:ListItem>
                            <asp:ListItem>Melaka</asp:ListItem>
                            <asp:ListItem>Negeri Sembilan</asp:ListItem>
                            <asp:ListItem>Pahang</asp:ListItem>
                            <asp:ListItem>Penang</asp:ListItem>
                            <asp:ListItem>Perak</asp:ListItem>
                            <asp:ListItem>Perlis</asp:ListItem>
                            <asp:ListItem>Selangor</asp:ListItem>
                            <asp:ListItem>Terengganu</asp:ListItem>
                            <asp:ListItem>Sabah</asp:ListItem>
                            <asp:ListItem>Sarawak</asp:ListItem>
                            <asp:ListItem>Kuala Lumpur</asp:ListItem>
                            <asp:ListItem>Labuan</asp:ListItem>
                            <asp:ListItem>Putrajaya</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">
                            <asp:Button ID="RegBtn" runat="server" Text="Register" CssClass="pBtn" PostBackUrl="~/artistProfileInfo.aspx" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    <!-- Contain -->
</asp:Content>
