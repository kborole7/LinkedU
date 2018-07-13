using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace KLinkedU
{
    public partial class Changedp : System.Web.UI.Page
    {
        private string dpname;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string changedp = "";

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool hasfile = FileUpload1.HasFile;
            
            if (FileUpload1.HasFile)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

                SqlConnection connect = new SqlConnection(connectionString);
                connect.Open();



                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                //FileUpload1.PostedFile.SaveAs(Server.MapPath("./images/" + Session["Userid"].ToString() + filename));
                FileUpload1.PostedFile.SaveAs(Server.MapPath("./images/" + Session["Userid"].ToString() + filename));
                dpname = (Session["Userid"].ToString() + filename).ToString();

                if (Session["status"].ToString() == "S")
                {
                    changedp = "UPDATE KUserinfo SET PROFILE_PICTURE = @dp WHERE Userid =@user;";
                }
                else if (Session["status"].ToString() == "R")
                {
                    changedp = "UPDATE University_Info SET Images = @dp WHERE Userid =@user;";
                }
                SqlCommand cmd1 = new SqlCommand(changedp, connect);
                cmd1.Parameters.AddWithValue("@dp", dpname);
                cmd1.Parameters.AddWithValue("@user", Session["Userid"].ToString());
                cmd1.ExecuteNonQuery();
                Label15.Text = ("Image Uploaded Successfully : " + filename);
                Label15.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void Remove_Click(object sender, EventArgs e)
        {
            dpname = "generic-user.jpg";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();

            if (Session["status"].ToString() == "S")
            {
                changedp = "UPDATE KUserinfo SET PROFILE_PICTURE = @dp WHERE Userid =@user;";
            }
            else if (Session["status"].ToString() == "R")
            {
                changedp = "UPDATE University_Info SET Images = @dp WHERE Userid =@user;";
            }
            SqlCommand cmd1 = new SqlCommand(changedp, connect);
            cmd1.Parameters.AddWithValue("@dp", dpname);
            cmd1.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd1.ExecuteNonQuery();
            Label15.Text = ("Profile Picture Removed");
            Label15.ForeColor = System.Drawing.Color.Green;

        }
    }
}