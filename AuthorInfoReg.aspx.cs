using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace Assignment_Template
{
    public partial class InfoReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

            //这个是后台连接创建新customer data
            //以下是取回数据
            MembershipUser user = Membership.GetUser(CreateUserWizard1.UserName);
            Guid userId = (Guid)user.ProviderUserKey;

            //ADD TO ROLES
            Roles.AddUserToRole(user.UserName.ToString(), "normalUser");

            TextBox conPhoneNo = CreateUserWizardStep1.ContentTemplateContainer.FindControl("PhoneNo") as TextBox;
            TextBox conDOB = CreateUserWizardStep1.ContentTemplateContainer.FindControl("DOB") as TextBox;
            TextBox conAddress = CreateUserWizardStep1.ContentTemplateContainer.FindControl("Address") as TextBox;
            RadioButtonList conGender = CreateUserWizardStep1.ContentTemplateContainer.FindControl("Gender") as RadioButtonList;
            //here the userId can link with customer database to create the real cust data
            //need to add with other control to get the specific value
            //just modify on customer wizard.

            //here is the example
            //开连接
            SqlConnection connDb;
            string strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString + ";integrated security = true; MultipleActiveResultSets = true";
            connDb = new SqlConnection(strConn);
            connDb.Open();

            //insert command 这边作演示所以只放重要数据，过后你要更改
            string insertNewCustomer = "INSERT INTO Author (author_Name, author_PhoneNo, author_Address, author_Gender, UserId, Dob) VALUES(@name,@PhoneNo,@Address,@Gender,@userId, @Dob)";
            SqlCommand cmd = new SqlCommand(insertNewCustomer, connDb);
            //传值
            cmd.Parameters.AddWithValue("@userId", userId.ToString());
            cmd.Parameters.AddWithValue("@PhoneNo", conPhoneNo.Text.ToString());
            cmd.Parameters.AddWithValue("@Address", conAddress.Text.ToString());
            cmd.Parameters.AddWithValue("@Gender", conGender.Text.ToString());
            cmd.Parameters.AddWithValue("@name", user.UserName.ToString());
            cmd.Parameters.AddWithValue("@Dob", conDOB.Text.ToString());
            //can add address or something else
            //执行
            cmd.ExecuteNonQuery();
            connDb.Close();
        }
    }
}