using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Assignment_Template
{
    public partial class Customer_gallery_view : System.Web.UI.Page
    {
        int page = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        

        public DataTable GetData()
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView view = (DataView)SqlDataSource1.Select(args);
            DataTable dt = view.ToTable();
            return dt;
        }

        public DataTable GetPagedTable(int PageIndex, int PageSize)
        {

            DataTable dt = GetData();//get data from database
            if (PageIndex == 0)
            {
                return dt;
            }
            DataTable NewDt = dt.Copy();
            NewDt.Clear();
            //start rpw
            int rowbegin = (PageIndex - 1) * PageSize;
            //end row
            int rowend = PageIndex * PageSize;
            if (rowbegin >= dt.Rows.Count)
            {
                return NewDt;
            }

            if (rowend > dt.Rows.Count)
            {
                rowend = dt.Rows.Count;
            }
            //generate new DataTable
            for (int i = rowbegin; i <= rowend - 1; i++)
            {
                DataRow newdr = NewDt.NewRow();
                DataRow dr = dt.Rows[i];
                foreach (DataColumn column in dt.Columns)
                {
                    newdr[column.ColumnName] = dr[column.ColumnName];
                }
                NewDt.Rows.Add(newdr);
            }
            return NewDt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable New_dt = GetPagedTable(page, 2);
            Label1.Text = New_dt.Rows[0][1].ToString();
            Label2.Text = New_dt.Rows[1][1].ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            page++;
            DataTable New_dt = GetPagedTable(page, 2);
            Label1.Text = New_dt.Rows[0][1].ToString();
            Label2.Text = New_dt.Rows[1][1].ToString();
        }
    }
}