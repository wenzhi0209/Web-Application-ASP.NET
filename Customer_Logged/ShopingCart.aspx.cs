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
        static string userName="";
        static string userId = "";
        static string custId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //用!ispostback 只在第一次加载处理数据 然后放入static有很多种方法，你喜欢session用session也行
                //Get Customer ID can consider store at seesion
                //For easier understanding do it simple
                //开数据获取usedId, 因为user identity 获取不到id 所以拿名找id
                userName= User.Identity.Name.ToString();
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
                HDcustId.Value = custId;

            }

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                int id = int.Parse(e.CommandArgument.ToString().Split(',')[0]);
                int itemIndex = int.Parse(e.CommandArgument.ToString().Split(',')[1]);
                CheckBox staBox = Repeater1.Items[itemIndex].FindControl("selectCheckBox") as CheckBox;
                string status = staBox.Checked.ToString();
                SqlDataSource1.UpdateParameters["check_Sta"].DefaultValue = status;
                SqlDataSource1.UpdateParameters["cItem_Id"].DefaultValue =id.ToString();
                SqlDataSource1.Update();
            }

            if (e.CommandName == "delete")
            {
                int id = int.Parse(e.CommandArgument.ToString().Split(',')[0]);
                SqlDataSource1.DeleteParameters["cItem_Id"].DefaultValue = id.ToString();
                SqlDataSource1.Delete();
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            string cmdarg = "";
            CheckBox cbox = sender as CheckBox;
            if (cbox != null)
            {
                var item = (RepeaterItem)cbox.NamingContainer;
                if (item != null)
                {
                    Button Button = (Button)item.FindControl("Button1");
                    if (Button != null)
                    {
                        cmdarg = Button.CommandArgument.ToString();
                    }
                }
                RepeaterCommandEventArgs e1 = new RepeaterCommandEventArgs(((CheckBox)sender).NamingContainer as RepeaterItem, sender, new CommandEventArgs("update", cmdarg));
                Repeater1_ItemCommand(Repeater1, e1);
            }
        }

        protected void PlaceOBtn_Click(object sender, EventArgs e)
        {

        }

        /*
         * Real time quantity update to database
         * If want to use need to change the update sql command and paramenter
         * 
        protected void qtyBox_TextChanged(object sender, EventArgs e)
        {
            string cmdarg="";
            TextBox textBox = sender as TextBox;
            if (textBox != null)
            {
                var item = (RepeaterItem)textBox.NamingContainer;
                if (item != null)
                {
                    Button Button = (Button)item.FindControl("Button1");
                    if (Button != null)
                    {
                        cmdarg = Button.CommandArgument.ToString() ;
                    }
                }
            }
            RepeaterCommandEventArgs e1 = new RepeaterCommandEventArgs(((TextBox)sender).NamingContainer as RepeaterItem, sender, new CommandEventArgs("update", cmdarg));
            Repeater1_ItemCommand(Repeater1, e1);

        }
        */

    }
    }

