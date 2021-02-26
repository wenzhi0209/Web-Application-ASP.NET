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
            }

        }

        protected void Add_to_SC_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
            connDb.Open();

            string id = Request.QueryString["para"].ToString();
            string sql = "select art_id from Cart_Item where art_id=@id";
            SqlCommand cmd = new SqlCommand(sql, connDb);
            cmd.Parameters.AddWithValue("@id", id);
            if(cmd.ExecuteScalar()!=null)
            {
                Response.Write("<script type=\"text/javascript\">alert(\"This art already in your shoping cart\");</script>");
            }
            else
            {
                string inSql = "INSERT INTO Cart_Item(art_Id, qty) VALUES (@id,1)";
                SqlCommand cmdIN = new SqlCommand(inSql, connDb);
                cmdIN.Parameters.AddWithValue("@id", id);
                cmdIN.ExecuteNonQuery();
            }

            connDb.Close();
        }
    }
}