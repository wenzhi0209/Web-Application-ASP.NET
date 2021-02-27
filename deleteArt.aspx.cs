using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Template
{
    public partial class deleteArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblDeleteMsg.Text = "</br> [img from database] </b" + "Your art work has been successfully removed. </br> </br>";
        }
    }
}