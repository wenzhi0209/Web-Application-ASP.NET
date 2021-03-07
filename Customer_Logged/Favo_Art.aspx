<%@ Page Language="C#" MasterPageFile="~/Master_Page/Customer_Account.Master" AutoEventWireup="true" CodeBehind="Favo_Art.aspx.cs" Inherits="Assignment_Template.Customer_Logged.Favo_Art" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        h1 {text-align: center;}
        .auto-style1 {
            width: 125px;
            height: 103px;
        }
        .auto-style2 {
            text-align: center;
        }

        .ImgContainer{
            width: 400px;
            height:400px;
        }
        .FavoImg{
            height:100%;
            width:auto;
            margin: 0 auto;
        }
        
        </style>
    </asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div>
            <h1>Your Favourite</h1>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <div class="ImgContainer">
                </HeaderTemplate>

                <ItemTemplate>
                    <asp:HyperLink ID="OdetailLink" runat="server" NavigateUrl='<%# "~/Art_detail.aspx?para="+Eval("art_Id").ToString()%>'>
                        <asp:Image ID="Art_Img" ImageUrl='<%#Eval("art_Img").ToString()%>' runat="server" CssClass="FavoImg" />
                    </asp:HyperLink>
                </ItemTemplate>
                
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
            
           
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Art.art_Img, Art.art_Title, Art.art_Id FROM Favo_Art INNER JOIN Art ON Favo_Art.art_Id = Art.art_Id WHERE (Favo_Art.cust_Id = @cust_Id)"
        >
        <SelectParameters>
            <asp:Parameter Name="cust_Id" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>