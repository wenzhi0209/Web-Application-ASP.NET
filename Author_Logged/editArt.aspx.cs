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
    public partial class editArt : System.Web.UI.Page
    {
        static string userName = "";
        static string userId = "";
        static string AutId = "";
        static string artTitle = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                userName = User.Identity.Name.ToString();
                SqlConnection connDb;
                string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
                connDb = new SqlConnection(strConn);

                connDb.Open();
                string getUserId = "SELECT [UserId] FROM [vw_aspnet_Users] WHERE ([UserName]= @UserName)";
                SqlCommand cmd = new SqlCommand(getUserId, connDb);
                cmd.Parameters.AddWithValue("@UserName", userName);
                userId = cmd.ExecuteScalar().ToString();

                string getCustId = "SELECT [author_Id] FROM [Author] WHERE ([UserId] = @UserId)";
                cmd = new SqlCommand(getCustId, connDb);
                cmd.Parameters.AddWithValue("@UserId", userId);
                AutId = cmd.ExecuteScalar().ToString();

                string getArtTile = "SELECT [art_Title] FROM [Art] WHERE ([author_Id] = @UserId)";
                cmd = new SqlCommand(getArtTile, connDb);
                cmd.Parameters.AddWithValue("@ArtTile", artTitle);
                //AutId = cmd.ExecuteScalar().ToString();

                connDb.Close();
            }
        }



    }
}
