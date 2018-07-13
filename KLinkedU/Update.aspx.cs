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
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Userid"] != null)
            {
                string pre = "SELECT * from KUserinfo where Userid = @userid ;";

                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection connect = new SqlConnection(connectionString);
                connect.Open();
                SqlCommand cmd = new SqlCommand(pre, connect);
                cmd.Parameters.AddWithValue("@userid", Session["Userid"].ToString());
                cmd.ExecuteNonQuery();
                SqlDataReader list = cmd.ExecuteReader();

                if (list.Read())
                {

                    UTextBox1.Attributes["value"] = list["Fname"].ToString();
                    UTextBox2.Attributes["value"] = list["Lname"].ToString();
                    UTextBox3.Attributes["value"] = list["Userid"].ToString();
                    UTextBox6.Attributes["value"] = list["email"].ToString();
                    UTextBox7.Attributes["value"] = list["SecurityQuestion"].ToString();
                    UTextBox8.Attributes["value"] = list["SecurityAnswer"].ToString();


                }
                else
                    Response.Write("no data");
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string updateuser = "Update KUserinfo SET Fname= @fname ,Lname=@lname,Email= @email , SecurityQuestion= @securityquestion,SecurityAnswer= @securityanswer WHERE Userid= @userid ;";
            string updatelogin = "Update KLogin SET passwrd= @passwrd  where Userid= @userid ;";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();
            SqlCommand cmd = new SqlCommand(updateuser, connect);
            cmd.Parameters.AddWithValue("@fname", UTextBox1.Text);
            cmd.Parameters.AddWithValue("@lname", UTextBox2.Text);
            cmd.Parameters.AddWithValue("@email", UTextBox6.Text);
            cmd.Parameters.AddWithValue("@securityquestion", UTextBox7.Text);
            cmd.Parameters.AddWithValue("@securityanswer", UTextBox8.Text);
            cmd.Parameters.AddWithValue("@userid", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand(updatelogin, connect);
            cmd1.Parameters.AddWithValue("@passwrd", UTextBox4.Text);
            cmd1.Parameters.AddWithValue("@userid", Session["Userid"].ToString());

            cmd1.ExecuteNonQuery();
            //Session["Userid"] = UTextBox4.Text;
            Response.Redirect("ProfileUpdate.aspx");

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}