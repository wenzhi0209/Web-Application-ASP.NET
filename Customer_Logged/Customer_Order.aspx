<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master_Page/Customer_Account.Master" CodeBehind="Customer_Order.aspx.cs" Inherits="Assignment_Template.Customer_Logged.Customer_Order" %>

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
            <h1>Your Orders</h1>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Order No</th>
                            <th>OrderDateTime</th>
                            <th>Order Status</th>
                        </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("art_Order_Id").ToString()%></td>
                        <td><%# Eval("order_DateTime").ToString()%></td>
                        <td><%# Eval("order_status").ToString()%></td>
                        <td><asp:HyperLink ID="OdetailLink" runat="server" NavigateUrl='<%# "~/Customer_Logged/orderDetails.aspx?para="+Eval("art_Order_Id").ToString()%>'>View This Order</asp:HyperLink></td>
                    </tr>
                </ItemTemplate>
                
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            
           
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [art_Order_Id], [cust_Id], [order_DateTime], [order_status] FROM [Art_Order] WHERE ([cust_Id] = @cust_Id)"
        >
        <SelectParameters>
            <asp:Parameter Name="cust_Id" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
