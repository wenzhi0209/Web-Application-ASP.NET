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
        .price_con
        {
            width:18%;
        }
        .qty_con
        {
            width:18%;
        }
        .total_con
        {
            width:18%;
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

               <table>
                   <tr>
                       <td><asp:Label ID="addLabel" runat="server" Text="Address"></asp:Label></td>
                       <td><asp:TextBox ID="addBox" runat="server" Rows="3" TextMode="MultiLine" Text="sri pelangi condo jalan genting kelang 5330"></asp:TextBox></td>
                   </tr>

                   <tr>
                       <td><asp:Label ID="phoneNoLabel" runat="server" Text="Phone No"></asp:Label></td>
                       <td><asp:TextBox ID="phoneBox" runat="server"></asp:TextBox></td>
                   </tr>
               </table>
                    
            
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCreated="Repeater1_ItemCreated">
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
                            <tr>
                                <td class="art_con">
                                    <asp:Label ID="art_Title" runat="server" Text='<%#Eval("art_Title")%>'></asp:Label>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("art_Img") %>' Width="100px"></asp:Image>
                                </td>
                                <td class="price_con">
                                    <%#Eval("art_Price")%>
                                </td>

                                <td class="qty_con">
                                    <asp:Label ID="qtyLbl" runat="server" Text='<%#Eval("qty") %>'></asp:Label>
                                </td>
                                <td class="total_con">
                                    <asp:Label ID="subTotalLabel" runat="server" Text='<%#Eval("sub_total")%>'></asp:Label>
                            
                                </td>
                            </tr>
                            <asp:HiddenField ID="art_ID" Value='<%#Eval("art_Id")%>' runat="server" />
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                   
                </asp:Repeater>
                 Total:<asp:Label ID="totalLbl" runat="server" Text=""></asp:Label>
                 <br />
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