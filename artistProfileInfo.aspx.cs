using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_Template
{
    public partial class artistProfileInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
        SqlConnection sqlcon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Assignment.mdf;Integrated Security=True");
        protected void updateBtn_Click(object sender, EventArgs e)
        {
           
            PPupload.SaveAs(Server.MapPath("~/ArtProduct/") + Path.GetFileName(PPupload.FileName));
            String link = "Img/" + Path.GetFileName(PPupload.FileName);

            //(change to data u want)   string ins = "Insert into [Author](art_Title, author_Id, art_Price, art_ReleaseDate, ImageId, Description) values('" + txtArtName.Text + "', '" + txtAuthorID.Text + "', '" + "', '" + txtPrice.Text + "', '"
            // + txtDate.Text + "', '" + link + "','" + txtDesc.Text + "')";
            // SqlCommand com = new SqlCommand(ins, sqlcon);
            sqlcon.Open();
           // com.ExecuteNonQuery();
            sqlcon.Close();
        }
    }
}