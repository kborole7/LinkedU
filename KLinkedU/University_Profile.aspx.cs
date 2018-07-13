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
    public partial class University_Profile : System.Web.UI.Page
    {
        public static Double latt = 40.5122833;
        public static Double lngg = -88.9946701999999;
        public static string description;
        protected void Page_Load(object sender, EventArgs e)
        {

            
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            SqlCommand cmd = new SqlCommand("Select * from University_Info where University_Name = @University_Name", dbconnect);
            cmd.Parameters.AddWithValue("@University_Name", Request.QueryString["University_Name"]);

            SqlDataAdapter Adp = new SqlDataAdapter();

            Adp.SelectCommand = cmd;
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            DataList1.DataSource = Dt;
            DataList1.DataBind();
            SqlCommand cmd1 = new SqlCommand("Select * from map where Uname=@Uname;", dbconnect);
            cmd1.Parameters.AddWithValue("@Uname", Request.QueryString["University_Name"]);
            cmd1.ExecuteNonQuery();
            SqlDataReader list = cmd1.ExecuteReader();

            if (list.Read())
            {
                latt = Convert.ToDouble(list["Lattitude"]);
                lngg = Convert.ToDouble(list["Longitude"]);
                description = (list["Uname"]).ToString();

                list.Close();
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Apply_University.aspx");
        }

        protected void Contact_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Session["uni_name"] = btn.CommandArgument.ToString();
            //Response.Redirect("");

            string CheckMembershipStatus = "Select * from LinkedU_Account where Userid= @user;";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand(CheckMembershipStatus, connection);
            cmd.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();

            SqlDataReader list = cmd.ExecuteReader();

            if (list.Read())
            {
                if ((list["Membership"]).ToString() == "N")
                {
                    Response.Redirect("./Subscription.aspx");
                }
                else
                {
                    Response.Redirect("./RecruiterContact.aspx");
                }
            }
        }

        protected void appoint_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Session["uni_name"] = btn.CommandArgument.ToString();
            Response.Redirect("./Schedule_Appointment.aspx");
        }

        protected void report_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Session["uni_name"] = btn.CommandArgument.ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            SqlCommand cmd = new SqlCommand("Update University_Info set Reported = 'Y' where University_Name = @uni_name", connection);
            cmd.Parameters.AddWithValue("@uni_name", Session["uni_name"].ToString());
            cmd.ExecuteNonQuery();
            MsgBox("Thank for Reporting the posting.LinkedU team will take the necessary action");
        }

        private void MsgBox(string sMessage)
        {
            string msg = "<script language=\"javascript\">";
            msg += "alert('" + sMessage + "');";
            msg += "</script>";
            Response.Write(msg);
        }
    }
}