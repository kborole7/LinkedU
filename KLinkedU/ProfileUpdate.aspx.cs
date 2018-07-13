using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace KLinkedU
{
    public partial class ProfileUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

                TextBox1.Attributes["value"] = list["COUNTRY"].ToString();
                TextBox2.Attributes["value"] = list["ZIPCODE"].ToString();
               
                TextBox5.Attributes["value"] = list["ACT_SCORE"].ToString();
                TextBox6.Attributes["value"] = list["SAT_SCORE"].ToString();
                DropDownList1.Attributes["value"] = list["LAST_DEGREE_EARNED"].ToString();
                TextBox8.Attributes["value"] = list["MAJOR"].ToString();
                TextBox9.Attributes["value"] = list["MINOR"].ToString();
                TextBox10.Attributes["value"] = list["HIGH_SCH_NAME"].ToString();
               

            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string insertdata = "UPDATE[dbo].[KUserinfo]  SET [COUNTRY] =@country  ,[ZIPCODE] =@zipcode  ,[ABOUTME] =@aboutme  ,[SKILLS] =@skills ,[ACT_SCORE] =   @act    ,[SAT_SCORE] = @sat  ,[LAST_DEGREE_EARNED] =@lastdegree  ,[MAJOR] = @major ,[MINOR] = @minor,[HIGH_SCH_NAME] =@highschool WHERE Userid =@user;";


            //"INSERT INTO[dbo].[STUDENT_PROFILE_INFO]   ([COUNTRY],[ZIPCODE] ,[PROFILE_PICTURE],[ABOUTME],[SKILLS],[ACT_SCORE],[SAT_SCORE],[PSATORNMSQT_SCORE],[LAST_DEGREE_EARNED],[MAJOR],[MINOR],[HIGH_SCH_NAME]) VALUES (@country,@zipcode,@profilepic,@aboutme,@skills,@act,@sat,@psat,@lastdegree,@major,@minor,@highschool)";
            SqlCommand cmd1 = new SqlCommand(insertdata, connection);

            cmd1.Parameters.AddWithValue("@country", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@zipcode", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@aboutme", TextBox3.Text);
            cmd1.Parameters.AddWithValue("@skills", TextBox4.Text);
            cmd1.Parameters.AddWithValue("@act", TextBox5.Text);
            cmd1.Parameters.AddWithValue("@sat", TextBox6.Text);
            cmd1.Parameters.AddWithValue("@lastdegree", DropDownList1.SelectedItem.Text);
            cmd1.Parameters.AddWithValue("@major", TextBox8.Text);
            cmd1.Parameters.AddWithValue("@minor", TextBox9.Text);
            cmd1.Parameters.AddWithValue("@highschool", TextBox10.Text);
            cmd1.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd1.ExecuteNonQuery();

            Response.Redirect("Homepage.aspx");
        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Homepage.aspx");

        }
    }
}