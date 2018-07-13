using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KLinkedU
{
    public partial class University_Reported : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection dbconnect = new SqlConnection(connectionString);

                dbconnect.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select University_Name,Reported,Userid from University_Info where Reported = 'Y'", dbconnect);
                DataTable ds = new DataTable();
                da.Fill(ds);
                if (ds.Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                else
                {
                    lblText.Text = "No Universities are reported";
                    GridView1.Visible = false;
                }


                //DataList1.DataSource = ds;
                //DataList1.DataBind();
            }
        }




        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();
            if (e.CommandName.CompareTo("delete_record") == 0)
            {
                string[] arg = new string[2];
                arg = e.CommandArgument.ToString().Split(';');
                

                SqlCommand cmd = new SqlCommand("Delete from University_Info where University_Name = '" + arg[0] + "'", dbconnect);
                cmd.ExecuteNonQuery();

                SqlCommand cmd1 = new SqlCommand("Delete from RLogin where Userid = '" + arg[1] + "'", dbconnect);
                cmd1.ExecuteNonQuery();

                lblText.Text = "<b>" + e.CommandArgument.ToString() + "</b> Deleted from the database";


            }

            if (e.CommandName == "unreport")
            {

                SqlCommand cmd = new SqlCommand("Update University_Info set Reported = 'N' where University_Name = '" + e.CommandArgument.ToString() + "'", dbconnect);
                cmd.ExecuteNonQuery();
                lblText.Text = "<b>" + e.CommandArgument.ToString() + "</b> Removed from report list";
            }


            SqlDataAdapter da = new SqlDataAdapter("Select University_Name,Reported,Userid from University_Info where Reported = 'Y'", dbconnect);
            DataTable ds = new DataTable();
            da.Fill(ds);
            if (ds.Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                lblText.Text = "No Universities are reported";
                GridView1.Visible = false;
            }



        }
    }
}