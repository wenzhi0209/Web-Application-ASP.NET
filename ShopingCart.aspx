<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="ShopingCart.aspx.cs" Inherits="Assignment_Template.ShopingCart" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Shoping Cart</title>
    <style type="text/css">
        .table_style
        {
            width:80%;
            border-collapse:collapse;
            border:solid 1px black;
            margin:50px auto;
        }
        .select_con
        {
            width:6%;
        }
        .art_con
        {
            width:50%;
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


    </style>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
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
                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%#Convert.ToBoolean(Eval("check_Sta"))%>' /></td>
                        <td class="art_con">
                            <%#Eval("art_Title")%>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("art_Img") %>' Width="100px"></asp:Image>
                        </td>
                        <td class="price_con">
                            <%#Eval("art_Price")%>
                        </td>

                        <td class="qty_con">
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" Text='<%#Bind("qty") %>' OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
                        </td>
                        <td class="total_con">
                            <asp:Label ID="Label1" runat="server" Text="19.99"></asp:Label>
                        </td>
                        <td class="opr_con">
                            <asp:Button ID="Button1" runat="server" Text="+" CommandName="update" CommandArgument='<%#Eval("cItem_Id")+","+(Container as RepeaterItem).ItemIndex%>'/></td>
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
        UpdateCommand="UPDATE Cart_Item SET qty = @qty where cItem_Id=@cItem_Id">
        <UpdateParameters>
            <asp:Parameter Name="qty" />
            <asp:Parameter Name="cItem_Id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

