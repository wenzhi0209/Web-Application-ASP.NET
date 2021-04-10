using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Template
{
    public partial class ChangePasswordaspx : System.Web.UI.Page
    {
        static string userName = "";
        static string userId = "";
        static string AutId = "";
        static string oldPassword = "";
        string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                userName = User.Identity.Name.ToString();
                SqlConnection connDb;
                
                connDb = new SqlConnection(strConn);

                connDb.Open();

                string getUserId = "SELECT [UserId] FROM [vw_aspnet_Users] WHERE ([UserName]= @UserName)";
                SqlCommand cmd = new SqlCommand(getUserId, connDb);
                cmd.Parameters.AddWithValue("@UserName", userName);
                userId = cmd.ExecuteScalar().ToString();


                string getAutId = "SELECT [author_Id] FROM [Author] WHERE ([UserId] = @UserId)";
                cmd = new SqlCommand(getAutId, connDb);
                cmd.Parameters.AddWithValue("@UserId", userId);
                AutId = cmd.ExecuteScalar().ToString();
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            SqlConnection connDb;

            connDb = new SqlConnection(strConn);
            string oldpassword = "Select [passsword] from [vw_aspnet_Users] where ([UserId]=@getAutId)";
            SqlCommand cmd = new SqlCommand(oldpassword, connDb);
            cmd.Parameters.AddWithValue("@password", oldpassword);
            oldPassword = cmd.ExecuteScalar().ToString();

            int check = oldPassword.CompareTo(Oldpass.Text);
            int check2 = NewPass.Text.CompareTo(TextBox3.Text);

            if (check == -1)
            {
                currPass.ErrorMessage = "invalid old password";
            }
            else 
            {
                if (NewPass.Text == "")
                {
                    reqNew.ErrorMessage = "new password required";
                }
                else 
                {
                    if (TextBox3.Text == "") 
                    {
                        cmp.ErrorMessage = "comfirm password is required";
                    }
                }
            }
            if (check2 == -1) 
            {
                reqSame.ErrorMessage = "password are not same";
            }

            string upd = "update  [vw_aspnet_Membership] set  [password] = NewPass.Text";
            cmd = new SqlCommand(upd, connDb);
            cmd.ExecuteNonQuery();

            connDb.Close();
        }
    }
}