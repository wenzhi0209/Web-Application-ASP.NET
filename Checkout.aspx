<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment_Template.Checkout" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           
            <asp:Label ID="addLabel" runat="server" Text="Address"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label ID="phoneNoLabel" runat="server" Text="Phone No"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            
            <asp:Repeater ID="Repeater1" runat="server">
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
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("art_Img") %>' Width="100px"></asp:Image>
                        </td>
                        <td class="price_con">
                            <%#Eval("art_Price")%>
                        </td>

                        <td class="qty_con">
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" Text='<%#Bind("qty") %>'></asp:TextBox>
                        </td>
                        <td class="total_con">
                            <asp:Label ID="Label1" runat="server" Text="19.99"></asp:Label>
                        </td>
                    </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>

            </asp:Repeater>

              
                
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Cart_Item.art_Id, Cart_Item.cItem_Id, Cart_Item.qty, Art.art_Title, Art.art_Img, Art.art_Price, Cart_Item.qty * Art.art_Price AS sub_total FROM Cart_Item INNER JOIN Art ON Cart_Item.art_Id = Art.art_Id"></asp:SqlDataSource>

</asp:Content>