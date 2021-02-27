<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="AuthorProfile.aspx.cs" Inherits="Assignment_Template.AuthorProfile" %>




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
    </style>


</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Contain -->

        
        <div>
                <table class="artistBox">
                    <tr>
                        <td class="auto-style2">Username:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pUser" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Password:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pPass" runat="server" TextMode="Password" ReadOnly="True"></asp:TextBox>
                            <asp:HyperLink ID="Edit" runat="server" NavigateUrl="~/AuthorResetPassword.aspx">Edit</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Profile Picture:</td>
                        <td class="auto-style3">
                            <asp:FileUpload ID="PPupload" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Name:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Date of Birth:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pDOB" runat="server" TextMode="Date" CssClass="pHover"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Type of Art:</td>
                      <td class="auto-style6">
                          <asp:TextBox ID="pTOA" runat="server"></asp:TextBox>
                    </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Phone Number:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pPhone" runat="server" TextMode="Phone"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Address:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pAddress" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">City:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="pCity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Postal Code:</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="pPostal" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">State:</td>
                     <td class="auto-style3">
                         <asp:TextBox ID="ApState" runat="server"></asp:TextBox>
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
                            <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="pBtn" OnClick="updateBtn_Click" PostBackUrl="~/AuthorProfile.aspx" />
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Author]"></asp:SqlDataSource>
            </div>
            
        </div>
    

    <!-- Contain -->
</asp:Content>
