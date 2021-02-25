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
            if (e.CommandName == "update")
            {
                int id = int.Parse(e.CommandArgument.ToString().Split(',')[0]);
                int itemIndex = int.Parse(e.CommandArgument.ToString().Split(',')[1]);
                TextBox TextBox1 = Repeater1.Items[itemIndex].FindControl("TextBox1") as TextBox;
                int qty = int.Parse(TextBox1.Text.ToString());
                SqlDataSource1.UpdateParameters["qty"].DefaultValue=qty.ToString();
                SqlDataSource1.UpdateParameters["cItem_Id"].DefaultValue =id.ToString();
                SqlDataSource1.Update();
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
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
    }
    }

