using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;



namespace KLinkedU
{
    public partial class Search_University : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");


            if (!Page.IsPostBack)
            {

                SqlDataAdapter da = new SqlDataAdapter("Select distinct state from University_Info", dbconnect);
                DataSet ds = new DataSet();
                da.Fill(ds);
                state.DataSource = ds;
                state.DataBind();
                state.DataTextField = "State";
                state.DataValueField = "State";
                state.DataBind();
                state.Items.Add(new ListItem("ALL", "all"));
                state.SelectedValue = "all";

            }

        }

        public string uni_name { get { return university.Text; } }

        public string State { get { return state.Text; } }

        public string act { get { return (ACT.Text); } }

        public string sat { get { return SAT.Text; } }

        //public string ZipCode { get { return zipcode.Text; } }

        protected void srch_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            string university_filter;
            string state_filter;
            string sat_filter;
            string act_filter;



            if (university.Text != "")
                university_filter = "Intersect select * from University_Info where University_Name LIKE '%' + @uni_name + '%'";
            else
                university_filter = "";

            if (state.Text != "all")
                state_filter = "Intersect select * from University_Info where State = '" + State + "'";
            else
                state_filter = "";


            if (ACT.Text != "ANY")
            {
                string[] act_arr = act.Split('-');
                act_filter = "Intersect select * from University_Info where Minimum_ACT between '" + act_arr[0] + "' and '" + act_arr[1] + "'";
            }
            else
                act_filter = "";

            if (SAT.Text != "ANY")
            {
                string[] sat_arr = sat.Split('-');
                sat_filter = "Intersect select * from University_Info where Minimum_SAT between '" + sat_arr[0] + "' and '" + sat_arr[1] + "'";
            }
            else
                sat_filter = "";

            SqlCommand cmd = new SqlCommand("Select * from University_Info " + university_filter + " " + state_filter + " " + act_filter + " " + sat_filter, dbconnect);
            cmd.Parameters.AddWithValue("@uni_name", uni_name);
            SqlDataAdapter Adp = new SqlDataAdapter();
            Adp.SelectCommand = cmd;
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



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Uni_Info")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection dbconnect = new SqlConnection(connectionString);

                dbconnect.Open();
                //dbconnect.ChangeDatabase("kpborol_Assign4B");

                SqlCommand cmd = new SqlCommand("Update University_Info SET Most_Viewed = Most_Viewed + 1 where University_Name = @uni_name", dbconnect);
                cmd.Parameters.AddWithValue("@uni_name", e.CommandArgument.ToString());
                cmd.ExecuteNonQuery();

                Response.Redirect("./University_Profile.aspx?University_Name=" + e.CommandArgument.ToString());
            }
        }

        protected void compare_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Compare_University.aspx");
        }
    }
}
