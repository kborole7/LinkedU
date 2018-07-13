using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace KLinkedU
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connect = new SqlConnection(connectionString);
            connect.Open();
            

            




            if (Session["status"].ToString() == "S")
            {
                string pre = "SELECT * from KUserinfo where Userid ='" + Session["Userid"].ToString() + "'; ";

                SqlCommand cmd = new SqlCommand(pre, connect);
                cmd.ExecuteNonQuery();
                SqlDataReader list = cmd.ExecuteReader();
                list.Read();
                LinkButton1.Text = list["Fname"].ToString();
                ImageButton1.ImageUrl = "./images/" + list["Profile_Picture"].ToString();

                //if (list.Read())
                //{
                //    LinkButton1.Text = list["Fname"].ToString();
                //    Image2.ImageUrl = "./images/" + list["Profile_Picture"].ToString();
                //}
                //else
                //{
                //    LinkButton1.Text = "Username";
                //    Image2.ImageUrl = "./images/generic-user.jpg";
                //}

                list.Close();


            }
            else if (Session["status"].ToString() == "R")
            {
                string pre = "SELECT * from University_Info where Userid ='" + Session["Userid"].ToString() + "'; ";

                SqlCommand cmd = new SqlCommand(pre, connect);
                cmd.ExecuteNonQuery();
                SqlDataReader list = cmd.ExecuteReader();
                list.Read();
                LinkButton1.Text = list["Fname"].ToString();
                ImageButton1.ImageUrl = "./images/" + list["Images"].ToString();
                list.Close();
                //if (list.Read())
                //{
                //    LinkButton1.Text = list["Fname"].ToString();
                //    Image2.ImageUrl = "./images/" + list["Images"].ToString();
                //}
                //else
                //{
                //    LinkButton1.Text = "Username";
                //    Image2.ImageUrl = "./images/generic-user.jpg";
                //}


            }
            else if (Session["status"].ToString() == "A")
            {
                LinkButton1.Text = "Admin";
                ImageButton1.ImageUrl = "./images/generic-user.jpg";
            }

            //if (Session["status"].ToString()=="R")
            //{
            //    string connectionString1 = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            //    SqlConnection connect1 = new SqlConnection(connectionString1);
            //    connect1.Open();
            //    connect1.ChangeDatabase("kpborol_Assign4B");

            //    string pre1 = "SELECT * from University_Info where Userid ='" + Session["Userid"].ToString() + "'; ";

            //    SqlCommand cmd1 = new SqlCommand(pre1, connect1);
            //    cmd1.ExecuteNonQuery();
            //    SqlDataReader list1 = cmd.ExecuteReader();
            //    list1.Read();
            //    LinkButton1.Text = list1["Fname"].ToString();
            //    list1.Close();
            //}
            //else { LinkButton1.Text = "Admin"; }


            //DataTable dt = new DataTable();

            //string strQuery = "Select * from KUserinfo where Userid= @user;";
            //SqlCommand command = new SqlCommand(strQuery);
            //command.Parameters.AddWithValue("@user", Session["Userid"].ToString());

            //SqlDataAdapter sda = new SqlDataAdapter();
            //command.CommandType = CommandType.Text;
            //command.Connection = connect;
            //command.ExecuteNonQuery();

            //sda.SelectCommand = command;
            //sda.Fill(dt);

            //if (dt.Rows.Count > 0)
            //{
            //    Image2.ImageUrl = "./images/" + dt.Rows[0]["Profile_Picture"].ToString();
            //}
            //else
            //{
            //    Image2.ImageUrl = "generic-user.png";
            //}
            connect.Close();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["status"].ToString() == "S")
                Response.Redirect("./Update.aspx");
            else if (Session["status"].ToString() == "R")
                Response.Redirect("./Update_University.aspx");
            

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MeetTheTeam.aspx");
        }
    }
}