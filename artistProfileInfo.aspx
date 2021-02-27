<%@ Page Language="C#" MasterPageFile="~/Master_Page/author_Loged.Master" AutoEventWireup="true" CodeBehind="artistProfileInfo.aspx.cs" Inherits="Assignment_Template.artistProfileInfo" %>




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
    <script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Contain -->

        
        <div>
            <div >
                <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
                <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="artistProfileInfo.aspx">Profile</a>
  <a href="addArtDetail.aspx">Add Art</a>
  <a href="editArt.aspx">Edit Art</a>
  <a href="deleteArt.aspx">Delete Art</a>

</div>
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
                            <asp:TextBox ID="pPass" runat="server" TextMode="Password" ReadOnly="True"></asp:TextBox>
                            <asp:HyperLink ID="Edit" runat="server" NavigateUrl="~/ChangePasswordaspx.aspx">Edit</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Profile picture</td>
                        <td class="auto-style3">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="95px" Width="98px" />
                            <asp:Button ID="Button1" runat="server" Text="Upload" />
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
                          <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
                            <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="pBtn" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    

    <!-- Contain -->
</asp:Content>
