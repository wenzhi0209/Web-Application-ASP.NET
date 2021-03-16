using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment_Template
{
    public partial class orderDetails : System.Web.UI.Page
    {
        static double totalprice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
            double subprice = 0;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label subTotalLabel = e.Item.FindControl("subTotalLabel") as Label;
                if (subTotalLabel.Text != "")
                {
                    subprice = double.Parse(subTotalLabel.Text.ToString());
                }
                totalprice = totalprice + subprice;
            }

            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label totalAmtLbl = e.Item.FindControl("totalAmtLbl") as Label;
                totalAmtLbl.Text = "Total amount need to paid : RM " + totalprice;
            }
        }
    }
}