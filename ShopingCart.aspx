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
            <table class="table_style">
                    <tr>
                        <th class="select_con"><asp:CheckBox ID="CheckBox1" runat="server" /></th>
                        <th class="art_con">Art</th>
                        <th class="price_con">Unit Price</th>
                        <th class="qty_con">Quantity</th>
                        <th class="total_con">Sub-Total</th>
                        <th class="opr_con">Operation</th>
                    </tr>

                    <tr>
                        <td class="select_con"><asp:CheckBox ID="CheckBox2" runat="server" /></td>
                        <td class="art_con">Art</td>
                        <td class="price_con">Unit Price</td>
                        <td class="qty_con">
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                        <td class="total_con">
                            <asp:Label ID="Label1" runat="server" Text="19.99"></asp:Label>
                        </td>
                        <td class="opr_con">Operation</td>
                    </tr>
                    <asp:PlaceHolder ID="PlaceHoldertable" runat="server"></asp:PlaceHolder>
                    
                

            </table>
        </div>
</asp:Content>

