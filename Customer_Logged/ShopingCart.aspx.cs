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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["UserId"] == null)
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

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                int id = int.Parse(e.CommandArgument.ToString().Split(',')[0]);
                int itemIndex = int.Parse(e.CommandArgument.ToString().Split(',')[1]);
                CheckBox staBox = Repeater1.Items[itemIndex].FindControl("selectCheckBox") as CheckBox;
                TextBox art_Quantity= Repeater1.Items[itemIndex].FindControl("art_Quantity") as TextBox;
                string status = staBox.Checked.ToString();
                SqlDataSource1.UpdateParameters["check_Sta"].DefaultValue = status;
                SqlDataSource1.UpdateParameters["cItem_Id"].DefaultValue =id.ToString();
                SqlDataSource1.UpdateParameters["qty"].DefaultValue = art_Quantity.Text;
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
                    Button Button = (Button)item.FindControl("removeBtn");
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
            bool checkArt=false;
           
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                CheckBox selectCheckBox = Repeater1.Items[i].FindControl("selectCheckBox") as CheckBox;
                if (selectCheckBox.Checked==true)
                {
                    checkArt = true;
                }
            }
            if(checkArt==true)
            {
                Response.Redirect("~/Customer_Logged/Checkout.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label art_Title = e.Item.FindControl("art_Title") as Label;
                HiddenField HDavailable = e.Item.FindControl("HDavailable") as HiddenField;
                CheckBox selectCheckBox= e.Item.FindControl("selectCheckBox") as CheckBox;
                HiddenField cart_Id = e.Item.FindControl("cart_Id") as HiddenField;

                if (int.Parse(HDavailable.Value)<1)
                {
                    art_Title.Text = art_Title.Text.ToString() + "</br><p style=\"color: red; font-size:10px \">Sorry This Art Not Available Now</p>";
                    selectCheckBox.Checked = false;
                    selectCheckBox.Visible = false;

                    SqlDataSource1.UpdateParameters["check_Sta"].DefaultValue = "false";
                    SqlDataSource1.UpdateParameters["cItem_Id"].DefaultValue = cart_Id.Value.ToString();
                    SqlDataSource1.Update();
                }

            }
        }

        protected void art_Quantity_TextChanged(object sender, EventArgs e)
        {
            string cmdarg = "";
            TextBox textBox = sender as TextBox;
            if (textBox != null)
            {
                var item = (RepeaterItem)textBox.NamingContainer;
                if (item != null)
                {
                    Button Button = (Button)item.FindControl("removeBtn");
                    if (Button != null)
                    {
                        cmdarg = Button.CommandArgument.ToString();
                    }
                }
            }
            RepeaterCommandEventArgs e1 = new RepeaterCommandEventArgs(((TextBox)sender).NamingContainer as RepeaterItem, sender, new CommandEventArgs("update", cmdarg));
            Repeater1_ItemCommand(Repeater1, e1);
        }

       

    }
    }

