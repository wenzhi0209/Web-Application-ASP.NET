<%@ Page Language="C#" MasterPageFile="~/Master_Page/Customer_Account.Master" AutoEventWireup="true" CodeBehind="Favo_Art.aspx.cs" Inherits="Assignment_Template.Customer_Logged.Favo_Art" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        h1 {text-align: center;}
        .auto-style1 {
            width: 125px;
            height: 103px;
        }
        .auto-style2 {
            text-align: center;
        }
        
        </style>
    </asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div>
            <h1>Your Favourite</h1>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Art Id</th>
                        </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("art_Id").ToString()%></td>
                        <td><asp:HyperLink ID="OdetailLink" runat="server" NavigateUrl='<%# "~/Art_detail.aspx?para="+Eval("art_Id").ToString()%>'>View This Art</asp:HyperLink></td>
                    </tr>
                </ItemTemplate>
                
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            
           
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [art_Id] FROM [Favo_Art] WHERE ([cust_Id] = @cust_Id)"
        >
        <SelectParameters>
            <asp:Parameter Name="cust_Id" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>