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
    
    public partial class CustomerProfile : System.Web.UI.Page
    {
        static string cname = "";
        static string addresss = "";
        static string phone = "";
        static string email = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            cname = User.Identity.Name.ToString();
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
            connDb.Open();

            string cName = "Select [cust_Name] From [Customer] Where ([cust_ID]= 1)";
            SqlCommand cmd = new SqlCommand(cName, connDb);
            cmd.Parameters.AddWithValue("@cname", cname);
            cname = cmd.ExecuteScalar().ToString();
            UserNameBox.Text = cname;

            string phone = "Select [cust_PhoneNo] From [Customer] Where ([cust_ID]= 1)";
            cmd = new SqlCommand(phone, connDb);
            cmd.Parameters.AddWithValue("@phone", phone);
            phone = cmd.ExecuteScalar().ToString();
            PhoneNoBox.Text = phone;

            string address = "Select [cust_Address] From [Customer] Where ([cust_ID]= 1)";
            cmd = new SqlCommand(address, connDb);
            cmd.Parameters.AddWithValue("@address", address);
            addresss = cmd.ExecuteScalar().ToString();
            AddressBox.Text = addresss;
        }
    }
}