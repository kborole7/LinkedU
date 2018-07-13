using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace KLinkedU
{
    public partial class Mark_University : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection dbconnect = new SqlConnection(connectionString);

                dbconnect.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select University_Name,Featured from University_Info", dbconnect);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                //DataList1.DataSource = ds;
                //DataList1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int ListID = 0;
            lblText.Text = "";
            string universities = "";

            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();

            foreach (GridViewRow row in GridView1.Rows)
            {

                CheckBox cb = (row.Cells[0].FindControl("uni") as CheckBox);
                if (cb.Checked && cb != null)
                {
                    ListID = ListID + 1;

                    for (int i = ListID - 1; i < ListID; i++)
                    {

                        SqlCommand cmd = new SqlCommand("update University_Info set Featured = 'Y' where University_Name = '" + row.Cells[1].Text + "'", dbconnect);
                        cmd.ExecuteNonQuery();
                        universities += '"' + row.Cells[1].Text + '"' + ",";

                    }
                }
            }

            lblText.Text = "<br/>Marked<b> " + universities + "</b> as Featured ";

            SqlDataAdapter da = new SqlDataAdapter("Select University_Name,Featured from University_Info", dbconnect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int ListID = 0;
            lblText.Text = "";
            string universities = "";

            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();

            foreach (GridViewRow row in GridView1.Rows)
            {

                CheckBox cb = (row.Cells[0].FindControl("uni") as CheckBox);
                if (cb.Checked && cb != null)
                {
                    ListID = ListID + 1;

                    for (int i = ListID - 1; i < ListID; i++)
                    {

                        SqlCommand cmd = new SqlCommand("update University_Info set Featured = 'N' where University_Name = '" + row.Cells[1].Text + "'", dbconnect);
                        cmd.ExecuteNonQuery();
                        universities += '"' + row.Cells[1].Text + '"' + ",";

                    }
                }
            }

            lblText.Text = "<br/>Removed<b> " + universities + "</b> from Featured list";

            SqlDataAdapter da = new SqlDataAdapter("Select University_Name,Featured from University_Info", dbconnect);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}