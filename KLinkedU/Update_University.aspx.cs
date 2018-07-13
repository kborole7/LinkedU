using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace KLinkedU
{
    public partial class Update_University : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Userid"] != null)
            {
                string pre = "SELECT * from University_Info where Userid = @userid ;";

                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection connect = new SqlConnection(connectionString);
                connect.Open();
                SqlCommand cmd = new SqlCommand(pre, connect);
                cmd.Parameters.AddWithValue("@userid", Session["Userid"].ToString());
                cmd.ExecuteNonQuery();
                SqlDataReader list = cmd.ExecuteReader();

                if (list.Read())
                {

                    fname.Attributes["value"] = list["Fname"].ToString();
                    lname.Attributes["value"] = list["Lname"].ToString();
                    uid.Attributes["value"] = list["Userid"].ToString();
                    email.Attributes["value"] = list["email"].ToString();
                    uname.Attributes["value"] = list["University_Name"].ToString();
                    state.Attributes["value"] = list["State"].ToString();
                    country.Attributes["value"] = list["Country"].ToString();
                    zip.Attributes["value"] = list["Zip_Code"].ToString();
                    act.Attributes["value"] = list["Minimum_ACT"].ToString();
                    sat.Attributes["value"] = list["Minimum_SAT"].ToString();
                    web_url.Attributes["value"] = list["Website"].ToString();
                    descrp.Attributes["value"] = list["Descr"].ToString();


                }
                else
                    Response.Write("no data");
            }
            else
            {
                Response.Redirect("Default.aspx");
            }




        }

        protected void Submit_Click(object sender, EventArgs e)
        {


            if (Page.IsValid)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection dbconnect = new SqlConnection(connectionString);

                dbconnect.Open();
                //dbconnect.ChangeDatabase("kpborol_Assign4B");


                SqlCommand cmd = new SqlCommand("Update University_Info SET University_Name = @uname, State = @state, Zip_Code = @zip, Country =@country," +
                    "Website = @website, Descr = @descr,Fname = @fname, Lname = @lname, Email = @email, Minimum_ACT = @act, Minimum_SAT = @sat where Userid = @userid", dbconnect);
                cmd.Parameters.AddWithValue("@uname", uname.Text);
                cmd.Parameters.AddWithValue("@state", state.Text);
                cmd.Parameters.AddWithValue("@zip", zip.Text);
                cmd.Parameters.AddWithValue("@country", country.Text);
                cmd.Parameters.AddWithValue("@website", web_url.Text);
                cmd.Parameters.AddWithValue("@descr", descrp.Text);
                cmd.Parameters.AddWithValue("@fname", fname.Text);
                cmd.Parameters.AddWithValue("@lname", lname.Text);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@act", act.Text);
                cmd.Parameters.AddWithValue("@sat", sat.Text);
                cmd.Parameters.AddWithValue("@userid", Session["Userid"].ToString());

                cmd.ExecuteNonQuery();

                SqlCommand cmd1 = new SqlCommand("Update RLogin SET passwrd= @passwrd  where Userid= @userid;", dbconnect);
                cmd1.Parameters.AddWithValue("@passwrd", pass.Text);
                cmd1.Parameters.AddWithValue("@userid", Session["Userid"].ToString());
                cmd1.ExecuteNonQuery();

                MsgBox("Profile Updated Successfully!!!!!!");
               

                dbconnect.Close();

            }
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
