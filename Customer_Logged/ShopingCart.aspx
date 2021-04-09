<%@ Page Language="C#" MasterPageFile="~/Master_Page/Customer_Loged.Master" AutoEventWireup="true" CodeBehind="ShopingCart.aspx.cs" Inherits="Assignment_Template.ShopingCart" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Shoping Cart</title>
    <style type="text/css">
        #ContentCon {
            width: 80%;
            margin: 50px auto;
        }

        .table_style {
            width: 80%;
            border-collapse: collapse;
            border: solid 1px black;
            margin: 50px auto;
            text-align: center;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(43, 174, 226, 0.19);
        }

        .table_style tr {
            border: solid 1px black;
        }

        .art_con {
           width:50%;
           min-width:200px;
        }

        .select_con {
            width: 6%;
            min-width: 40px;
        }

        .price_con {
            width: 11%;
            min-width: 90px;
        }

        .qty_con {
            width: 11%;
            min-width: 90px;
        }

        .total_con {
            width: 11%;
            min-width: 90px;
        }

        .opr_con {
            width: 11%;
            min-width: 90px;
        }

        .repeatRow > .art_con > #FlexCon{
            display: flex;
            width:100%;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            align-content: center;

        }

        .ImgBox {
            width:45%;
            height:120px;
            line-height: 120px;
            margin:25px auto;
            overflow:hidden;
        }

        .art_con_Img {
            max-width: 100%;
            max-height: 120px;
            vertical-align: middle;
        }

        .art_con_Label {
            display: block;
            width: 55%;
            text-align: left;
            justify-content:left;
        }

        .CheckOutBtn{
            display:block;
            text-align:center;
            margin:35px auto;
            width:250px;
            font-size:16px;
            box-sizing:border-box;
            border:1px solid black;
            line-height:40px;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.1);
            font-weight:bold;
        }
        .CheckOutBtn:hover
        {
            background-color:rgb(43, 174, 226);
            transition:linear 0.3s;
            color:white;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="ContentCon">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
            <HeaderTemplate>
                <table class="table_style">
                    <tr>
                        <th class="select_con"></th>
                        <th class="art_con">
                            <p>Art</p>
                        </th>
                        <th class="price_con">
                            <p>Unit Price</p>
                        </th>
                        <th class="qty_con">
                            <p>Quantity</p>
                        </th>
                        <th class="total_con">
                            <p>Sub-Total</p>
                        </th>
                        <th class="opr_con">
                            <p>Operation</p>
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="repeatRow" runat="server">
                    <td class="select_con">
                        <asp:CheckBox ID="selectCheckBox" runat="server" Checked='<%#Convert.ToBoolean(Eval("check_Sta"))%>' OnCheckedChanged="CheckBox2_CheckedChanged" AutoPostBack="True" />
                    </td>
                    <td class="art_con">
                        <div id="FlexCon">
                        <div class="ImgBox">
                            <asp:Image ID="art_Img" runat="server" ImageUrl='<%# Eval("art_Img").ToString() %>' CssClass="art_con_Img"></asp:Image>
                        </div>
                        <asp:Label ID="art_Title" runat="server" Text='<%#Eval("art_Title")%>' CssClass="art_con_Label"></asp:Label>
                        </div>
                    </td>
                    <td class="price_con">
                        <%#Eval("art_Price")%>
                    </td>

                    <td class="qty_con">
                        <asp:TextBox ID="art_Quantity" runat="server" Text='<%#Eval("qty")%>' TextMode="Number" min=1 max='<%#Eval("available_Qty")%>' AutoPostBack="True" OnTextChanged="art_Quantity_TextChanged"></asp:TextBox>
                        <asp:HiddenField ID="HDavailable" value='<%#Eval("available_Qty")%>' runat="server" />
                    </td>
                    <td class="total_con">
                        <asp:UpdatePanel ID="UpTotalPrice" runat="server">
                        <ContentTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("subtotal")%>'></asp:Label>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="art_Quantity"/>
                            <asp:AsyncPostBackTrigger ControlID="selectCheckBox" />
                        </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td class="opr_con">
                        <asp:Button ID="removeBtn" runat="server" Text="Remove" CommandName="delete" CommandArgument='<%#Eval("cItem_Id")+","+(Container as RepeaterItem).ItemIndex%>' /></td>
                </tr>
               
                <asp:HiddenField ID="art_Id" Value='<%#Eval("art_Id")%>' runat="server" />
                <asp:HiddenField ID="cart_Id" Value='<%#Eval("cItem_Id")%>' runat="server" />
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>


                
        <asp:Button ID="PlaceOBtn" runat="server" Text="CheckOut" OnClick="PlaceOBtn_Click" CssClass="CheckOutBtn" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT Cart_Item.cItem_Id, Cart_Item.art_Id, Cart_Item.qty, Cart_Item.cust_Id, Art.art_Title, Art.art_Img, Art.art_Price, Art.available_Qty, Cart_Item.qty * Art.art_Price AS subtotal, Cart_Item.check_Sta FROM Cart_Item INNER JOIN Art ON Cart_Item.art_Id = Art.art_Id WHERE (Cart_Item.cust_Id = @cust_Id)"
        UpdateCommand="UPDATE Cart_Item SET check_Sta = @check_Sta, qty =@qty WHERE (cItem_Id = @cItem_Id)"
        DeleteCommand="DELETE FROM Cart_Item where cItem_Id=@cItem_Id">

        <DeleteParameters>
            <asp:Parameter Name="cItem_Id" />
        </DeleteParameters>

        <SelectParameters>
            <asp:SessionParameter Name="cust_Id" SessionField="CustId" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="check_Sta" />
            <asp:Parameter Name="qty" />
            <asp:Parameter Name="cItem_Id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>