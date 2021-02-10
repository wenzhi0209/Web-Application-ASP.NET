<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="Customer_gallery_view.aspx.cs" Inherits="Assignment_Template.Customer_gallery_view" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link rel="stylesheet" href="Img/Customer_gallery_view res/homepage.css" />

    <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       

    <div id="art_Gallery">

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="art_Id" DataSourceID="SqlDataSource1" PageSize="2">
            <Columns>
                <asp:BoundField DataField="art_Title" HeaderText="art_Title" SortExpression="art_Title" />
                <asp:TemplateField HeaderText="art_Img" SortExpression="art_Img">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("art_Img") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <a href='Art_detail.aspx?para=<%# Eval("art_Id")%>'>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("art_Img") %>' Width="200px"></asp:Image>
                        </a>                 
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="art_Price" HeaderText="art_Price" SortExpression="art_Price" />
                <asp:BoundField DataField="art_Author" HeaderText="art_Author" SortExpression="art_Author" />
                
            </Columns>
        </asp:GridView>
        
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Art]"></asp:SqlDataSource>

   

</asp:Content>



