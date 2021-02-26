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
        protected void Page_Load(object sender, EventArgs e)
        {
            

           
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

            string sqlInArtOrder = "INSERT INTO Art_Order(order_status, cust_Id) VALUES ('Paid',1) SELECT IDENT_CURRENT('Art_Order')";
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
                }
                
            }
            connDb.Close();
        }
    }
}