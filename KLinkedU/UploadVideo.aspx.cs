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
    public partial class UploadVideo : System.Web.UI.Page
    {

        private object filename1;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    // If file size is greater than 4 MB
                    if (fileSize > 4097152)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "File size cannot be greater than 4 MB";
                    }
                    else
                    {

                        FileUpload1.SaveAs(Server.MapPath("./Mixtapes/" + FileUpload1.FileName));
                        filename1 = FileUpload1.FileName;
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "File uploaded successfully";

                        string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                        SqlConnection dbConnection = new SqlConnection(connectionString);
                       dbConnection.Open();
                        //dbConnection.ChangeDatabase("kpborol_Assign4B");

                        string Genre1 = Genre.Text;
                        string UserId = Session["Userid"].ToString();
                        string strQuery = "insert into Student_Media (FileName, FilePath, UserId, Genre) values (@FileName, @FilePath, @Userid, @Genre);";
                        //string strQuery = "insert into Student_Media (FileName, FilePath,Genre)" + "values(@FileName, @FilePath, @Genre)";
                        SqlCommand cmd = new SqlCommand(strQuery);
                        cmd.Parameters.AddWithValue("@FileName", filename1);
                        cmd.Parameters.AddWithValue("@FilePath", "./Mixtapes/" + filename1);
                        cmd.Parameters.AddWithValue("@Userid", UserId);
                        cmd.Parameters.AddWithValue("@Genre", Genre1);
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = dbConnection;
                        cmd.ExecuteNonQuery();
                        dbConnection.Close();

                    }
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Please select a file to upload";
                }
            }
            catch ( Exception ex)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "File size cannot be greater than 4 MB";
            }

        }


    }
}