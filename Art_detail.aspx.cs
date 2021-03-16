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
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                DataSourceSelectArguments args = new DataSourceSelectArguments();
                DataView view = (DataView)SqlDataSource1.Select(args);
                if(view != null)
                {
                    DataTable dt = view.ToTable();
                    Image_Disp.ImageUrl = dt.Rows[0][2].ToString();
                    Image_Title.Text = dt.Rows[0][1].ToString();
                    Image_Desc.Text = dt.Rows[0][3].ToString();
                    Image_Price.Text = "RM " + dt.Rows[0][4].ToString();
                    int qty = int.Parse(dt.Rows[0][5].ToString());
                    if (qty > 0)
                        Qty_Available.Text = "Available Quantity :" + qty;
                    else
                    {
                        Qty_Available.Text = "Sorry this product currently not available";
                        Add_to_SC.Enabled = false;
                    }
                    AuthorName.Text = dt.Rows[0][6].ToString();
                }
                

                if (User.Identity.IsAuthenticated && Session["UserId"] == null)
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

        protected void Add_to_SC_Click(object sender, ImageClickEventArgs e)
        {
            if(User.Identity.IsAuthenticated)
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

                if (avaiQty > 0)
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
                        cmd.Parameters.AddWithValue("@custId", Session["CustId"]);
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
            cmd.Parameters.AddWithValue("@cust_Id", Session["CustId"]);

            if (cmd.ExecuteScalar() != null)
            {
                Response.Write("<script type=\"text/javascript\">alert(\"This art already in your Favorite Art\");</script>");
            }
            else
            {
                string inSql = "INSERT INTO Favo_Art(art_Id, cust_Id) VALUES (@id,@custId)";
                cmd = new SqlCommand(inSql, connDb);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@custId", Session["CustId"]);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert(\"This art added to your Favorite Art\");</script>");
            }
        }
    }
}