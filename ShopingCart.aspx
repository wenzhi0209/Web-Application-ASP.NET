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
                <thead>
                    <tr>
                        <td class="select_con"><asp:CheckBox ID="CheckBox1" runat="server" /></td>
                        <td class="art_con">Art</td>
                        <td class="price_con">Unit Price</td>
                        <td class="qty_con">Quantity</td>
                        <td class="total_con">Total</td>
                        <td class="opr_con">Operation</td>
                    </tr>
                </thead>
            </table>
        </div>
</asp:Content>

