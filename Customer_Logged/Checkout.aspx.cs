using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net.Mime;
using System.Web.UI.WebControls;
using System.IO;
namespace Assignment_Template
{
    public partial class Checkout : System.Web.UI.Page
    {
        private static string userName = "";
        private static double totalprice = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
            if(Request.UrlReferrer == null)
            {
                Response.Redirect("~/Customer_Logged/ShopingCart.aspx");
            }
            if (!IsPostBack)
            {
                //get cust_id
                if (Session["UserId"] == null)
                {
                    userName = User.Identity.Name.ToString();
                    SqlConnection connDb;
                    string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
                    connDb = new SqlConnection(strConn);
                    connDb.Open();

                    string getUserId = "SELECT [UserId] FROM [vw_aspnet_Users] WHERE ([UserName] = @UserName)";
                    SqlCommand cmd = new SqlCommand(getUserId, connDb);
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    Session["UserId"] = cmd.ExecuteScalar().ToString();

                    string getCustId = "SELECT [cust_Id] FROM [Customer] WHERE ([UserId] = @UserId)";
                    cmd = new SqlCommand(getCustId, connDb);
                    cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                    Session["CustId"] = cmd.ExecuteScalar().ToString();
                    connDb.Close();
                }

                //get cust_info
                if(Session["cust_Name"] == null)
                {
                    SqlConnection connDb;
                    string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
                    connDb = new SqlConnection(strConn);
                    connDb.Open();

                    string getCustId = "SELECT [cust_Name],[cust_Address],[cust_PhoneNo] FROM [Customer] WHERE ([Cust_ID] = @Cust_ID)";
                    SqlCommand cmd = new SqlCommand(getCustId, connDb);
                    cmd.Parameters.AddWithValue("@Cust_ID", Session["CustId"].ToString());
                    SqlDataReader custDetails = cmd.ExecuteReader();
                    if (custDetails.HasRows)
                    {
                        while (custDetails.Read())
                        {
                            Session["cust_Name"] = custDetails["cust_Name"].ToString();
                            Session["cust_Address"] = custDetails["cust_Address"].ToString();
                            Session["cust_PhoneNo"] = custDetails["cust_PhoneNo"].ToString();
                        }
                    }
                    connDb.Close();
                }

                nameBox.Text = Session["cust_Name"].ToString();
                addBox.Text = Session["cust_Address"].ToString();
                phoneBox.Text = Session["cust_PhoneNo"].ToString();
            }

            if(PayMethodBox.SelectedValue=="card")
            {
                CardInfo.Visible = true;
            }
            else
            {
                CardInfo.Visible = false;
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType==ListItemType.Header)
            {
                totalprice = 0;
            }
            double subprice = 0;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label subTotalLabel = e.Item.FindControl("subTotalLabel") as Label;
                if (subTotalLabel.Text != "")
                {
                    subprice = double.Parse(subTotalLabel.Text.ToString());
                }
                totalprice = totalprice + subprice;
            }

            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label totalAmtLbl = e.Item.FindControl("totalAmtLbl") as Label;
                totalAmtLbl.Text = "Total amount need to paid : RM " + totalprice;
            }
        }

        protected void PayBtn_Click(object sender, EventArgs e)
        {
            //if got product then allow pay
            if (Repeater1.Items.Count > 0)
            {
                SqlConnection connDb;
                string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
                connDb = new SqlConnection(strConn);

                connDb.Open();

                //create order
                string sqlInArtOrder = "INSERT INTO Art_Order(order_status,cust_Id,address,phoneNo,total_Amt,country,state,postcode,receiver_Name,paid_By) " +
                    "VALUES ('Paid'," + Session["CustId"].ToString() + ",'" + addBox.Text.ToString() + "','" + phoneBox.Text.ToString() + "'," + totalprice + ",'" + countryBox.Text.ToString() + "','" + stateBox.Text.ToString() + "'," + pcodeBox.Text.ToString() + ",'" + nameBox.Text.ToString() + "','" + PayMethodBox.SelectedValue.ToString() + "') SELECT IDENT_CURRENT('Art_Order')";
                SqlCommand cmdSql = new SqlCommand(sqlInArtOrder, connDb);
                int recordIn = int.Parse(cmdSql.ExecuteScalar().ToString());
                Session["OrderID"] = recordIn;

                //crete order details
                //check if order create successfully insert order details
                if (recordIn > 0)
                {
                    for (int i = 0; i < Repeater1.Items.Count; i++)
                    {
                        string artIdValue = "";
                        string qtyValue = "";
                        string unitPValue = "";
                        Label qtyLbl = Repeater1.Items[i].FindControl("qtyLbl") as Label;
                        Label unitPLbl = Repeater1.Items[i].FindControl("unitPLbl") as Label;
                        HiddenField art_Id = Repeater1.Items[i].FindControl("art_ID") as HiddenField;

                        if (qtyLbl.Text != "")
                        {
                            qtyValue = qtyLbl.Text.ToString();
                        }
                        if (unitPLbl.Text != "")
                        {
                            unitPValue = unitPLbl.Text.ToString();
                        }
                        if (art_Id.Value != "")
                        {
                            artIdValue = art_Id.Value.ToString();
                        }
                        string sqlInOrderD = "INSERT INTO Order_Details(art_Order_Id, art_Id, order_Qty,price_each ) VALUES (" + recordIn + "," + artIdValue + "," + qtyValue + "," + unitPValue + ")";
                        cmdSql = new SqlCommand(sqlInOrderD, connDb);
                        cmdSql.ExecuteNonQuery();
                        string sqlUpdateArtQty = "UPDATE Art SET available_Qty =(available_Qty -1) where art_Id=@art_Id";
                        cmdSql = new SqlCommand(sqlUpdateArtQty, connDb);
                        cmdSql.Parameters.AddWithValue("art_Id", artIdValue);
                        cmdSql.ExecuteNonQuery();
                    }
                }
                connDb.Close();

                //send email
                SendEmail();
                //redirect to details page
                //Response.Write();
                Response.Redirect("~/Customer_Logged/OrderDetails.aspx?para=" + recordIn);
            }
        }
        
        //Email sending function
        public void SendEmail()
        {
            string orderDetails = "";
            //generate order details
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                string artName = "";
                string qtyValue = "";
                string unitPValue = "";
                string subTotalValue = "";
                Label qtyLbl = Repeater1.Items[i].FindControl("qtyLbl") as Label;
                Label unitPLbl = Repeater1.Items[i].FindControl("unitPLbl") as Label;
                Label art_Title = Repeater1.Items[i].FindControl("art_Title") as Label;
                Label subTotalLabel = Repeater1.Items[i].FindControl("subTotalLabel") as Label;

                if (qtyLbl.Text != "")
                {
                    qtyValue = qtyLbl.Text.ToString();
                }
                if (unitPLbl.Text != "")
                {
                    unitPValue = unitPLbl.Text.ToString();
                }
                if (art_Title.Text != "")
                {
                    artName = art_Title.Text.ToString();
                }
                if (subTotalLabel.Text != "")
                {
                    subTotalValue = subTotalLabel.Text.ToString();
                }
                orderDetails = orderDetails + "<tr id=\"itemRow\">" +
                    "<td class=\"Art_col\">" + artName + "</td>" +
                    "<td class=\"Qty_col\">" + qtyValue + "</td>" +
                    "<td class=\"Up_col\">" + unitPValue + "</td>" +
                    "<td class=\"Total_col\">" + subTotalValue + "</td>" +
                    "</tr>";
            }

            //content
            string fromEmail = "hellologomy@gmail.com";
            string emailSMTPHost = "smtp.gmail.com";  //smtp server
            string emailSubject = "Your payment is successful with Logo Art Gallery - Order" + Session["OrderID"]; //subject
            string HTMLPath = Server.MapPath(@"../Email_Template/Checkout.html");
            StreamReader HtmlStr = new StreamReader(HTMLPath);
            string MailContent = HtmlStr.ReadToEnd();
            MailContent = MailContent.Replace("[ReceiverName]", nameBox.Text.ToString());
            MailContent = MailContent.Replace("[orderNo]", Session["OrderID"].ToString());
            MailContent = MailContent.Replace("[Date]", DateTime.Now.ToString("yyyy-MM-dd"));
            MailContent = MailContent.Replace("[Price]", totalprice.ToString());
            MailContent = MailContent.Replace("[ImageSrc]","cid:MyImage");
            MailContent = MailContent.Replace("[DetailTable]", orderDetails);
            MailContent = MailContent.Replace("[TotalAmt]", totalprice.ToString());
            MailContent = MailContent.Replace("[Type]", PayMethodBox.SelectedValue.ToString());

            HtmlStr.Close();
            string emailBody = MailContent;

            //get customer email
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
            connDb.Open();
            string sqlGetEmail = "SELECT [Email] FROM [vw_aspnet_MembershipUsers] where UserId=@UserId";
            SqlCommand cmdSql = new SqlCommand(sqlGetEmail, connDb);
            cmdSql.Parameters.AddWithValue("UserId", Session["UserId"]);
            string toEmail = cmdSql.ExecuteScalar().ToString();
            connDb.Close();
            

            string emailName = fromEmail; //sender name
            string emailPwd = "hellologo0627"; //sender password

            string attachmentPath = Server.MapPath(@"../Master_Page/logo-social.png");
            Attachment inline = new Attachment(attachmentPath);
            inline.ContentDisposition.Inline = true;
            inline.ContentDisposition.DispositionType = DispositionTypeNames.Inline;
            inline.ContentId = "MyImage";
            inline.ContentType.MediaType = "image/png";

            try
            {
                using (MailMessage msg = new MailMessage(fromEmail, toEmail, emailSubject, emailBody))
                {
                    msg.IsBodyHtml = true;  //allow html
                    //msg.To.Add("xxx.xxx@hotmail.com");    //multiple receiver
                    msg.Priority = MailPriority.High;

                    msg.Attachments.Add(inline);

                    SmtpClient mailClient = new SmtpClient(emailSMTPHost);
                    mailClient.UseDefaultCredentials = false;
                    mailClient.Credentials = new System.Net.NetworkCredential(emailName, emailPwd);
                    mailClient.EnableSsl = true;

                    mailClient.Send(msg);
                }
            }
            catch (Exception ex)
            {
                return;
            }
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            addBox.Text = "";
            CardNoBox.Text = "";
            nameBox.Text = "";
            pcodeBox.Text = "";
            phoneBox.Text = "";
            stateBox.SelectedIndex=0;
            PayMethodBox.SelectedIndex = 0;
            CVVBox.Text = "";
            MonthBox.Text = "";
            YearBox.Text = "";

        }
    }
}