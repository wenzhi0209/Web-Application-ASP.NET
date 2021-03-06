<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="Art_detail.aspx.cs" Inherits="Assignment_Template.Art_detail" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Art Details</title>
    <style type="text/css">
        .Image_Disp{
            display:block;
            width:50%;
            height:auto;
            margin: 20px auto;
        }
        .Image_Title{
            display:block;
            text-align:center;
            font-weight:bold;
            width:80%;
            height:auto;
            margin: 20px auto;
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
            <asp:Label ID="Image_Title" runat="server" Text="Label" CssClass="Image_Title"></asp:Label>
            <asp:Label ID="Image_Desc" runat="server" Text="Label" CssClass="Image_Desc"></asp:Label>
            <asp:Label ID="Image_Price" runat="server" Text="Label" CssClass="Image_Price"></asp:Label>
            
            <div id="flexbox"> 
                    <asp:ImageButton ID="Add_to_SC" runat="server" ImageUrl="~/Img/Icon/add_shopping_cart-24px.svg" CssClass="icon" OnClick="Add_to_SC_Click"/>
                    <asp:ImageButton ID="Add_to_FL" runat="server" ImageUrl="~/Img/Icon/favorite_border-24px.svg" CssClass="icon" OnClick="Add_to_FL_Click"/>
            </div>
        </div>
       
    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Art] WHERE ([art_Id] = @art_Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="art_Id" QueryStringField="para" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>

