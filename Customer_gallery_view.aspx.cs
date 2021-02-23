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
        int page_size = 2;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);

            int RecordCount = countRec("Art",connDb); 
            int PageCount = 0;   
            int CurrentPage = 1;
            PageCount = RecordCount / page_size; 
            if (RecordCount % page_size > 0)
            {
                PageCount = PageCount + 1;    
            }

            getData(connDb);

        }


        protected void getData(SqlConnection connDb)
        {
            //where (art_Id not in select top 0 art_Id from Art ORDER BY art_Id) ORDER BY art_Id
            //Create sql connection
           
            string id;
            string imgPath;
            string artTitle;
            string price;
            connDb.Open();

            string strSelect = "Select TOP " +page_size+ " * from Art" +
                " where art_Id not in (select top 0 art_Id from Art ORDER BY art_Id)" +
                " ORDER BY art_Id";
            SqlCommand cmdSelect = new SqlCommand(strSelect, connDb);
            SqlDataReader artList = cmdSelect.ExecuteReader();

            if (artList.HasRows)
            {
                while (artList.Read())
                {
                    string strAutName = "Select author_Name from Author where author_Id =@id";
                    SqlCommand cmdSelect2 = new SqlCommand(strAutName, connDb);
                    cmdSelect2.Parameters.AddWithValue("@id", artList["author_Id"]);
                    string authorName = (string)cmdSelect2.ExecuteScalar();

                    id = artList["art_Id"].ToString();
                    imgPath = artList["art_Img"].ToString();
                    artTitle = artList["art_Title"].ToString();
                    price = artList["art_Price"].ToString();
                    generateContainer(id, imgPath, artTitle, price, authorName);
                }
            }
            connDb.Close();
        }

        protected void generateContainer(string id,string imgPath, string artTitle, string price,string author)
        {
            string testdiv =
               "<a href=\"Art_detail.aspx?para="+ id +"\">" +
               "<img src=\"" +imgPath+ "\"/></a>" +
               "<div class=\"buttonCon\">" +
               "<div class=\"ctrlBtn\"><img src = \"Img/Icon/favorite_border-24px.svg\"/></div>" +
               "<div class=\"ctrlBtn\"><img src = \"Img/Icon/add_shopping_cart-24px.svg\" /></div>" +
               "</div>" +
               "<p class=\"artTitle\">" + artTitle + "</p>" +
               "<p class=\"artist\">" + author + "</p>" +
               "<p class=\"price\">RM 18</p>";

            HtmlGenericControl newdiv = new HtmlGenericControl("div");
            newdiv.Attributes.Add("Class", "artBox");
            newdiv.InnerHtml = testdiv;
            PlaceHolder1.Controls.Add(newdiv);
        }

        protected int countRec(string table,SqlConnection connDb)
        {
            connDb.Open();

            int intCount = 0;
            string sql = "select count(*) from " + table;
            SqlCommand cmd = new SqlCommand(sql, connDb);
            SqlDataReader countRead = cmd.ExecuteReader();
            if (countRead.Read())
            {
                intCount = Int32.Parse(countRead[0].ToString());
            }
            connDb.Close();
            return intCount;
        }
    }
}