<%@ Page Language="C#" MasterPageFile="~/Master_Page/Author_Logged.Master" AutoEventWireup="true" CodeBehind="AuthorInfoReg.aspx.cs" Inherits="Assignment_Template.InfoReg" %>




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
            <h1>Author Register</h1>
        

             <asp:CreateUserWizard ID="CreateUserWizard1" align="center" runat="server" ContinueDestinationPageUrl="~/AuthorLogin.aspx" OnCreatedUser="CreateUserWizard1_CreatedUser" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="366px" Width="377px">
                 <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                 <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                 <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <WizardSteps>
                     <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                         <ContentTemplate>
                             <table style="font-family:Verdana;font-size:100%;height:366px;width:377px;">
                                 <tr>
                                     <td colspan="2" style="color:White;background-color:#5D7B9D;font-weight:bold;">Sign Up for Your New Account</td>
                                 </tr>
                                 <tr>
                                     <td>Author name:</td>
                                     <td>
                                         <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td >Phone No.:</td>
                                     <td>
                                         <asp:TextBox ID="PhoneNo" runat="server"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="PhoneNoRequired" runat="server" ControlToValidate="PhoneNo" ErrorMessage="Phone No is required." ToolTip="Phone No is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         Date of Birth:</td>
                                     <td>
                                         <asp:TextBox ID="DOB" runat="server" TextMode="Date"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="DOBRequired" runat="server" ControlToValidate="DOB" ErrorMessage="Date of Birth is required." ToolTip="Date of Birth is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                     </td>
                                     <td>
                                         <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                     </td>
                                 </tr>

                                 <tr>
                                     <td>Address:</td>
                                     <td>
                                         <asp:TextBox ID="Address" runat="server" TextMode="MultiLine"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="AddressRequired" runat="server" ControlToValidate="Address" ErrorMessage="Address is required." ToolTip="Address is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                     </td>
                                 </tr>

                                 <tr>
                                     <td>Gender:</td>
                                     <td>
                                         <asp:RadioButtonList ID="Gender" runat="server" Height="20px" RepeatDirection="Horizontal" RepeatLayout="Flow" Width="136px">
                                             <asp:ListItem Value="M">Male</asp:ListItem>
                                             <asp:ListItem Value="F">Female</asp:ListItem>
                                         </asp:RadioButtonList>
                                         <asp:RequiredFieldValidator ID="GenderRequired" runat="server" ControlToValidate="Gender" ErrorMessage="Please Select your gender." ToolTip="Please Select your gender." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                     </td>
                                 </tr>
                         
                                 <tr>
                                     <td colspan="2" style="color:Red;">
                                         <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                     </td>
                                 </tr>
                             </table>
                         </ContentTemplate>
                         <CustomNavigationTemplate>
                             <table border="0" style="width:100%;height:100%;">                   
                                 <tr>
                                     <td>
                                         <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Create User" ValidationGroup="CreateUserWizard1" />
                                     </td>
                                 </tr>
                             </table>
                         </CustomNavigationTemplate>
                     </asp:CreateUserWizardStep>
                     <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                     </asp:CompleteWizardStep>
                 </WizardSteps>
                 <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
                 <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
                 <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
                 <SideBarStyle BackColor="#5D7B9D" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
                 <StepStyle BorderWidth="0px" />
             </asp:CreateUserWizard>
        </div>

    <!-- Contain -->
</asp:Content>
