using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Template
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

           
        }

        protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            totalLbl.Text = Repeater1.Items.Count.ToString();
            double totalprice = 0;
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                Label lblText = Repeater1.Items[i].FindControl("subTotalLabel") as Label;
                totalprice = totalprice + double.Parse(lblText.Text.ToString());
            }
            totalLbl.Text = totalprice.ToString();
        }
    }
}