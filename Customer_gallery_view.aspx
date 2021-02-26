<%@ Page Language="C#" MasterPageFile="~/Master_Page/customer_Loged.Master" AutoEventWireup="true" CodeBehind="Customer_gallery_view.aspx.cs" Inherits="Assignment_Template.Customer_gallery_view" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Gallery View</title>
    <link rel="stylesheet" href="StyleSheet/gallery_view.css" />
    <style type="text/css">
        .arrowDown{
            display:block;
            margin:10px auto;
            width:250px;
            height:30px;
        }

        .arrowUp{
            display:block;
            margin:10px auto;
            width:250px;
            height:30px;
        }
  
        .artBox:hover{
            outline: 3px solid rgb(43, 174, 226);
            background-color: #ddd;
            transform-style: preserve-3d;
            transform: scale(1.2);
            transition: all ease 0.3s; 
        }

    </style>
    </asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <div id="gallery_Container">
        <asp:ImageButton ID="PreviousBtn" runat="server" ImageUrl="~/Img/Icon/arrow_up.svg" OnClick="PreviousBtn_Click" CssClass="arrowUp" Visible="False" ImageAlign="Middle" />

            <div id="art_Gallery">
        
                <asp:PlaceHolder ID="PlaceHolder1" runat="server">
            
            
                </asp:PlaceHolder>
        
       
            </div>

        <asp:ImageButton ID="NextBtn" runat="server" ImageUrl="~/Img/Icon/arrow_down.svg" OnClick="NextBtn_Click" CssClass="arrowDown" ImageAlign="Middle" />
    </div>

</asp:Content>



