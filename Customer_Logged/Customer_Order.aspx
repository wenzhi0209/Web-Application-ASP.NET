<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master_Page/Customer_Account.Master" CodeBehind="Customer_Order.aspx.cs" Inherits="Assignment_Template.Customer_Logged.Customer_Order" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        h1 {text-align: center;}
        .OrderTable{
            width:90%;
            border-collapse:collapse;
            border:2px black solid;
            margin:0 auto;
            text-align:center;
            min-width:540px;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(43, 174, 226, 0.19);
        }
        .No_row{
            width:20%;
            padding: 5px 0px;
        }
        .DateTime_row{
            width:30%;
            padding: 5px 0px;
        }
        .Status_row{
            width:20%;
            padding: 5px 0px;
        }
        .Operate_row{
            width:30%;
            padding: 5px 0px;
        }
        </style>
    </asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div>
            <h1>Your Orders</h1>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="art_Order_Id" DataSourceID="SqlDataSource1" CssClass="OrderTable">
                <Columns>
                    <asp:BoundField DataField="art_Order_Id" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="art_Order_Id" ItemStyle-CssClass="No_row" HeaderStyle-CssClass="No_row" />
                    <asp:BoundField DataField="order_DateTime" HeaderText="Order DateTime" SortExpression="order_DateTime" ItemStyle-CssClass="DateTime_row" HeaderStyle-CssClass="DateTime_row"/>
                    <asp:BoundField DataField="order_status" HeaderText="Order status" SortExpression="order_status" ItemStyle-CssClass="Status_row" HeaderStyle-CssClass="Status_row"/>
                    <asp:HyperLinkField DataNavigateUrlFields="art_Order_Id" DataNavigateUrlFormatString="~/Customer_Logged/orderDetails.aspx?para={0}" HeaderText="Operation" Text="View this order" ItemStyle-CssClass="Operate_row" HeaderStyle-CssClass="Operate_row" />
                </Columns>
            </asp:GridView>
           
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [art_Order_Id], [cust_Id], [order_DateTime], [order_status] FROM [Art_Order] WHERE ([cust_Id] = @cust_Id) ORDER BY [art_Order_Id] DESC"
        >
        <SelectParameters>
            <asp:SessionParameter Name="cust_Id" SessionField="CustId" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
