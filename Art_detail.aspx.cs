using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Assignment_Template
{
    public partial class Art_detail : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView view = (DataView)SqlDataSource1.Select(args);
            DataTable dt = view.ToTable();

            Image_Disp.ImageUrl = dt.Rows[0][2].ToString();
            Image_Title.Text = dt.Rows[0][1].ToString();
            Image_Desc.Text= dt.Rows[0][3].ToString();
            Image_Price.Text= dt.Rows[0][4].ToString();
        }

       


        
    }
}