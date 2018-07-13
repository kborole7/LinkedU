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
    public partial class StudentContact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection dbconnect = new SqlConnection(connectionString);
            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            SqlCommand cmd = new SqlCommand("Select * from KUserinfo where Userid = @Userid", dbconnect);
            cmd.Parameters.AddWithValue("@Userid", Session["stud_id"]);

            SqlDataAdapter Adp = new SqlDataAdapter();

            Adp.SelectCommand = cmd;
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            DataList1.DataSource = Dt;
            DataList1.DataBind();
        }
    }
}