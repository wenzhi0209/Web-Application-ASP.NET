<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="Customer_gallery_view.aspx.cs" Inherits="Assignment_Template.Customer_gallery_view" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link rel="stylesheet" href="StyleSheet/gallery_view.css" />

    <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       

    <div id="art_Gallery">
        
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
            <div class="artBox">
                <a href="Art_detail.aspx?para=3">
                <img src="Img/Customer_gallery_view res/B-TEST.jpg"/>
                </a>
                <div class="buttonCon">
                    <div class="ctrlBtn"><img src="Img/Customer_gallery_view res/favorite_border-24px.svg" /></div>
                    <div class="ctrlBtn"><img src="Img/Customer_gallery_view res/add_shopping_cart-24px.svg" /></div>
                </div>
                <p class="artTitle">No title for this ark</p>
                <p class="artist">Unknown</p>
                <p class="price">RM 18</p>
            </div>
            


        </asp:PlaceHolder>

        
        
        <!--
            <div class="artBox">
                <img src="Img/Customer_gallery_view res/B-TEST.jpg"/>
                
                <div class="buttonCon">
                    <div class="ctrlBtn"><img src="Img/Customer_gallery_view res/favorite_border-24px.svg" /></div>
                    <div class="ctrlBtn"><img src="Img/Customer_gallery_view res/add_shopping_cart-24px.svg" /></div>
                </div>
                <p class="artTitle">No title for this ark</p>
                <p class="artist">Unknown</p>
                <p class="price">RM 18</p>
            </div>
            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="Img/Customer_gallery_view res/A-TEST.jpg" NavigateUrl="~/Art_detail.aspx"></asp:HyperLink>
        <div class="artBox"><img src="Img/Customer_gallery_view res/B-TEST.jpg"/></div>
        <div class="artBox"><img src="Img/Customer_gallery_view res/C-TEST.jpg"/></div>
        <div class="artBox"><img src="Img/Customer_gallery_view res/B-TEST.jpg"/></div>
        <div class="artBox"><img src="Img/Customer_gallery_view res/A-TEST.jpg"/></div>
        <div class="artBox"><img src="Img/Customer_gallery_view res/C-TEST.jpg"/></div>
        <div class="artBox"><img src="Img/Customer_gallery_view res/A-TEST.jpg"/></div>
        <div class="artBox"><img src="Img/Customer_gallery_view res/D-TEST.jpg"/></div>
        <div class="artBox"><img src="Img/Customer_gallery_view res/E-TEST.jpg"/></div>
        -->
        
    </div>
  

</asp:Content>



