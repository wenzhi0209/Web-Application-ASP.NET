using System;
using System.Collections.Generic;
using System.Configuration;
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
        static string lName = "";
        static string Id = "";
        static string phoneNum = "";
        static string Addresss = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            lName = User.Identity.Name.ToString();
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);

            connDb.Open();

            //string getUserId = "SELECT [UserId] FROM [vw_aspnet_Users] WHERE ([UserName]= @UserName)";
            //SqlCommand cmd = new SqlCommand(getUserId, connDb);
            //cmd.Parameters.AddWithValue("@UserName", userName);
            //userId = cmd.ExecuteScalar().ToString();
            string uName = "Select [author_Name] From [Author] Where ([author_Name]= @lName)";
            SqlCommand cmd = new SqlCommand(uName, connDb);
            cmd.Parameters.AddWithValue("@lName", lName);
            Id = cmd.ExecuteScalar().ToString();
            pUser.Text = Id;
            pName.Text = Id;
            //string loggedUsername = Session["UserName"] as string;

            string Phone = "Select [author_PhoneNo] from [Author] Where ([author_Id]= 3)";
            cmd = new SqlCommand(Phone,connDb);
            cmd.Parameters.AddWithValue("@phonenum", phoneNum);
            phoneNum = cmd.ExecuteScalar().ToString();
            pPhone.Text = phoneNum;

            string Address = "Select [author_Address] from [Author] Where ([author_Id]= 3)";
            cmd = new SqlCommand(Address, connDb);
            cmd.Parameters.AddWithValue("@address", Address);
            Addresss = cmd.ExecuteScalar().ToString();
            pAddress.Text = Addresss;




        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Assignment.mdf;Integrated Security=True");
            PPupload.SaveAs(Server.MapPath("~/ProfilePicture/") + Path.GetFileName(PPupload.FileName));
            String link = "Img/" + Path.GetFileName(PPupload.FileName);

            string ins = "update into [Author](author_name,date_of_birth,type_of_art,phone,address,city,postal,state) values('" + pName.Text + "','" + pName.Text + "'," +
              "'" + pDOB.Text + "','" + pTOA.Text + "','" + pPhone.Text + "','" + pAddress.Text + "','" + pPostal.Text + "','" + ApState.Text + "',)";
            SqlCommand com = new SqlCommand(ins, sqlcon);
            sqlcon.Open();
            com.ExecuteNonQuery();
            sqlcon.Close();

        }

        protected void pUser_TextChanged(object sender, EventArgs e)
        {
 
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {

        }


    }
}