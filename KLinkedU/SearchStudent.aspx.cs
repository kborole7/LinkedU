using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace KLinkedU
{
    public partial class SearchStudent : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }


        protected void srch_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection dbconnect = new SqlConnection(connectionString);
            dbconnect.Open();

            string name_filter;
            string skills_filter;
            string ACTScore_filter;
            string SATScore_filter;

            if (student.Text != "")
            {
                name_filter = "Intersect select * from KUserinfo where (Fname like '%'+@student+'%') or (Lname like '%'+@student+'%')";
            }
            else
                name_filter = "";

            if (skills.Text != "")
            {
                skills_filter = "Intersect select * from KUserinfo where SKILLS LIKE '%'+@skills+'%'";
            }

            else
                skills_filter = "";

            if (ACTScore.Text != "")
            {
                ACTScore_filter = "Intersect select * from KUserinfo where ACT_Score >= @ACTScore";
            }
            else
                ACTScore_filter = "";

            if (SATScore.Text != "")
            {
                SATScore_filter = "Intersect select * from KUserinfo where SAT_Score >= @SATScore";
            }
            else
                SATScore_filter = "";



            SqlCommand allsearch = new SqlCommand("select * from KUserinfo " + name_filter + " " + skills_filter + " " + ACTScore_filter + " " + SATScore_filter, dbconnect);

            allsearch.Parameters.AddWithValue("@student", student.Text);
            allsearch.Parameters.AddWithValue("@skills", skills.Text);
            allsearch.Parameters.AddWithValue("@ACTScore", ACTScore.Text);
            allsearch.Parameters.AddWithValue("@SATScore", SATScore.Text);
            SqlDataAdapter Adp = new SqlDataAdapter();
            Adp.SelectCommand = allsearch;
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            DataList1.DataSource = Dt;
            DataList1.DataBind();

            dbconnect.Close();

        }

        protected void datalist_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl = (Label)e.Item.FindControl("lbl");
                int count = ((DataList1.DataSource) as DataTable).Rows.Count;
                lbl.Text = "Showing " + count + " results";
            }

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();
            //connect.ChangeDatabase("kpborol_Assign4B");

            string profile_visits = "INSERT into visitors (vuserid,puserid)" + "values(@vuid, @puid)";
            SqlCommand insert = new SqlCommand(profile_visits, connect);
            insert.Parameters.AddWithValue("@vuid", Session["Userid"].ToString());
            insert.Parameters.AddWithValue("@puid", e.CommandArgument.ToString());
            insert.ExecuteNonQuery();

            if (e.CommandName == "Student_Info")
            {
                Session["stud_id"] = e.CommandArgument.ToString();
                Response.Redirect("./Student_Profile.aspx?Userid=" + e.CommandArgument.ToString());
            }
        }


    }
}
