using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace KLinkedU
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                string select = "Select Userid from KUserinfo where Id=@uid;";
                SqlCommand cmd1 = new SqlCommand(select, connection);
                cmd1.Parameters.AddWithValue("@uid", Request.QueryString["uid"]);
                SqlDataReader list1 = cmd1.ExecuteReader();
                if (!list1.Read())
                {
                    Response.Redirect("ForgotPassword.aspx");

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            string select = "Select Userid from KUserinfo where Id=@uid;";
            string changepass = " Update KLogin set passwrd=@password where Userid=@user;";
            string changeuid = "Update KUserinfo set Id = @id , ResetRequestDateTime = @DateTime where Userid = @user;";
            SqlCommand cmd1 = new SqlCommand(select, connection);
            cmd1.Parameters.AddWithValue("@uid", Request.QueryString["uid"]);

            SqlDataReader list1 = cmd1.ExecuteReader();

            if (list1.Read())
            {
                SqlCommand cmd2 = new SqlCommand(changepass, connection);
                cmd2.Parameters.AddWithValue("@password", TextBox2.Text);
                cmd2.Parameters.AddWithValue("@user", list1["Userid"].ToString());

                SqlCommand cmd3 = new SqlCommand(changeuid, connection);
                cmd3.Parameters.AddWithValue("@id", Guid.NewGuid());
                cmd3.Parameters.AddWithValue("@DateTime", DateTime.Now);
                cmd3.Parameters.AddWithValue("@user", list1["Userid"].ToString());

                list1.Close();
                cmd2.ExecuteNonQuery();
                Label3.Text = "Password changed Succesfully! Please try login again.";

                cmd3.ExecuteNonQuery();
            }

            else
            {
                Label3.ForeColor = System.Drawing.Color.Red;
                Label3.Text = "Password Reset link has expired or is invalid";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Homepage.aspx");

        }
    }
}