<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment_Template.Checkout" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Checkout</title>
    <style type="text/css">
        #ContentCon
        {
            width:80%;
            margin: 50px auto;
        }
        .table_style
        {
            width:70%;
            border-collapse:collapse;
            border:solid 1px black;
            margin:50px auto;
            text-align:center;
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
        
        .price_con
        {
            width:12%;
        }
        .qty_con
        {
            width:12%;
        }
        .total_con
        {
            width:12%;
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
                <asp:Label ID="addLabel" runat="server" Text="Address"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Label ID="phoneNoLabel" runat="server" Text="Phone No"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCreated="Repeater1_ItemCreated">
                    <HeaderTemplate>
                             <table class="table_style">
                            <tr>
                                <th class="art_con">Art</th>
                                <th class="price_con">Unit Price</th>
                                <th class="qty_con">Quantity</th>
                                <th class="total_con">Sub-Total</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="art_con">
                                    <%#Eval("art_Title")%>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("art_Img") %>' Width="100px"></asp:Image>
                                </td>
                                <td class="price_con">
                                    <%#Eval("art_Price")%>
                                </td>

                                <td class="qty_con">
                                    <%#Eval("qty") %>
                                </td>
                                <td class="total_con">
                                    <asp:Label ID="subTotalLabel" runat="server" Text='<%#Eval("sub_total")%>'></asp:Label>
                            
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                
                </asp:Repeater>
                 Total:<asp:Label ID="totalLbl" runat="server" Text=""></asp:Label>
                 <asp:Button ID="PayBtn" runat="server" Text="Pay" OnClientClick="javascript:alert('Order Placed Succesfully')" OnClick="PayBtn_Click" />
            </div> 
    

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT Cart_Item.art_Id, Cart_Item.cItem_Id, Cart_Item.qty, Art.art_Title, Art.art_Img, Art.art_Price, Cart_Item.qty * Art.art_Price AS sub_total 
                FROM Cart_Item INNER JOIN Art ON Cart_Item.art_Id = Art.art_Id 
                where Cart_Item.check_Sta like 'true'">

            </asp:SqlDataSource>

           <br />

</asp:Content>