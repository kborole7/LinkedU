using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net.Mime;

namespace KLinkedU
{
    public partial class LinkedUSubscription : System.Web.UI.Page
    {
        string subscribe = "";
        string unsubscribe = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string CheckSubscriptionStatus = "Select * from LinkedU_Account where Userid= @user;";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand(CheckSubscriptionStatus, connection);
            cmd.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();

            SqlDataReader list = cmd.ExecuteReader();

            if (list.Read())
            {
                if ((list["Subscription"]).ToString() == "N")
                { MultiView1.ActiveViewIndex = 1; }
                else { }
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string ChangeSubscriptionStatus = "Update LinkedU_Account set Subscription='N' where Userid= @user;";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand(ChangeSubscriptionStatus, connection);
            cmd.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();
            Label4.Text = "You have Successfully Unsubscribed.";
            unsubscribe = "You have Successfully Unsubscribed from the <b>Mailing List</b>. You will no longer receive mails from <b>LinkedU</b>.";
            sendEmail("N");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ChangeSubscriptionStatus = "Update LinkedU_Account set Subscription='Y' where Userid= @user;";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd = new SqlCommand(ChangeSubscriptionStatus, connection);
            cmd.Parameters.AddWithValue("@user", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();
            Label3.Text = "You have Successfully Subscribed.";
            subscribe = "Thank you for subscribing to <b>LinkedU</b>. You will be receiving regular updates from us.";
            sendEmail("Y");
        }

        private void sendEmail(string subscription)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            SqlCommand cmd = new SqlCommand("Select * from KUserinfo where Userid = @userid", dbconnect);
            cmd.Parameters.AddWithValue("@userid", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();

            SqlDataReader list = cmd.ExecuteReader();
            list.Read();

            string receiverEmail = list["Email"].ToString();
            string receiverName = list["Fname"].ToString();



            SmtpClient MyServer = new SmtpClient();

            MailAddress from = new MailAddress("kpborol@ilstu.edu", "LinkedU");

            MailAddress receiver = new MailAddress(receiverEmail, receiverName);

            MailMessage Mymessage = new MailMessage(from, receiver);
            Mymessage.Subject = "" + receiverName + ", Subscription Update";
            Mymessage.AlternateViews.Add(Mail_Body(receiverName, subscription));
            Mymessage.IsBodyHtml = true;


            Mymessage.Priority = MailPriority.High;
            MyServer.Send(Mymessage);

        }


        public AlternateView Mail_Body(string Fname, string subscription)
        {
            string msgbody="";
            string path = Server.MapPath("./logo.JPG");
            LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);

            //LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
            Img.ContentId = "MyImage";

            if (subscription == "Y")
                msgbody = subscribe;
            else if (subscription == "N")
                msgbody = unsubscribe;

            string str = @"  
            <table>  
            
                <tr>  
                    <td>  
                      <img src=cid:MyImage  id='img' alt='' width='400px' height='100px'/>   
                    </td>  
                </tr>
                   <tr><td>
                          " + " Hi " + Fname + ",<br/><br/>" + msgbody + "<br/><br/>Thank you for using LinkedU!<br/>The LinkedU Team  <br /> <br /> ";



            AlternateView AV =
                 AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
            AV.LinkedResources.Add(Img);
            return AV;
        }
    }

}