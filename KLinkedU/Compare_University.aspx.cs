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
    public partial class Compare_University : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            if (!Page.IsPostBack)
            {
                table.Visible = false;
                SqlDataAdapter da = new SqlDataAdapter("Select * from University_Info", dbconnect);
                DataSet ds = new DataSet();
                da.Fill(ds);
                University_1.DataSource = ds;
                University_1.DataBind();
                University_1.DataTextField = "University_Name";
                University_1.DataValueField = "University_Name";
                University_1.DataBind();
                University_2.DataSource = ds;
                University_2.DataBind();
                University_2.DataTextField = "University_Name";
                University_2.DataValueField = "University_Name";
                University_2.DataBind();
            }
            else
                table.Visible = true;
        }

        protected void srch_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection dbconnect1 = new SqlConnection(connectionString);
            SqlConnection dbconnect2 = new SqlConnection(connectionString);

            dbconnect1.Open();
            dbconnect2.Open();
            //dbconnect1.ChangeDatabase("kpborol_Assign4B");
            //dbconnect2.ChangeDatabase("kpborol_Assign4B");

            string univ_1 = "Select * from University_Info where University_Name = @university1";
            string univ_2 = "Select * from University_Info where University_Name = @university2";

            SqlCommand univ_1_result = new SqlCommand(univ_1, dbconnect1);
            SqlCommand univ_2_result = new SqlCommand(univ_2, dbconnect2);
            univ_1_result.Parameters.AddWithValue("@university1", University_1.Text);
            univ_2_result.Parameters.AddWithValue("@university2", University_2.Text);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = univ_1_result;
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList2.DataSource = ds;
            DataList2.DataBind();

            SqlDataAdapter ada = new SqlDataAdapter();
            ada.SelectCommand = univ_2_result;
            DataSet ds2 = new DataSet();
            ada.Fill(ds2);
            DataList1.DataSource = ds2;
            DataList1.DataBind();
        }

        protected void back_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Search_University.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}