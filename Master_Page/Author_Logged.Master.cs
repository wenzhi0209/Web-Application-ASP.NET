using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Template.Master_Page
{
    public partial class Author_Logged : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}