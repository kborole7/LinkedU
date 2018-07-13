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
    public partial class Student_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);
            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            SqlCommand cmd = new SqlCommand("Select * from KUserinfo where Userid = @Userid", dbconnect);
            cmd.Parameters.AddWithValue("@Userid", Request.QueryString["Userid"]);

            SqlDataAdapter Adp = new SqlDataAdapter();

            Adp.SelectCommand = cmd;
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            DataList1.DataSource = Dt;
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Contact_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            //Session["stud_id"] = btn.CommandArgument.ToString();
            //Response.Redirect("./RecruiterContact.aspx");

            string CheckSubscriptionStatus = "Select * from LinkedU_Account where Userid= @user;";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand(CheckSubscriptionStatus, connection);
            cmd.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();

            SqlDataReader list = cmd.ExecuteReader();

            if (list.Read())
            {
                if ((list["Membership"]).ToString() == "N")
                {
                    Response.Redirect("./Subscription.aspx" );
                }
                else {
                    Response.Redirect("./StudentContact.aspx");
                }
            }

            
            //Response.Write("Please subscribe to premium account for contact information of student");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Homepage.aspx");

        }
        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Similar_Genre")
            {
                Response.Redirect("./SimilarVideos.aspx?Genre=" + e.CommandArgument.ToString());
            }
        }
        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}