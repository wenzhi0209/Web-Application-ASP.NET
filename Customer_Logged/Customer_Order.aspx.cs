using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace Assignment_Template.Customer_Logged
{
    public partial class Customer_Order : System.Web.UI.Page
    {
        static string userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                
                

            }

        }


    }
}