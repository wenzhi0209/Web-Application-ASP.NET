<%@ Page Language="C#" MasterPageFile="~/Master_Page/Author_Logged.Master" AutoEventWireup="true" CodeBehind="artistProfileInfo.aspx.cs" Inherits="Assignment_Template.artistProfileInfo" %>




<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link href="../StyleSheet/Profile1.css" rel="stylesheet" />
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
        .auto-style1 {
            width: 230px;
        }
        .auto-style2 {
            height: 33px;
        }
        .auto-style3 {
            width: 230px;
            height: 33px;
        }
    </style>
    

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Contain -->

        
        <div>

                <table class="artistBox" >
                    <tr>
                        <td class="auto-style2">UserName</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="pUser" runat="server" ReadOnly="True" OnTextChanged="pUser_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Password</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="pPass" runat="server" TextMode="Password" ReadOnly="True">Kee208</asp:TextBox>
                            <asp:HyperLink ID="Edit" runat="server" NavigateUrl="~/Author_Logged/ChangePasswordaspx.aspx">Edit</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Profile picture</td>
                        <td class="auto-style1">
                            <asp:FileUpload ID="PPupload" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Name</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">DOB</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="pDOB" runat="server" TextMode="Date" CssClass="pHover"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Type Of Art</td>
                      <td class="auto-style1">
                          <asp:TextBox ID="pTOA" runat="server">The Renaissance</asp:TextBox>
                    </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Phone Number</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="pPhone" runat="server" TextMode="Phone" OnTextChanged="pPhone_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Address</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="pAddress" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">City</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pCity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Postal Code</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="pPostal" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">State</td>
                     <td class="auto-style1">
                         <asp:TextBox ID="ApState" runat="server" OnTextChanged="ApState_TextChanged"></asp:TextBox>
                    </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">
                            <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="pBtn" OnClick="updateBtn_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    

    <!-- Contain -->
</asp:Content>
