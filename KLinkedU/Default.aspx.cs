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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["login"];
            if (cookie != null)

            {
                user.Attributes["value"] = Request.Cookies["KUserinfo"]["Username"];

                pass.Attributes["value"] = Request.Cookies["KUserinfo"]["Password"];
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {


            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connect = new SqlConnection(connectionString);

            connect.Open();
            //connect.ChangeDatabase("kpborol_Assign4B");

            try
            {
                string login = "INSERT INTO KLogin (Userid , passwrd) VALUES (@userid , @passwrd);";
                string linkeduAccount = "INSERT INTO LinkedU_Account (Userid ) VALUES (@userid);";


                SqlCommand cmd1 = new SqlCommand(login, connect);
                SqlCommand cmd2 = new SqlCommand(linkeduAccount, connect);
                cmd1.Parameters.AddWithValue("@userid", UserIDTBox.Text);
                cmd1.Parameters.AddWithValue("@passwrd", TextBox4.Text);
                cmd2.Parameters.AddWithValue("@userid", UserIDTBox.Text);
                cmd1.ExecuteNonQuery();
            }
            catch (SqlException exception)
            {
                if (exception.Number == 208)
                {
                    SqlCommand sqlCommand = new SqlCommand("CREATE TABLE KLogin (Userid VARCHAR(20) PRIMARY KEY, passwrd VARCHAR(25))", connect);
                    sqlCommand.ExecuteNonQuery();
                }
            }

            try
            {
                string insert = "INSERT INTO KUserinfo (Fname , Lname , Userid , Email , SecurityQuestion , SecurityAnswer , number ) VALUES (@fname, @lname, @userid, @email, @securityquestion ,@securityanswer ,@number);";


                SqlCommand cmd = new SqlCommand(insert, connect);
                cmd.Parameters.AddWithValue("@fname", TextBox1.Text);
                cmd.Parameters.AddWithValue("@lname", TextBox2.Text);
                cmd.Parameters.AddWithValue("@userid", UserIDTBox.Text);
                cmd.Parameters.AddWithValue("@email", TextBox6.Text);
                cmd.Parameters.AddWithValue("@securityquestion", TextBox7.Text);
                cmd.Parameters.AddWithValue("@securityanswer", TextBox8.Text);
                cmd.Parameters.AddWithValue("@number", number.Text);


                cmd.ExecuteNonQuery();
            }
            catch (SqlException exception)
            {
                if (exception.Number == 208)
                {
                    SqlCommand sqlCommand = new SqlCommand("CREATE TABLE KUserinfo (Fname varchar(20) NOT NULL ,Lname varchar(20) NOT NULL,Userid varchar(20) NOT NULL,Email varchar(60) NOT NULL,SecurityQuestion varchar(60) NOT NULL,SecurityAnswer varchar(60) NOT NULL, Id [uniqueidentifier] null,ResetRequestDateTime  datetime null,number varchar(12), [COUNTRY] [varchar](50)  NULL,[ZIPCODE][varchar](5)  NULL, [PROFILE_PICTURE][varchar](50) NULL,[ABOUTME][varchar](1000) NULL,[SKILLS][varchar](200) NULL,[ACT_SCORE][int] NULL,[SAT_SCORE][int] NULL,[LAST_DEGREE_EARNED][varchar](50)  NULL,[MAJOR][varchar](20)  NULL,[MINOR][varchar](20) NULL,[HIGH_SCH_NAME][varchar](50) NULL  Foreign Key (Userid) REFERENCES KLogin(Userid) )", connect);
                    sqlCommand.ExecuteNonQuery();
                }
            }
            finally
            {
                Session["Userid"] = UserIDTBox.Text;
                //Response.Redirect("Homepage.aspx?Userid=" + UserIDTBox.Text);
                Response.Redirect("Profile.aspx");

            }
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "S")
            {

                string name = "SELECT * from KLogin where Userid =  @user ; ";


                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                //connection.ChangeDatabase("kpborol_Assign4B");

                try
                {

                    SqlCommand cmd = new SqlCommand(name, connection);
                    cmd.Parameters.AddWithValue("@user", user.Text);
                    cmd.ExecuteNonQuery();

                    SqlDataReader list = cmd.ExecuteReader();


                    if (list.Read())
                    {
                        if (list["passwrd"].ToString() == pass.Text)
                        {
                            HttpCookie cookie = new HttpCookie("login");
                            Response.Cookies["KUserinfo"]["Username"] = user.Text;
                            Response.Cookies["KUserinfo"]["Password"] = pass.Text;
                            Response.Cookies.Add(cookie);
                            Session["Userid"] = user.Text;
                            Session["status"] = "S";
                            Response.Redirect("Homepage.aspx?Userid=" + user.Text);

                            list.Close();
                        }
                        else { Label6.Text = "Login UnSuccessful"; }

                    }

                    else { Label6.Text = "Login UnSuccessful"; }
                }
                catch (SqlException exception)
                {
                    if (exception.Number == 208)
                        Label6.Text = "Login UnSuccessful";
                }
            }
            else if (DropDownList1.SelectedValue == "R")
            {
                string name = "SELECT * from RLogin where Userid =  @user ; ";


                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                //connection.ChangeDatabase("kpborol_Assign4B");

                try
                {

                    SqlCommand cmd = new SqlCommand(name, connection);
                    cmd.Parameters.AddWithValue("@user", user.Text);
                    cmd.ExecuteNonQuery();

                    SqlDataReader list = cmd.ExecuteReader();


                    if (list.Read())
                    {
                        if (list["passwrd"].ToString() == pass.Text)
                        {
                            HttpCookie cookie = new HttpCookie("login");
                            Response.Cookies["KUserinfo"]["Username"] = user.Text;
                            Response.Cookies["KUserinfo"]["Password"] = pass.Text;
                            Response.Cookies.Add(cookie);
                            Session["Userid"] = user.Text;
                            Session["status"] = "R";

                            Response.Redirect("Homepage.aspx?Userid=" + user.Text);

                            list.Close();
                        }
                        else { Label6.Text = "Login UnSuccessful"; }

                    }

                    else { Label6.Text = "Login UnSuccessful"; }
                }
                catch (SqlException exception)
                {
                    if (exception.Number == 208)
                        Label6.Text = "Login UnSuccessful";
                }
            }

            else if (DropDownList1.SelectedValue == "A")
            {
                if (user.Text == "admin" && pass.Text == "1234")
                {
                    Session["Userid"] = "admin";
                    Session["status"] = "A";

                    Response.Redirect("./Homepage.aspx");
                }
                else { Label6.Text = "Login UnSuccessful"; }
            }
            else { Label6.Text = "Login UnSuccessful"; }
            }


            protected void processTextChanged(object sender, EventArgs e)
            {
                try
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

                    SqlConnection connect = new SqlConnection(connectionString);
                    connect.Open();
                    //connect.ChangeDatabase("kpborol_Assign4B");
                    string name = "SELECT * from KLogin where Userid = @userid ; ";


                    SqlCommand cmd = new SqlCommand(name, connect);
                    cmd.Parameters.AddWithValue("@userid", UserIDTBox.Text);
                    cmd.ExecuteNonQuery();

                    SqlDataReader list = cmd.ExecuteReader();

                    if (list.Read())
                    {
                        if (list["Userid"].ToString() == UserIDTBox.Text)
                        {
                            existOrNotLbl.Text = "User ID already exists!";
                            existOrNotLbl.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        existOrNotLbl.Text = "User ID available";
                        existOrNotLbl.ForeColor = System.Drawing.Color.Green;
                    }

                }

                catch (SqlException exception)
                {
                    if (exception.Number == 208)
                    {
                        existOrNotLbl.Text = "User ID available";
                        existOrNotLbl.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
            protected void Button2_Click(object sender, EventArgs e)
            {
                if (DropDownList1.SelectedValue == "S")
            {
                Session["status"] = "S";
                MultiView1.ActiveViewIndex = 1;
                }

                else if (DropDownList1.SelectedValue == "R")
            {
                Session["status"] = "R";

                Response.Redirect("Add_University.aspx");
                }

            else if (DropDownList1.SelectedValue == "A")
            {

                Response.Redirect("Default.aspx");
            }

        }

            protected void LinkButton1_Click(object sender, EventArgs e)
            {
                Response.Redirect("ForgotPassword.aspx");

            }
        }
    }