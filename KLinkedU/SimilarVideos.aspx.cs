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
    public partial class SimilarVideos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);
            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            SqlCommand cmd = new SqlCommand("select * from Student_Media where Genre=@genre;", dbconnect);
            cmd.Parameters.AddWithValue("@genre", Request.QueryString["Genre"]);

            SqlDataAdapter Adp = new SqlDataAdapter();

            Adp.SelectCommand = cmd;
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            DataList3.DataSource = Dt;
            DataList3.DataBind();


            cmd.ExecuteNonQuery();
            SqlDataReader genreRdr = cmd.ExecuteReader();
            string g1 = "";
            while (genreRdr.Read())
            {
                g1 = Request.QueryString["Genre"].ToString();
            }
            genreRdr.Close();
            DataTable dt2 = new DataTable();

            //string strQuery = "select * from Student_Media";
            string strQuery = "select * from Student_Media where Genre like '%" + g1 + "%'";
            SqlCommand cmd2 = new SqlCommand(strQuery, dbconnect);



            SqlDataAdapter sda1 = new SqlDataAdapter();
            cmd2.CommandType = CommandType.Text;
            cmd2.Connection = dbconnect;
            cmd2.ExecuteNonQuery();
            sda1.SelectCommand = cmd2;
            sda1.Fill(dt2);
            DataList3.DataSource = dt2;
            DataList3.DataBind();
            dbconnect.Close();

        }

        protected void datalist_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl = (Label)e.Item.FindControl("lbl");
                int count = ((DataList3.DataSource) as DataTable).Rows.Count;
                lbl.Text = "Showing " + count + " results";
            }

        }
        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Student_Info")
            {
                Response.Redirect("./Student_Profile.aspx?Userid=" + e.CommandArgument.ToString());
            }
        }
    }
}