<%@ Page Language="C#" MasterPageFile="~/Master_Page/Customer_Loged.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment_Template.Checkout" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Checkout</title>
    <style type="text/css">
        #ContentCon {
            width: 80%;
            margin: 50px auto;
        }

        .table_style {
            width: 80%;
            border-collapse: collapse;
            border: solid 1px black;
            margin: 50px auto;
            text-align: center;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(43, 174, 226, 0.19);
        }

            .table_style tr {
                border: solid 1px black;
            }

        .art_con {
            width: 55%;
            min-width: 200px;
        }

        .price_con {
            width: 15%;
            min-width: 90px;
        }

        .qty_con {
            width: 15%;
            min-width: 90px;
        }

        .total_con {
            width: 15%;
            min-width: 90px;
        }

        .repeatRow > .art_con {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            align-content: center;
            padding: 0 25px;
        }

        .ImgBox {
            width: 45%;
            height: 120px;
            line-height: 120px;
            margin: 25px auto;
            overflow: hidden;
        }

        .art_con_Img {
            max-width: 100%;
            max-height: 120px;
            vertical-align: middle;
        }

        .art_con_Label {
            display: block;
            height: 150px;
            width: 50%;
            line-height: 150px;
            text-align: center;
        }

        #shipDetails {
            width: 80%;
            margin: 0 auto;
            min-width: 200px;
        }

        .inputContainer {
            font-size: 16px;
            width: 90%;
            max-width: 500px;
            margin: 5px auto;
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
            align-content: center;
        }

            .inputContainer label {
                display: block;
                width: 35%;
                padding: 8px 15px;
                font-size: 16px;
                font-weight: bold;
            }

        .SDtextbox_style {
            font-size: 16px;
            display: block;
            padding: 8px 15px;
            width: 50%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none;
            overflow: hidden;
        }

        .AutoFBtn {
            display: block;
            margin: 15px auto;
        }

        .PayBtn
        {
            display:block;
            margin:0 auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    

    <div id="ContentCon">

        <h1>CheckOut</h1>

        <div id="shipDetails">
            <p>Shipping Details</p>
            <div class="inputContainer">
                <label>Name</label>
                <asp:TextBox ID="nameBox" runat="server" CssClass="SDtextbox_style"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqName" runat="server" ErrorMessage="Please enter the Name" ControlToValidate="nameBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>
            <div class="inputContainer">
                <label>Phone</label>
                <asp:TextBox ID="phoneBox" runat="server" CssClass="SDtextbox_style"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqPhone" runat="server" ErrorMessage="Please enter the Phone Number" ControlToValidate="phoneBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>

            <div class="inputContainer">
                <label>Address</label>
                <asp:TextBox ID="addBox" runat="server" CssClass="SDtextbox_style" Rows="2" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqAddress" runat="server" ErrorMessage="Please enter the Address" ControlToValidate="addBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>

            <div class="inputContainer">
                <label>Country</label>
                <asp:TextBox ID="countryBox" runat="server" CssClass="SDtextbox_style" Text="Malaysia" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqCountry" runat="server" ErrorMessage="Please enter the Country" ControlToValidate="countryBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>
            <div class="inputContainer">
                <label>State</label>
                <asp:DropDownList ID="stateBox" runat="server"  CssClass="SDtextbox_style">
                    <asp:ListItem Value="none">--Please Select The State--</asp:ListItem>
                    <asp:ListItem>Johor</asp:ListItem>
                    <asp:ListItem>Kuala Lumpur</asp:ListItem>
                    <asp:ListItem>Kedah</asp:ListItem>
                    <asp:ListItem>Kelantan</asp:ListItem>
                    <asp:ListItem>Malacca</asp:ListItem>
                    <asp:ListItem>Negeri Sembilan</asp:ListItem>
                    <asp:ListItem>Pahang</asp:ListItem>
                    <asp:ListItem>Penang</asp:ListItem>
                    <asp:ListItem>Perak</asp:ListItem>
                    <asp:ListItem>Perlis</asp:ListItem>
                    <asp:ListItem>Putrajaya</asp:ListItem>
                    <asp:ListItem>Sabah</asp:ListItem>
                    <asp:ListItem>Sarawak</asp:ListItem>
                    <asp:ListItem>Selangor</asp:ListItem>
                    <asp:ListItem>Terengganu</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ReqState" runat="server" ErrorMessage="Please select the state" ControlToValidate="stateBox" ForeColor="Red" SetFocusOnError="True" InitialValue="none">*</asp:RequiredFieldValidator>
            </div>
            <div class="inputContainer">
                <label>PostCode</label>
                <asp:TextBox ID="pcodeBox" runat="server" CssClass="SDtextbox_style"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqPcode" runat="server" ErrorMessage="Please enter the Postcode" ControlToValidate="pcodeBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>
        </div>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" >
            <HeaderTemplate>
                <table class="table_style">
                    <tr>
                        <th class="art_con">
                            <p>Art</p>
                        </th>
                        <th class="price_con">
                            <p>Unit Price</p>
                        </th>
                        <th class="qty_con">
                            <p>Quantity</p>
                        </th>
                        <th class="total_con">
                            <p>Sub-Total</p>
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="repeatRow">
                    <td class="art_con">
                        <div class="ImgBox">
                            <asp:Image ID="art_Img" runat="server" ImageUrl='<%# Eval("art_Img").ToString() %>' CssClass="art_con_Img"></asp:Image>
                        </div>
                        <asp:Label ID="art_Title" runat="server" Text='<%#Eval("art_Title")%>' CssClass="art_con_Label"></asp:Label>
                    </td>
                    <td class="price_con">
                        <asp:Label ID="unitPLbl" runat="server" Text='<%#Eval("art_Price")%>'></asp:Label>
                    </td>

                    <td class="qty_con">
                        <asp:Label ID="qtyLbl" runat="server" Text='<%#Eval("qty")%>'></asp:Label>
                    </td>
                    <td class="total_con">
                        <asp:Label ID="subTotalLabel" runat="server" Text='<%#Eval("sub_total")%>'></asp:Label>
                    </td>
                </tr>

                <asp:HiddenField ID="art_Id" Value='<%#Eval("art_Id")%>' runat="server" />
            </ItemTemplate>
            <FooterTemplate>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="totalAmtLbl" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <!--OnClick="PayBtn_Click"-->
        <asp:Button ID="PayBtn" runat="server" Text="Pay" CssClass="PayBtn"/>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT Cart_Item.art_Id, Cart_Item.cItem_Id, Cart_Item.qty, Cart_Item.cust_Id,Art.art_Title, Art.art_Img, Art.art_Price, Cart_Item.qty * Art.art_Price AS sub_total
                FROM Cart_Item INNER JOIN Art ON Cart_Item.art_Id = Art.art_Id
                where Cart_Item.check_Sta like 'true' AND Cart_Item.cust_Id=@cust_Id">
        <SelectParameters>
            <asp:SessionParameter Name="cust_Id" SessionField="CustId" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
</asp:Content>