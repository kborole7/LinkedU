using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KLinkedU
{
    public partial class Add_University : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string filename = "";
            bool valid = true;

            if (FileUpload1.HasFile)
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentType == "image/jpeg")
                    {
                        if (FileUpload1.PostedFile.ContentLength < 1000000)
                        {
                            filename = Path.GetFileName(FileUpload1.FileName);
                            FileUpload1.SaveAs(Server.MapPath("~/images/") + filename);
                            upld_status.Text = "Upload status: File uploaded!";
                        }
                        else
                            upld_status.Text = "Upload status: The file has to be less than 1 mb!";
                    }
                    else
                        upld_status.Text = "Upload status: Only JPEG files are accepted!";
                }
                catch (Exception ex)
                {
                    upld_status.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            else
                filename = "generic-user.jpg";

            if (Page.IsValid)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
                SqlConnection dbconnect = new SqlConnection(connectionString);

                dbconnect.Open();
                //dbconnect.ChangeDatabase("kpborol_Assign4B");

                try
                {
                    SqlCommand cmd = new SqlCommand("Insert into University_Info (University_Name,State,Zip_Code,Country,Website,Images,Descr,Fname,Lname,Email,Userid,Minimum_ACT,Minimum_SAT) values" +
                        "(@uname,@state,@zip,@country,@website,@image,@descr,@fname,@lname,@email,@uid,@act,@sat)", dbconnect);
                    cmd.Parameters.AddWithValue("@uname", uname.Text);
                    cmd.Parameters.AddWithValue("@state", state.Text);
                    cmd.Parameters.AddWithValue("@zip", zip.Text);
                    cmd.Parameters.AddWithValue("@country", country.Text);
                    cmd.Parameters.AddWithValue("@website", web_url.Text);
                    cmd.Parameters.AddWithValue("@descr", Request.Form["descr"]);
                    cmd.Parameters.AddWithValue("@fname", fname.Text);
                    cmd.Parameters.AddWithValue("@lname", lname.Text);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    cmd.Parameters.AddWithValue("@uid", uid.Text);
                    cmd.Parameters.AddWithValue("@act", act.Text);
                    cmd.Parameters.AddWithValue("@sat", sat.Text);
                    cmd.Parameters.AddWithValue("@image", filename);

                    cmd.ExecuteNonQuery();

                    SqlCommand cmd1 = new SqlCommand("Insert into RLogin values (@usid,@pass)",dbconnect);
                    cmd1.Parameters.AddWithValue("@usid", uid.Text);
                    cmd1.Parameters.AddWithValue("@pass", pass.Text);
                    cmd1.ExecuteNonQuery();
                }

                catch (SqlException exception)
                {
                    if (exception.Number == 2627)
                        valid = false;
                    else
                        valid = true;
                }

                if (valid)
                {
                    Session["Userid"] = uid.Text;
                    Response.Redirect("./Homepage.aspx");
                }
                else
                    sqlerr.Text = "User Already exists";


                dbconnect.Close();


            }
        }

        protected void processTextChanged(object sender, EventArgs e)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

                SqlConnection connect = new SqlConnection(connectionString);
                connect.Open();
                //connect.ChangeDatabase("kpborol_Assign4B");
                string name = "SELECT * from RLogin where Userid = @userid ; ";


                SqlCommand cmd = new SqlCommand(name, connect);
                cmd.Parameters.AddWithValue("@userid", uid.Text);
                cmd.ExecuteNonQuery();

                SqlDataReader list = cmd.ExecuteReader();

                if (list.Read())
                {
                    if (list["Userid"].ToString() == uid.Text)
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

        private void MsgBox(string sMessage)
        {
            string msg = "<script language=\"javascript\">";
            msg += "alert('" + sMessage + "');";
            msg += "</script>";
            Response.Write(msg);
        }
    }
}