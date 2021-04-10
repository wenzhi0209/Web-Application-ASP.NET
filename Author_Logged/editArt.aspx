<%@ Page Language="C#" MasterPageFile="~/Master_Page/Author_Logged.Master" AutoEventWireup="true" CodeBehind="editArt.aspx.cs" Inherits="Assignment_Template.editArt" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link rel="stylesheet" href="StyleSheet/gallery_view.css" />
    <style type="text/css">
        #addTableContainer {
            margin: 0 auto;
            font-family: 'Times New Roman';
            font-size: 16px;
        }
        
        #addTableContainer table{
            width: 80%;
            margin: 0 auto;
        }

        .auto-style1 {
            width: 30%;
        }

    
        </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="addTableContainer">
        <table>
            <tr style="height:60px">
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2" style="text-align: center; font-weight: bold; font-size: 28px;">Edit Art Work</td>
                <td class="auto-style1">&nbsp;</td>            
            </tr>
            <tr>
                <td colspan ="4">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="art_Id">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="art_Title" HeaderText="art_Title" SortExpression="art_Title" />
                            <asp:BoundField DataField="art_Price" HeaderText="art_Price" SortExpression="art_Price" />
                            <asp:BoundField DataField="available_Qty" HeaderText="available_Qty" SortExpression="available_Qty" />
                            <asp:TemplateField HeaderText="art_Img" SortExpression="art_Img">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("art_Img") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# Eval("art_Img") %>' Width="120px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="art_Detail" HeaderText="art_Detail" SortExpression="art_Detail" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT art_Title, art_Img, art_Detail, art_Price, available_Qty, art_Id, author_Id FROM Art WHERE (author_Id = 3)" DeleteCommand="DELETE FROM [Art] WHERE [art_Id] = @art_Id" InsertCommand="INSERT INTO [Art] ([art_Title], [art_Img], [art_Detail], [art_Price], [author_Id], [available_Qty]) VALUES (@art_Title, @art_Img, @art_Detail, @art_Price, @author_Id, @available_Qty)" UpdateCommand="UPDATE [Art] SET [art_Title] = @art_Title, [art_Img] = @art_Img, [art_Detail] = @art_Detail, [art_Price] = @art_Price, [author_Id] = @author_Id, [available_Qty] = @available_Qty WHERE [art_Id] = @art_Id">
                        <DeleteParameters>
                            <asp:Parameter Name="art_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="art_Title" Type="String" />
                            <asp:Parameter Name="art_Img" Type="String" />
                            <asp:Parameter Name="art_Detail" Type="String" />
                            <asp:Parameter Name="art_Price" Type="Decimal" />
                            <asp:Parameter Name="author_Id" Type="Int32" />
                            <asp:Parameter Name="available_Qty" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="art_Title" Type="String" />
                            <asp:Parameter Name="art_Img" Type="String" />
                            <asp:Parameter Name="art_Detail" Type="String" />
                            <asp:Parameter Name="art_Price" Type="Decimal" />
                            <asp:Parameter Name="author_Id" Type="Int32" />
                            <asp:Parameter Name="available_Qty" Type="Int32" />
                            <asp:Parameter Name="art_Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>

        </table>

    </div>

</asp:Content>
