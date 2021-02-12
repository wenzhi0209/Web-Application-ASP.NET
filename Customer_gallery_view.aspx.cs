using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;


namespace Assignment_Template
{
    public partial class Customer_gallery_view : System.Web.UI.Page
    {
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            //Create sql connection
            SqlConnection connDb;
            string imgPath;
            string artTitle;
            string price;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            connDb = new SqlConnection(strConn);
            connDb.Open();

            string strSelect = "Select * from Art";
            SqlCommand cmdSelect = new SqlCommand(strSelect,connDb);
            SqlDataReader artList = cmdSelect.ExecuteReader();

            if(artList.HasRows)
            {
                while(artList.Read())
                {
                    imgPath = artList["art_Img"].ToString();
                    artTitle= artList["art_Title"].ToString();
                    price= artList["art_Price"].ToString();
                    generateContainer(imgPath,artTitle,price);
                }
            }
           
        }



        protected void generateContainer(string imgPath, string artTitle, string price)
        {
            string testdiv =
               "<img src=\""+imgPath+"\"/>" +
               "<div class=\"buttonCon\">" +
               "<div class=\"ctrlBtn\"><img src = \"Img/Icon/favorite_border-24px.svg\"/></div >" +
               "<div class=\"ctrlBtn\"><img src = \"Img/Icon/add_shopping_cart-24px.svg\" /></div >" +
               "</div>" +
               "<p class=\"artTitle\">" + artTitle + "</p>" +
               "<p class=\"artist\">Unknown</p>" +
               "<p class=\"price\">RM 18</p>";

            HtmlGenericControl newdiv = new HtmlGenericControl("div");
            newdiv.Attributes.Add("Class", "artBox");
            newdiv.InnerHtml = testdiv;
            PlaceHolder1.Controls.Add(newdiv);
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
           
        }

    }
}