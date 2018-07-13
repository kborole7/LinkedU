using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace KLinkedU
{
    public partial class Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] != null)
            {
                if (Session["status"].ToString() == "R")
                {
                    MultiView1.ActiveViewIndex = 1;
                    string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                    SqlConnection dbconnect = new SqlConnection(connectionString);

                    dbconnect.Open();
                    //dbconnect.ChangeDatabase("kpborol_Assign4B");

                    SqlCommand cmd = new SqlCommand("Select * from University_Info where Userid = @user", dbconnect);
                    cmd.Parameters.AddWithValue("@user", Session["Userid"].ToString());

                    SqlDataAdapter Adp = new SqlDataAdapter();

                    Adp.SelectCommand = cmd;
                    DataTable Dt = new DataTable();
                    Adp.Fill(Dt);
                    DataList3.DataSource = Dt;
                    DataList3.DataBind();
                }
                else if  (Session["status"].ToString() == "S")
                { MultiView1.ActiveViewIndex = 0; }

                else if (Session["status"].ToString() == "A")
                { MultiView1.ActiveViewIndex = 2; }


            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Similar_Genre")
            {
                Response.Redirect("./SimilarVideos.aspx?Genre=" + e.CommandArgument.ToString());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mark_University.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reports.aspx");

        }

        protected void Report_Click(object sender, EventArgs e)
        {
            Response.Redirect("./University_Reported.aspx");
        }
    }
}