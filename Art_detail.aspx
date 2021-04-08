<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="Art_detail.aspx.cs" Inherits="Assignment_Template.Art_detail" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Art Details</title>
    <style type="text/css">
        .Image_Disp{
            display:block;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            width:50%;
            max-width:650px;
            height:auto;
            margin: 30px auto;
        }
        .Image_Title{
            display:block;
            text-align:center;
            font-weight:bold;
            width:80%;
            height:auto;
            margin: 20px auto;
            font-size:24px;
        }
        .Image_Desc{
            display:block;
            text-align:center;
            width:80%;
            height:auto;
            margin: 20px auto;
        }
        .Image_Price{
            display:block;
            text-align:center;
            width:80%;
            height:auto;
            margin: 20px auto;
        }
        .Qty_Available{
            display:block;
            text-align:center;
            width:80%;
            height:auto;
            margin: 20px auto;
        }
        .AuthorName{
            display:block;
            text-align:center;
            width:80%;
            height:auto;
            margin: 20px auto;
            font-size:20px;
        }
        #flexbox{
            display: flex;
	        flex-direction: row;
	        flex-wrap: nowrap;
	        justify-content: space-around;
	        align-items: center;
	        align-content: center;
            width:60%;
            height:auto;
            margin: 20px auto;
        }
        .icon{
            width:50px;
            height:50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            <asp:Image ID="Image_Disp" runat="server" CssClass="Image_Disp" />
            <asp:Label ID="Image_Title" runat="server" Text="" CssClass="Image_Title"></asp:Label>
            <asp:Label ID="AuthorName" runat="server" Text="" CssClass="AuthorName"></asp:Label>
            <asp:Label ID="Image_Desc" runat="server" Text="" CssClass="Image_Desc"></asp:Label>
            <asp:Label ID="Image_Price" runat="server" Text="" CssClass="Image_Price"></asp:Label>
            <asp:Label ID="Qty_Available" runat="server" Text="" CssClass="Qty_Available"></asp:Label>
            <div id="flexbox"> 
                 <asp:ImageButton ID="Add_to_SC" runat="server" ImageUrl="~/Img/Icon/add_shopping_cart-24px.svg" CssClass="icon" OnClick="Add_to_SC_Click"/>
                 <asp:ImageButton ID="Add_to_FL" runat="server" ImageUrl="~/Img/Icon/favorite_border-24px.svg" CssClass="icon" OnClick="Add_to_FL_Click"/>
            </div>
        </div>
       
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Art.art_Id, Art.art_Title, Art.art_Img, Art.art_Detail, Art.art_Price, Art.available_Qty, Author.author_Name FROM Art INNER JOIN Author ON Art.author_Id = Author.author_Id WHERE (Art.art_Id = @art_Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="art_Id" QueryStringField="para" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>

