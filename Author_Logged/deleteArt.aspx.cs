using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace Assignment_Template
{
    public partial class deleteArt : System.Web.UI.Page
    {
        static string userName = "";
        static string userId = "";
        static string AutId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //用!ispostback 只在第一次加载处理数据 然后放入static有很多种方法，你喜欢session用session也行
                //Get Customer ID can consider store at seesion
                //For easier understanding do it simple
                //开数据获取usedId, 因为user identity 获取不到id 所以拿名找id
                userName = User.Identity.Name.ToString();
                SqlConnection connDb;
                string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
                connDb = new SqlConnection(strConn);

                connDb.Open();
                //找到user id就可以找custid 
                string getUserId = "SELECT [UserId] FROM [vw_aspnet_Users] WHERE ([UserName]= @UserName)";
                SqlCommand cmd = new SqlCommand(getUserId, connDb);
                cmd.Parameters.AddWithValue("@UserName", userName);
                userId = cmd.ExecuteScalar().ToString();

                //储存cust id 在hidden field 懒惰改就用一样的方法 过后会用到，这个也有很多方法可以实现
                string getCustId = "SELECT [author_Id] FROM [Author] WHERE ([UserId] = @UserId)";
                cmd = new SqlCommand(getCustId, connDb);
                cmd.Parameters.AddWithValue("@UserId", userId);
                AutId = cmd.ExecuteScalar().ToString();

                connDb.Close();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);

            connDb.Open();




            lblDeleteMsg.Text = "</br> [img from database] </br> Your art work has been successfully removed. </br> </br>";

        }
    }
}