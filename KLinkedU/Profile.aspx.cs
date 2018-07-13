using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;


namespace KLinkedU
{
    public partial class Profile : System.Web.UI.Page
    {
        public static string path = "";
        public static string filename =  "generic-user.jpg";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imageupload_Click(object sender, EventArgs e)
        {
            bool hasfile = FileUpload1.HasFile;
            if (FileUpload1.HasFile)
            {
                 filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("./images/" + Session["Userid"].ToString() + filename));
                path = ("./images/" + Session["Userid"].ToString() + filename).ToString();
                Label13.Text = ("Image Uploaded Successfully : " + filename);
            }
            else
            {
                filename = "generic-user.jpg";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string insertdata = "UPDATE[dbo].[KUserinfo]  SET [COUNTRY] =@country  ,[ZIPCODE] =@zipcode   ,[PROFILE_PICTURE] = @profilepic,[ABOUTME] =@aboutme  ,[SKILLS] =@skills ,[ACT_SCORE] =   @act    ,[SAT_SCORE] = @sat  ,[LAST_DEGREE_EARNED] =@lastdegree  ,[MAJOR] = @major ,[MINOR] = @minor,[HIGH_SCH_NAME] =@highschool WHERE Userid =@user;";


            //"INSERT INTO[dbo].[STUDENT_PROFILE_INFO]   ([COUNTRY],[ZIPCODE] ,[PROFILE_PICTURE],[ABOUTME],[SKILLS],[ACT_SCORE],[SAT_SCORE],[PSATORNMSQT_SCORE],[LAST_DEGREE_EARNED],[MAJOR],[MINOR],[HIGH_SCH_NAME]) VALUES (@country,@zipcode,@profilepic,@aboutme,@skills,@act,@sat,@psat,@lastdegree,@major,@minor,@highschool)";
            SqlCommand cmd1 = new SqlCommand(insertdata, connection);

            cmd1.Parameters.AddWithValue("@country", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@zipcode", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@profilepic", filename);
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
    }
}