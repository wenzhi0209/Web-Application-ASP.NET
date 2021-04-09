using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;


namespace Assignment_Template
{
    public partial class welMsg : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime time = DateTime.Now;
            int hour = time.Hour;
            if(hour<3)
            {
                firstMsg.Text = "Hi, " + Session["Username"];
            }
            else if(hour < 12)
            {
                firstMsg.Text = "Hi, Good Morning " + Session["Username"];
            }
            else if (hour < 17)
            {
                firstMsg.Text = "Hi, Good Afternoon " + Session["Username"];
            }
            else if (hour < 19)
            {
                firstMsg.Text = "Hi, Good Evening " + Session["Username"];
            }
            else if (hour < 24)
            {
                firstMsg.Text = "Hi, Good Night " + Session["Username"];
            }

            string path= Server.MapPath(@"/Control/quotes.txt");
            StreamReader sr = File.OpenText(path);
            int lineCount = File.ReadAllLines(path).Length;
            string[] quotes = new string[lineCount];

            for (int i = 0; i<lineCount; i++)
            {
                quotes[i] = sr.ReadLine();
            }

            sr.Close();

            Random rand = new System.Random();
            int randIndex = rand.Next(0, lineCount);

            //Place the "Randomly" selected quote inside the text box
            //"quoteLabel"
            SecMsg.Text = quotes[randIndex];
        }

        
    }
}