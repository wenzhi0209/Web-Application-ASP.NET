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

        input::-webkit-outer-spin-button,input::-webkit-inner-spin-button
        {
            -webkit-appearance: none;
            margin: 0;
        }

        .AutoFBtn {
            display: block;
            margin: 15px auto;
        }

        #cardInfoSec
        {
            margin:20px auto;
        }

        .cInfoContainer{
            font-size: 16px;
            width: 90%;
            max-width: 500px;
            height:40px;
            margin: 2px auto;
            display:block;
        }

        #slash
        {
            display: block;
            width: 20px;
            text-align:center;
            padding: 4px 15px;
            font-size: 20px;
            font-weight: bold;
            float:left;
        }

        .cInfoContainer label
        {
            display: block;
            width: 35%;
            padding: 8px 15px;
            font-size: 16px;
            font-weight: bold;
            float:left;
        }
        .cNo_style
        {
            font-size: 16px;
            display: block;
            padding: 8px 15px;
            width: 50%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none;
            overflow: hidden;
            float:left;
        }
        .M_Y_style
        {
            font-size: 16px;
            display: block;
            padding: 8px 15px;
            width: 10%;
            min-width:40px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none;
            overflow: hidden;
            float:left;
        }
        .cvv_style
        {
            font-size: 16px;
            display: block;
            padding: 8px 15px;
            width: 20%;
            min-width:80px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none;
            overflow: hidden;
            float:left;
        }
        .star
        {
            float:left;
        }
        .totalAmtStyle
        {
            display:block;
            padding:8px 0px;
            font-weight:bold;
        }

        .PayBtn{
            display:block;
            text-align:center;
            margin:35px auto;
            width:250px;
            font-size:16px;
            box-sizing:border-box;
            border:1px solid black;
            line-height:40px;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.1);
            font-weight:bold;
        }

        .PayBtn:hover
        {
            background-color:rgb(43, 174, 226);
            transition:linear 0.3s;
            color:white;
        }
        .summaryBox{
            width: 80%;
            margin:25px auto;
            border: 1px solid gray;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.1);
            padding:20px 30px;
        }
        .Clear_Btn
        {
            display:block;
            text-align:center;
            margin:35px auto;
            width:150px;
            font-size:16px;
            box-sizing:border-box;
            border:1px solid black;
            line-height:40px;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1), 0 3px 10px 0 rgba(0, 0, 0, 0.1);
            font-weight:bold;
        }
        .Clear_Btn:hover
        {
            background-color:rgb(43, 174, 226);
            transition:linear 0.3s;
            color:white;
        }


    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="ContentCon">

        <h1>CheckOut</h1>

        <div id="shipDetails">
            <h3>Shipping Details</h3>
            <div class="inputContainer">
                <label>Name</label>
                <asp:TextBox ID="nameBox" runat="server" CssClass="SDtextbox_style"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqName" runat="server" ErrorMessage="Please enter the Name" ControlToValidate="nameBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <span></span>
            </div>
            <div class="inputContainer">
                <label>Phone</label>
                <asp:TextBox ID="phoneBox" runat="server" CssClass="SDtextbox_style" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqPhone" runat="server" ErrorMessage="Please enter the Phone Number" ControlToValidate="phoneBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ExpPhone" runat="server" ErrorMessage="Please enter valid Phone Number" ControlToValidate="phoneBox" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]{10,11}$">*</asp:RegularExpressionValidator>
            </div>

            <div class="inputContainer">
                <label>Address</label>
                <asp:TextBox ID="addBox" runat="server" CssClass="SDtextbox_style" Rows="2" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqAddress" runat="server" ErrorMessage="Please enter the Address" ControlToValidate="addBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <span></span>
            </div>

            <div class="inputContainer">
                <label>Country</label>
                <asp:TextBox ID="countryBox" runat="server" CssClass="SDtextbox_style" Text="Malaysia" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqCountry" runat="server" ErrorMessage="Please enter the Country" ControlToValidate="countryBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <span></span>
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
                <span></span>
            </div>
            <div class="inputContainer">
                <label>PostCode</label>
                <asp:TextBox ID="pcodeBox" runat="server" CssClass="SDtextbox_style"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqPcode" runat="server" ErrorMessage="Please enter the Postcode" ControlToValidate="pcodeBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ExpPcode" runat="server" ErrorMessage="Invalid Postcode" ControlToValidate="pcodeBox" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]{5}$">*</asp:RegularExpressionValidator>
            </div>
            <div class="inputContainer">
                <label>Payment Method</label>
                <asp:DropDownList ID="PayMethodBox" runat="server" CssClass="SDtextbox_style" AutoPostBack="True">
                    <asp:ListItem Value="none">--Please select Payment Method</asp:ListItem>
                    <asp:ListItem Value="card">Credit/Debit Card</asp:ListItem>
                    <asp:ListItem Value="online">Online Banking</asp:ListItem>
                    <asp:ListItem Value="cash">Cash on Delivery</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ReqPayMethod" runat="server" ErrorMessage="Please select payment method" ControlToValidate="PayMethodBox" ForeColor="Red" SetFocusOnError="True" InitialValue="none">*</asp:RequiredFieldValidator>
                <span></span>
            </div>

           <!--Card Info only visible when choose credit/debit card payment-->
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="PayMethodBox" />
                </Triggers>
            <ContentTemplate>
            <asp:PlaceHolder ID="CardInfo" runat="server" Visible="false">
                <div id="cardInfoSec">
                <h3>Enter Card Info</h3>
                <div class="cInfoContainer">
                    <label>Card No</label>
                    <asp:TextBox ID="CardNoBox" runat="server" CssClass="cNo_style"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqCardNo" runat="server" ErrorMessage="Please enter the Card No" ControlToValidate="CardNoBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ExpCardNo" runat="server" ControlToValidate="CardNoBox" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d{16}$" >*</asp:RegularExpressionValidator>
                </div>
                <div class="cInfoContainer">
                    <label>Month/Year</label>
                    <asp:TextBox ID="MonthBox" runat="server" CssClass="M_Y_style" MaxLength="2" TextMode="SingleLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqMonth" runat="server" ErrorMessage="Please enter the Month" ControlToValidate="MonthBox" ForeColor="Red" SetFocusOnError="True" CssClass="star">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ExpMonth" runat="server" ErrorMessage="Invalid Month" ValidationExpression="^([1-9]|1[012])$" ForeColor="Red" SetFocusOnError="True" CssClass="star" ControlToValidate="MonthBox">*</asp:RegularExpressionValidator>
                    <div id="slash">/</div>
                    <asp:TextBox ID="YearBox" runat="server" CssClass="M_Y_style" MaxLength="2" TextMode="SingleLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqYear" runat="server" ErrorMessage="Please enter the Year" ControlToValidate="YearBox" ForeColor="Red" SetFocusOnError="True" CssClass="star">*</asp:RequiredFieldValidator>
                </div>
                <div class="cInfoContainer">
                    <label>CVV/CVV2</label>
                    <asp:TextBox ID="CVVBox" runat="server" CssClass="cvv_style" MaxLength="4" ReadOnly="False" TextMode="SingleLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqCVV" runat="server" ErrorMessage="Please enter the CVV/CVV2" ControlToValidate="CVVBox" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </div>
                </div>
                
            </asp:PlaceHolder>
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <asp:Button ID="clearBtn" runat="server" Text="Clear" CssClass="Clear_Btn" CausesValidation="False" OnClick="clearBtn_Click"/>
        <asp:ValidationSummary ID="ValidationSum" runat="server" HeaderText="Summary of Errors" CssClass="summaryBox" />


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
                        <asp:Label ID="totalAmtLbl" runat="server" Text="" CssClass="totalAmtStyle"></asp:Label>
                    </td>
                </tr>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Button ID="PayBtn" runat="server" Text="Pay" CssClass="PayBtn" OnClick="PayBtn_Click" />
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