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

