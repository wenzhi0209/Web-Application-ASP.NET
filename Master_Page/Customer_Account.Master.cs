using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Template.Master_Page
{
    public partial class Customer_Profile : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Path;
            if(url.Equals("/Customer_Logged/CustomerProfile.aspx"))
            {
                CustProfileLink.CssClass="activeLink";
            }
            else if(url.Equals("/Customer_Logged/Customer_Order.aspx"))
            {
                CustOrderLink.CssClass ="activeLink";
            }
            else if (url.Equals("/Customer_Logged/Favo_Art.aspx"))
            {
                FavoArtLink.CssClass = "activeLink";
            }

        }

        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}