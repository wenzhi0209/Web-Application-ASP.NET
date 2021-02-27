<%@ Page Language="C#" MasterPageFile="~/Master_Page/Customer_Loged.Master" AutoEventWireup="true" CodeBehind="orderDetails.aspx.cs" Inherits="Assignment_Template.orderDetails" %>



<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Order Details</title>
    <style type="text/css">
        #contentCon
        {
            width:80%;
            margin:0 auto;  
        }
        .gridview{
            width:80%;
            margin:0 auto;  
        }
    </style>
    
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div id="contentCon">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BorderStyle="Solid" Caption="Your Order Details" CaptionAlign="Top" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gridview">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="art_Id" HeaderText="Art ORDER" SortExpression="art_Id" />
                    <asp:BoundField DataField="order_Qty" HeaderText="Order Quantity" SortExpression="order_Qty" />
                    <asp:BoundField DataField="order_DateTime" HeaderText="Order Date Time" SortExpression="order_DateTime" />
                    <asp:BoundField DataField="order_status" HeaderText="Order Status" SortExpression="order_status" />
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

            <asp:Button ID="HomeBtn" runat="server" Text="Back To Home Page" PostBackUrl="~/Customer_gallery_view.aspx" />
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Order_Details.art_Id, Order_Details.order_Qty, Art_Order.order_DateTime, Art_Order.order_status FROM Order_Details INNER JOIN Art_Order ON Order_Details.art_Order_Id = Art_Order.art_Order_Id WHERE (Order_Details.art_Order_Id = @art_Order_Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="art_Order_Id" QueryStringField="para" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>