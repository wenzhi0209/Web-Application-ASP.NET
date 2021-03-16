<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master_Page/Customer_Account.Master" CodeBehind="Customer_Order.aspx.cs" Inherits="Assignment_Template.Customer_Logged.Customer_Order" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        h1 {text-align: center;}
        #OrderTable{
            width:90%;
            border-collapse:collapse;
            border:2px black solid;
            margin:0 auto;
            text-align:center;
            min-width:540px;
        }
        #HeaderRow{
            border:2px black solid;
        }
        .No_row{
            width:20%;
        }
        .DateTime_row{
            width:30%;
        }
        .Status_row{
            width:20%;
        }
        .Operate_row{
            width:30%;
        }
        </style>
    </asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div>
            <h1>Your Orders</h1>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table id="OrderTable">
                        <tr id="HeaderRow">
                            <th class="No_row">Order No</th>
                            <th class="DateTime_row">OrderDateTime</th>
                            <th class="Status_row">Order Status</th>
                            <th class="Operate_row">Operation</th>
                        </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td class="No_row"><%# Eval("art_Order_Id").ToString()%></td>
                        <td class="DateTime_row"><%# Eval("order_DateTime").ToString()%></td>
                        <td class="Status_row"><%# Eval("order_status").ToString()%></td>
                        <td class="Operate_row"><asp:HyperLink ID="OdetailLink" runat="server" NavigateUrl='<%# "~/Customer_Logged/orderDetails.aspx?para="+Eval("art_Order_Id").ToString()%>'>View This Order</asp:HyperLink></td>
                    </tr>
                </ItemTemplate>
                
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:Button ID="Button1" runat="server" Text="Button" />
           
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [art_Order_Id], [cust_Id], [order_DateTime], [order_status] FROM [Art_Order] WHERE ([cust_Id] = @cust_Id)"
        >
        <SelectParameters>
            <asp:SessionParameter Name="cust_Id" SessionField="CustId" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
