using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Template
{
    public partial class ChangePasswordaspx : System.Web.UI.Page
    {
        static string oldpass = "";
        static string newpass = "";
        static string lName = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            lName = User.Identity.Name.ToString();
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);

            connDb.Open();
            string oldpassword = "Select [apsnet_Membership.Password], [aspnet_Membership.UserId],[Author.UserID] from [Author],[aspnet_Membership] Where ([aspnet_Membership.UserId]=[Author.UserID])";
            SqlCommand cmd = new SqlCommand(oldpassword, connDb);
          //  cmd.Parameters.AddWithValue("@address", Address);
          //  Addresss = cmd.ExecuteScalar().ToString();
        }
    }
}