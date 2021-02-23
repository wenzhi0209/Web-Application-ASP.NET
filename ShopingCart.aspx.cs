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
            
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "update")//如果点击的是被标记为CommandName="update"的按钮，也就是修改按钮
            {
                int id = int.Parse(e.CommandArgument.ToString().Split(',')[0]);//这里还真必须用单引号来表示字符，而不是""的字符串~，C#的Split就一个以字符，而不是字符串参数的代码
                int itemIndex = int.Parse(e.CommandArgument.ToString().Split(',')[1]);//藏在CommandArgument='<%#Eval("id")+","+(Container as RepeaterItem).ItemIndex%>'逗号后面的参数就是该行行号
                TextBox TextBox1 = Repeater1.Items[itemIndex].FindControl("TextBox1") as TextBox;//获得改行的TextBox1
                Label2.Text = TextBox1.Text.ToString();
                SqlDataSource1.UpdateParameters["qty"].DefaultValue="2";
                SqlDataSource1.UpdateParameters["cItem_Id"].DefaultValue =id.ToString();
                SqlDataSource1.Update();
            }
        }
    }
    }


/*
 
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
 */

/*
     
 */   