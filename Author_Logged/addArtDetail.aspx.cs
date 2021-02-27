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
    public partial class addArtDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cRealeaseDate_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = cRealeaseDate.SelectedDate.ToShortDateString();
        }

        protected void bSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtDatabase.mdf;Integrated Security=True");
            fuImg.SaveAs(Server.MapPath("~/ArtProduct/") + Path.GetFileName(fuImg.FileName));
            String link = "Img/" + Path.GetFileName(fuImg.FileName);

            string ins = "Insert into [Art](art_Title, author_Id, art_Price, art_ReleaseDate, ImageId, Description) values('" + txtArtName.Text + "', '" + txtAuthorID.Text + "', '" + "', '" + txtPrice.Text + "', '"
                            + txtDate.Text + "', '" + link + "','" + txtDesc.Text + "')";
            SqlCommand com = new SqlCommand(ins, sqlcon);
            sqlcon.Open();
            com.ExecuteNonQuery();
            sqlcon.Close();

        }


    }
}