using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment_Template
{
    public partial class Art_detail : System.Web.UI.Page
    {
        static string userName = "";
        static string userId = "";
        static string custId = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                DataSourceSelectArguments args = new DataSourceSelectArguments();
                DataView view = (DataView)SqlDataSource1.Select(args);
                DataTable dt = view.ToTable();

                Image_Disp.ImageUrl = dt.Rows[0][2].ToString();
                Image_Title.Text = dt.Rows[0][1].ToString();
                Image_Desc.Text = dt.Rows[0][3].ToString();
                Image_Price.Text = "RM " + dt.Rows[0][4].ToString();

                userName = User.Identity.Name.ToString();
                SqlConnection connDb;
                string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
                connDb = new SqlConnection(strConn);

                connDb.Open();
                //找到user id就可以找custid 
                string getUserId = "SELECT [UserId] FROM [vw_aspnet_Users] WHERE ([UserName] = @UserName)";
                SqlCommand cmd = new SqlCommand(getUserId, connDb);
                cmd.Parameters.AddWithValue("@UserName", userName);
                userId = cmd.ExecuteScalar().ToString();

                //储存cust id 在hidden field 懒惰改就用一样的方法 过后会用到，这个也有很多方法可以实现
                string getCustId = "SELECT [cust_Id] FROM [Customer] WHERE ([UserId] = @UserId)";
                cmd = new SqlCommand(getCustId, connDb);
                cmd.Parameters.AddWithValue("@UserId", userId);
                custId = cmd.ExecuteScalar().ToString();

                connDb.Close();
               
            }

        }

        protected void Add_to_SC_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
            connDb.Open();
            string id = Request.QueryString["para"].ToString();

            string checkAvailability = "SELECT [available_Qty] FROM [Art] where art_id=@id";
            SqlCommand cmd = new SqlCommand(checkAvailability, connDb);
            cmd.Parameters.AddWithValue("@id", id);
            int avaiQty = int.Parse(cmd.ExecuteScalar().ToString());

            if(avaiQty>0)
            {
                string checkCart = "select art_id from Cart_Item where art_id=@id";
                cmd = new SqlCommand(checkCart, connDb);
                cmd.Parameters.AddWithValue("@id", id);
                if (cmd.ExecuteScalar() != null)
                {
                    Response.Write("<script type=\"text/javascript\">alert(\"This art already in your shoping cart\");</script>");
                }
                else
                {
                    string inSql = "INSERT INTO Cart_Item(art_Id, qty, cust_Id) VALUES (@id,1,@custId)";
                    cmd = new SqlCommand(inSql, connDb);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@custId", custId);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert(\"This art added to your shoping cart\");</script>");
                }
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert(\"This art no longer available\");</script>");
            }
            

            connDb.Close();
        }

        protected void Add_to_FL_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
            connDb.Open();
            string id = Request.QueryString["para"].ToString();

            string checkFavo = "select art_id from Favo_Art where art_id=@id AND cust_Id=@cust_Id";
            SqlCommand cmd = new SqlCommand(checkFavo, connDb);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@cust_Id", custId);

            if (cmd.ExecuteScalar() != null)
            {
                Response.Write("<script type=\"text/javascript\">alert(\"This art already in your Favorite Art\");</script>");
            }
            else
            {
                string inSql = "INSERT INTO Favo_Art(art_Id, cust_Id) VALUES (@id,@custId)";
                cmd = new SqlCommand(inSql, connDb);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@custId", custId);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert(\"This art added to your Favorite Art\");</script>");
            }
        }
    }
}