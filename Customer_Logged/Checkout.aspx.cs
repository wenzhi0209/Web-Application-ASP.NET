using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment_Template
{
    public partial class Checkout : System.Web.UI.Page
    {
        static string userName = "";
        static string userId = "";
        static string custId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Get Customer ID can consider store at seesion
                //For easier understanding do it simple
                userName = User.Identity.Name.ToString();
                SqlConnection connDb;
                string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
                connDb = new SqlConnection(strConn);

                connDb.Open();

                string getUserId = "SELECT [UserId] FROM [vw_aspnet_Users] WHERE ([UserName] = @UserName)";
                SqlCommand cmd = new SqlCommand(getUserId, connDb);
                cmd.Parameters.AddWithValue("@UserName", userName);
                userId = cmd.ExecuteScalar().ToString();

                string getCustId = "SELECT [cust_Id],[cust_Address],[cust_PhoneNo] FROM [Customer] WHERE ([UserId] = @UserId)";
                cmd = new SqlCommand(getCustId, connDb);
                cmd.Parameters.AddWithValue("@UserId", userId);
                SqlDataReader custDetails = cmd.ExecuteReader();
                if (custDetails.HasRows)
                {
                    while (custDetails.Read())
                    {
                        custId = custDetails["cust_Id"].ToString();
                        addBox.Text = custDetails["cust_Address"].ToString();
                        phoneBox.Text = custDetails["cust_PhoneNo"].ToString();
                    }
                }
                connDb.Close();
                HDcustId.Value = custId;

            }

        }

        protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            totalLbl.Text = Repeater1.Items.Count.ToString();
            double totalprice = 0;
            double subprice = 0;
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                Label lblText = Repeater1.Items[i].FindControl("subTotalLabel") as Label;
                if (lblText.Text != "")
                {
                    subprice = double.Parse(lblText.Text.ToString());
                }
                totalprice = totalprice + subprice ;
            }
            totalLbl.Text = totalprice.ToString();
        }

        protected void PayBtn_Click(object sender, EventArgs e)
        {
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
           
            connDb.Open();

            //Temporaly put the order status =paid if future posible allow customer create their and pay it within 3 days
            //but is no hope already
            string sqlInArtOrder = "INSERT INTO Art_Order(order_status, cust_Id, address, phoneNo) VALUES ('Paid',"+custId+",'"+addBox.Text.ToString()+ "','"+phoneBox.Text.ToString()+"') SELECT IDENT_CURRENT('Art_Order')";
            SqlCommand cmdSql = new SqlCommand(sqlInArtOrder, connDb);
            int recordIn = int.Parse(cmdSql.ExecuteScalar().ToString());
            if(recordIn>0)
            {
                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    string artIdValue="";
                    string qtyValue="";
                    Label lblText = Repeater1.Items[i].FindControl("qtyLbl") as Label;
                    HiddenField art_Id= Repeater1.Items[i].FindControl("art_ID") as HiddenField;
                    if (lblText.Text != "")
                    {
                        qtyValue = lblText.Text.ToString();
                    }
                    if(art_Id.Value != "")
                    {
                        artIdValue = art_Id.Value.ToString();
                    }
                    string sqlInOrderD = "INSERT INTO Order_Details(art_Order_Id, art_Id, order_Qty) VALUES (" + recordIn + "," + artIdValue +","+ qtyValue+")";
                    cmdSql = new SqlCommand(sqlInOrderD, connDb);
                    cmdSql.ExecuteNonQuery();
                    string sqlUpdateArtQty = "UPDATE Art SET available_Qty =(available_Qty -1) where art_Id=@art_Id";
                    cmdSql = new SqlCommand(sqlUpdateArtQty, connDb);
                    cmdSql.Parameters.AddWithValue("art_Id", artIdValue);
                    cmdSql.ExecuteNonQuery();
                }
                
            }
            connDb.Close();

            Response.Redirect("~/Customer_Logged/orderDetails.aspx?para="+recordIn);
        }
    }
}