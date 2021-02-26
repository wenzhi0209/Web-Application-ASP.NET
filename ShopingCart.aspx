<%@ Page Language="C#" MasterPageFile="~/Master_Page/anonymous.Master" AutoEventWireup="true" CodeBehind="ShopingCart.aspx.cs" Inherits="Assignment_Template.ShopingCart" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Shoping Cart</title>
    <style type="text/css">
        #ContentCon
        {
            width:80%;
            margin: 50px auto;
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
            display: flex;
	        flex-direction: row;
	        flex-wrap: nowrap;
	        justify-content: space-between;
	        align-items: center;
	        align-content: center;
        }

        .select_con
        {
            width:6%;
            min-width:40px;
        }
        
        .price_con
        {
            width:11%;
            min-width:90px;
        }
        .qty_con
        {
            width:11%;
            min-width:90px;
        }
        .total_con
        {
            width:11%;
            min-width:90px;
        }
        .opr_con
        {
            width:11%;
            min-width:90px;
        }

        .art_con_Label{
            display:block;
            height:200px;
            width:100px;
            line-height:200px;
        }
        .art_con_Img{
           display:block;
           height:200px;
           margin:25px auto;
        }


    </style>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="ContentCon">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                <HeaderTemplate>
                    <table class="table_style">
                        <tr>
                            <th class="select_con"></th>
                            <th class="art_con"><p>Art</p></th>
                            <th class="price_con"><p>Unit Price</p></th>
                            <th class="qty_con"><p>Quantity</p></th>
                            <th class="total_con"><p>Sub-Total</p></th>
                            <th class="opr_con"><p>Operation</p></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr>
                        <td class="select_con">
                            <asp:CheckBox ID="selectCheckBox" runat="server" Checked='<%#Convert.ToBoolean(Eval("check_Sta"))%>' OnCheckedChanged="CheckBox2_CheckedChanged" /></td>
                        <td class="art_con">
                            <asp:Label ID="art_Title" runat="server" Text='<%#Eval("art_Title")%>' CssClass="art_con_Label"></asp:Label>
                            <asp:Image ID="art_Img" runat="server" ImageUrl='<%# Eval("art_Img") %>' CssClass="art_con_Img"></asp:Image>
                        </td>
                        <td class="price_con">
                            <%#Eval("art_Price")%>
                        </td>

                        <td class="qty_con">
                            <%#Eval("qty")%>
                        </td>
                        <td class="total_con">
                            <asp:Label ID="Label1" runat="server" Text="19.99"></asp:Label>
                        </td>
                        <td class="opr_con">
                            <asp:Button ID="Button1" runat="server" Text="Remove" CommandName="delete" CommandArgument='<%#Eval("cItem_Id")+","+(Container as RepeaterItem).ItemIndex%>'/></td>
                    </tr>

                    <asp:HiddenField ID="art_Id" Value='<%#Eval("art_Id")%>' runat="server" />
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            
            <asp:Button ID="PlaceOBtn" runat="server" Text="CheckOut" OnClick="PlaceOBtn_Click" PostBackUrl="~/Checkout.aspx" />
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="DELETE Cart_Item FROM Cart_Item INNER JOIN Art ON Cart_Item.art_Id = Art.art_Id WHERE Art.available_Qty=0 SELECT Cart_Item.cItem_Id, Cart_Item.art_Id, Cart_Item.qty, Art.art_Title, Art.art_Img, Art.art_Price, Cart_Item.qty * Art.art_Price AS subtotal, Cart_Item.check_Sta, Art.available_Qty FROM Cart_Item INNER JOIN Art ON Cart_Item.art_Id = Art.art_Id" 
        UpdateCommand="UPDATE Cart_Item SET check_Sta = @check_Sta where cItem_Id=@cItem_Id"
        DeleteCommand="DELETE FROM Cart_Item where cItem_Id=@cItem_Id">

        <DeleteParameters>
            <asp:Parameter Name="cItem_Id" />
        </DeleteParameters>
        
        <UpdateParameters>
            <asp:Parameter Name="check_Sta" />
            <asp:Parameter Name="cItem_Id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

