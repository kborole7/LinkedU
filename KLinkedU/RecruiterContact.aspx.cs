using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KLinkedU
{
    public partial class RecruiterContact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            string uni_name = Session["uni_name"].ToString();
            SqlCommand cmd = new SqlCommand("Select * from University_Info where University_Name = @univ", dbconnect);
            cmd.Parameters.AddWithValue("@univ", uni_name);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            uname.Text = "" + dr["University_Name"];
            addr.Text = "" + dr["State"] + ", " + dr["Zip_Code"] + ", " + dr["Country"];
            recru_name.Text = "" + dr["Lname"] + " " + dr["Fname"];
            email.Text = "" + dr["Email"];


        }
    }
}