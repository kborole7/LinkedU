using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KLinkedU
{
    public partial class calander_test : System.Web.UI.Page
    {
        string msgBody = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;
            SqlConnection dbconnect = new SqlConnection(connectionString);

            dbconnect.Open();
            //dbconnect.ChangeDatabase("kpborol_Assign4B");

            SqlCommand cmd = new SqlCommand("Select Fname, Lname from KUserinfo where Userid = @userid", dbconnect);
            cmd.Parameters.AddWithValue("@userid", Session["Userid"].ToString());
            cmd.ExecuteNonQuery();

            SqlDataReader list = cmd.ExecuteReader();

            if (list.Read())
                Stu_name.Text = list["Fname"].ToString() + " " + list["Lname"].ToString();

            Univ_name.Text = Session["uni_name"].ToString();

        }

        protected void schd_Click(object sender, EventArgs e)
        {
            DateTime time = DateTime.Parse(string.Format("{0}:{1}:{2} {3}", TimeSelector.Hour, TimeSelector.Minute, TimeSelector.Second, TimeSelector.AmPm));
            //ClientScript.RegisterStartupScript(this.GetType(), "time", "alert('Selected Time: " + time.ToString("hh:mm:ss tt") + "');", true);

            conf.Text = "Your appointment with <b>" + Univ_name.Text + "</b> is scheduled on " + appt_date.Text + " at <b>" + time.ToString("hh:mm:ss tt") + "</b><br/> We have mailed you the details on your registered email id.";

            msgBody = "your appointment with <b>" + Univ_name.Text + "</b> is scheduled on " + appt_date.Text + " at <b>" + time.ToString("hh:mm:ss tt") + "</b>";
            sendEmail();
        }


        private void sendEmail()
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
            Mymessage.Subject = "" + receiverName + ", Appointment Scheduled";
            Mymessage.AlternateViews.Add(Mail_Body(receiverName));
            Mymessage.IsBodyHtml = true;


            Mymessage.Priority = MailPriority.High;
            MyServer.Send(Mymessage);

        }


        public AlternateView Mail_Body(string Fname)
        {

            string path = Server.MapPath("./logo.JPG");
            LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);

            //LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
            Img.ContentId = "MyImage";
            string str = @"  
            <table>  
            
                <tr>  
                    <td>  
                      <img src=cid:MyImage  id='img' alt='' width='400px' height='100px'/>   
                    </td>  
                </tr>
                   <tr><td>
                          " + " Hi " + Fname + ",<br/><br/> As per your request " + msgBody + " Please be there 15-20 mins prior. <br/><br/>Thank you for using LinkedU!<br/>The LinkedU Team  <br /> <br /> ";



            AlternateView AV =
                 AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
            AV.LinkedResources.Add(Img);
            return AV;
        }
    }
}