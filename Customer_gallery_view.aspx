<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="Customer_gallery_view.aspx.cs" Inherits="Assignment_Template.Customer_gallery_view" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link rel="stylesheet" href="Customer_gallery_view res/homepage.css" />

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       

    <div id="art_Gallery">
        <div class="artBox">
            <img src="Customer_gallery_view res/A-TEST.jpg"/>
            <div class="buttonCon">
                <div class="ctrlBtn"><img src="Customer_gallery_view res/favorite_border-24px.svg" /></div>
                <div class="ctrlBtn"><img src="Customer_gallery_view res/add_shopping_cart-24px.svg" /></div>
            </div>
            <p class="artTitle">No title for this ark</p>
            <p class="artist">Unknown</p>
            <p class="price">RM 18</p>
        </div>
        <div class="artBox"><img src="Customer_gallery_view res/B-TEST.jpg"/></div>
        <div class="artBox"><img src="Customer_gallery_view res/C-TEST.jpg"/></div>
        <div class="artBox"><img src="Customer_gallery_view res/B-TEST.jpg"/></div>
        <div class="artBox"><img src="Customer_gallery_view res/A-TEST.jpg"/></div>
        <div class="artBox"><img src="Customer_gallery_view res/C-TEST.jpg"/></div>
        <div class="artBox"><img src="Customer_gallery_view res/A-TEST.jpg"/></div>
        <div class="artBox"><img src="Customer_gallery_view res/D-TEST.jpg"/></div>
        <div class="artBox"><img src="Customer_gallery_view res/E-TEST.jpg"/></div>
    </div>

</asp:Content>



