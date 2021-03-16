<%@ Page Language="C#" MasterPageFile="~/Master_Page/Customer_Loged.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="Assignment_Template.orderDetails" %>



<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Order Details</title>
    <style type="text/css">
        h1{
            text-align:center;
        }
        #contentCon
        {
            width:80%;
            margin:0 auto;  
        }
        .table_style
        {
            width:80%;
            border-collapse:collapse;
            border:solid 1px black;
            margin:50px auto;
            text-align:center;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(43, 174, 226, 0.19);
        }
        .table_style tr{
             border:solid 1px black;
        }

        .art_con
        {
            width:55%;
            min-width:200px;
        }
        
        .price_con
        {
            width:15%;
            min-width:90px;
        }
        .qty_con
        {
            width:15%;
            min-width:90px;
        }
        .total_con
        {
            width:15%;
            min-width:90px;
        }

        .repeatRow>.art_con
        {
            display: flex;
	        flex-direction: row;
	        flex-wrap: nowrap;
	        justify-content: space-between;
	        align-items: center;
	        align-content: center;
            padding: 0 25px;
        }
        .ImgBox{
            width:45%;
            height:120px;
            line-height: 120px;
            margin:25px auto;
            overflow:hidden;
        }

        .art_con_Img{
           max-width:100%;
           max-height:120px;
           vertical-align:middle;
        }

        .art_con_Label{
            display:block;
            height:150px;
            width:50%;
            line-height:150px;
            text-align:center;
        }
        .HomeBtn{
            display:block;
            text-align:center;
            margin:35px auto;
        }
    </style>
    
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Your Order Details</h1>
    <div id="contentCon">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" >
                <HeaderTemplate>
                    <table class="table_style">
                        <tr>
                            <th class="art_con"><p>Art</p></th>
                            <th class="price_con"><p>Unit Price</p></th>
                            <th class="qty_con"><p>Quantity</p></th>
                            <th class="total_con"><p>Sub-Total</p></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr class="repeatRow">
                        <td class="art_con">
                            <div class="ImgBox">
                                 <asp:Image ID="art_Img" runat="server" ImageUrl='<%# Eval("art_Img").ToString() %>' CssClass="art_con_Img"></asp:Image>
                            </div>
                            <asp:Label ID="art_Title" runat="server" Text='<%#Eval("art_Title")%>' CssClass="art_con_Label"></asp:Label>
                        </td>
                        <td class="price_con">
                            <%#Eval("price_each")%>
                        </td>

                        <td class="qty_con">
                            <%#Eval("order_Qty")%>
                        </td>
                        <td class="total_con">
                            <asp:Label ID="subTotalLabel" runat="server" Text='<%#Eval("sub_total")%>'></asp:Label>
                        </td>
                    </tr>

                    <asp:HiddenField ID="art_Id" Value='<%#Eval("art_Id")%>' runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    <tr>
                        <td colspan="4">
                           <asp:Label ID="totalAmtLbl" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

            <asp:Button ID="HomeBtn" runat="server" Text="Back To Home Page" PostBackUrl="~/Customer_gallery_view.aspx" CssClass="HomeBtn" />
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT Order_Details.order_Qty, Order_Details.price_each, Art.art_Title, Art.art_Img, Order_Details.art_Id,( Order_Details.order_Qty * Order_Details.price_each) as sub_total
FROM Order_Details INNER JOIN Art ON Order_Details.art_Id = Art.art_Id 
WHERE (Order_Details.art_Order_Id = @art_Order_Id)
ORDER BY orderD_Id
">
        <SelectParameters>
            <asp:QueryStringParameter Name="art_Order_Id" QueryStringField="para" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>