<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="ShopingCart.aspx.cs" Inherits="Assignment_Template.ShopingCart" %>

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
        }
        .table_style tr{
             border:solid 1px black;
        }
        .select_con
        {
            width:6%;
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
        
        .price_con
        {
            width:11%;
        }
        .qty_con
        {
            width:11%;
        }
        .total_con
        {
            width:11%;
        }
        .opr_con
        {
            width:11%;
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
                            <th class="select_con"><asp:CheckBox ID="CheckBox1" runat="server" /></th>
                            <th class="art_con">Art</th>
                            <th class="price_con">Unit Price</th>
                            <th class="qty_con">Quantity</th>
                            <th class="total_con">Sub-Total</th>
                            <th class="opr_con">Operation</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr>
                        <td class="select_con">
                            <asp:CheckBox ID="selectCheckBox" runat="server" Checked='<%#Convert.ToBoolean(Eval("check_Sta"))%>' OnCheckedChanged="CheckBox2_CheckedChanged" AutoPostBack="True" /></td>
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
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            
            <asp:Button ID="PlaceOBtn" runat="server" Text="CheckOut" PostBackUrl="~/Checkout.aspx" />
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Cart_Item.cItem_Id, Cart_Item.art_Id, Cart_Item.qty, Art.art_Title, Art.art_Img, Art.art_Price, Cart_Item.qty * Art.art_Price AS subtotal, Cart_Item.check_Sta FROM Cart_Item INNER JOIN Art ON Cart_Item.art_Id = Art.art_Id" 
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

