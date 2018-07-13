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
    public partial class profilevisits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();
            string UserId = Session["Userid"].ToString();

            SqlCommand getvid = new SqlCommand("SELECT vuserid FROM visitors WHERE puserid = @userid", connect);
            //SqlCommand getvid = new SqlCommand("SELECT vuserid FROM visitors WHERE puserid = 'rvpisal'", connect);
            getvid.Parameters.AddWithValue("@userid", UserId);
            getvid.ExecuteNonQuery();
            SqlDataAdapter genreRdr = new SqlDataAdapter();
            genreRdr.SelectCommand = getvid;
            DataTable dt2 = new DataTable();
            genreRdr.Fill(dt2);

            if (dt2.Rows.Count > 0)
            {
                string getinfo = "SELECT * FROM LinkedU_Account WHERE Userid = @id;";
                SqlCommand checkDatabaseTable = new SqlCommand(getinfo, connect);
                checkDatabaseTable.Parameters.AddWithValue("@id", UserId);
                checkDatabaseTable.ExecuteNonQuery();
                SqlDataReader Records = checkDatabaseTable.ExecuteReader();
                Records.Read();
               
                if (Records["Membership"].ToString() == "Y")
                {
                    SqlConnection connect1 = new SqlConnection(connectionString);
                    connect1.Open();
                    //connect1.ChangeDatabase("kpborol_Assign4B");
                    string Userid1 = Session["Userid"].ToString();
                    //string Userid1 = "ishan30";
                    string visitors = "SELECT DISTINCT K.Fname, K.Lname, K.Userid, V.vuserid FROM visitors V INNER JOIN KUserinfo K ON K.Userid = V.vuserid WHERE V.puserid = @userid  AND V.vuserid !=  @userid  ;";

                    SqlCommand displayvisitors = new SqlCommand(visitors, connect1);
                    displayvisitors.Parameters.AddWithValue("@userid", Userid1);
                    SqlDataAdapter dadp = new SqlDataAdapter();
                    dadp.SelectCommand = displayvisitors;
                    DataSet ds1 = new DataSet();
                    dadp.Fill(ds1);
                    DataList5.DataSource = ds1;
                    DataList5.DataBind();
                    connect1.Close();

                }
                else if (Records["Membership"].ToString() == "N")
                {
                    
                    SqlConnection connect2 = new SqlConnection(connectionString);

                   
                    connect2.Open();
                    //connect2.ChangeDatabase("kpborol_Assign4B");
                    string Userid2 = Session["Userid"].ToString();

                    string visitors = "SELECT count(DISTINCT(V.vuserid)) AS 'COUNT' FROM visitors V INNER JOIN KUserinfo K ON K.Userid = V.vuserid WHERE V.puserid = @userid  AND V.vuserid !=  @userid ;";
                    //string visitors = "SELECT count(V.vuserid) AS 'COUNT' FROM visitors V INNER JOIN KUserinfo K ON K.Userid = V.vuserid WHERE V.puserid = 'ishan30';";
                    SqlCommand displayvisitors = new SqlCommand(visitors, connect2);
                    displayvisitors.Parameters.AddWithValue("@userid", Userid2);
                    SqlDataAdapter dadp = new SqlDataAdapter();
                    dadp.SelectCommand = displayvisitors;
                    DataSet ds2 = new DataSet();
                    dadp.Fill(ds2);
                    DataList6.DataSource = ds2;
                    DataList6.DataBind();
                    connect2.Close();
                }
                else
                {
                    Label20.Text = "Sorry, nobody has visited your profile yet!!";
                    Label20.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                Label20.Text = "Sorry, nobody has visited your profile yet!!";
                Label20.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}