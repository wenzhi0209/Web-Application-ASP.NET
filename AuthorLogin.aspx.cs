using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Template
{
    public partial class AuthorLogin : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Session["UserName"] = Login1.FindControl("UserName");
            Session["Pwd"] = Login1.FindControl("Password");
        }
    }
}