using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


namespace KLinkedU
{
    public partial class Membership : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                { MultiView1.ActiveViewIndex = 1; }
                else { }
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string ChangeMembershipStatus = "Update LinkedU_Account set Membership='N' where Userid= @user;";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand(ChangeMembershipStatus, connection);
            cmd.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();
            Label4.Text = "You have Successfully Unsubscribed.";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string ChangeMembershipStatus = "Update LinkedU_Account set Membership='Y' where Userid= @user;";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand(ChangeMembershipStatus, connection);
            cmd.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();
            Label3.Text = "Congratulations! You have Successfully Subscribed to Premium Membership.";

        }
    }
}