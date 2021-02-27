using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment_Template
{
    public partial class CustomerRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Submit_Click(object sender, EventArgs e)
        {

        }

        protected void Password_TextChanged(object sender, EventArgs e)
        {
            Console.Write("*");
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(CreateUserWizard1.UserName);
            Guid userId = (Guid)user.ProviderUserKey;
            Label1.Text = userId.ToString();
            Label2.Text = user.UserName.ToString();
            //here the userId can link with customer database to create the real cust data
            //need to add with other control to get the specific value
            //just modify on customer wizard.

            //here is the example
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
            connDb.Open();

            string insertNewCustomer = "INSERT INTO Customer (cust_Name, UserId) VALUES(@name,@userId)";
            SqlCommand cmd = new SqlCommand(insertNewCustomer, connDb);
            cmd.Parameters.AddWithValue("@userId", userId.ToString());
            cmd.Parameters.AddWithValue("@name", user.UserName.ToString());
            //can add address or something else
            cmd.ExecuteNonQuery();
            connDb.Close();
        }
    }
}