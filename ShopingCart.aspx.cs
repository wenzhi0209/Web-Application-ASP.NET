using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment_Template
{
    public partial class ShopingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connDb;
            string art_id;
            string qty;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
            connDb.Open();

            string strSelect = "Select * from Cart_Item";
            SqlCommand cmdSelect = new SqlCommand(strSelect, connDb);
            SqlDataReader cartList = cmdSelect.ExecuteReader();

            if (cartList.HasRows)
            {
                while (cartList.Read())
                {
                    art_id = cartList["art_Id"].ToString();
                    Label newBtn = new Label();
                    //指定控件属性
                    newBtn.ID = "btnConrol";
                    newBtn.Text = "我是动态生成的按钮" + art_id;
                    //在Asp.Net中，Asp控件需要放在有runat="server"标记的容器中
                    PlaceHoldertable.Controls.Add(newBtn);

                }
            }
            connDb.Close();




            //string strSelect = "Select * from Art where art_Id =@id";
            //SqlCommand cmdSelect = new SqlCommand(strSelect, connDb);
            //cmdSelect.Parameters.AddWithValue("@id", art_id);

        }
    }
}