using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Data;
using Twilio;
using Twilio.Types;
using Twilio.Rest.Api.V2010.Account;


namespace KLinkedU
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        public static string r { get; set; }

        public static string UniqueId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = "SELECT * from KUserinfo where Email = @Email ; ";
            string insertid = "Update KUserinfo  set Id=@id , ResetRequestDateTime = @DateTime where Email = @Email ; ";
            string connectionString = ConfigurationManager.ConnectionStrings["DB_Connect"].ConnectionString;

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand cmd1 = new SqlCommand(email, connection);
            cmd1.Parameters.AddWithValue("@Email", TextBox1.Text);
            SqlDataReader list1 = cmd1.ExecuteReader();
            if (list1.Read())
            {
                SqlCommand cmd2 = new SqlCommand(insertid, connection);
                cmd2.Parameters.AddWithValue("@id", Guid.NewGuid());
                cmd2.Parameters.AddWithValue("@DateTime", DateTime.Now);
                cmd2.Parameters.AddWithValue("@Email", TextBox1.Text);

                list1.Close();
                cmd2.ExecuteNonQuery();
                SqlDataReader list2 = cmd1.ExecuteReader();
                list2.Read();

                UniqueId = list2["Id"].ToString();
                SendPasswordResetEmail(list2["Fname"].ToString(), list2["Lname"].ToString());

                FPLabel3.Text = ("An email with instructions to reset your password is sent to your registered email");

                if (CheckBox1.Checked)
                {
                    Random generator = new Random();
                    r = generator.Next(100000, 999999).ToString();
                    //original
                    const string accountSid = "AC687e4aa1e3934f5c2c01f8d34e32b534";
                    const string authToken = "af2ce27f321fdaf29d881e70a4d1e867";

                    //testing
                    //const string accountSid = "AC769427ef08eab09194c407dadee61a81";
                    //const string authToken = "4f3e1da2508704527a380b0f59f1e616";
                    TwilioClient.Init(accountSid, authToken);

                    string number = list2["number"].ToString();
                    var to = new PhoneNumber(number);
                    var message = MessageResource.Create(to,
                                                         from: new PhoneNumber("+13092132192"),
                                                         body: "This is your 6 digit Verification code:  " + r + "     The LinkedU Team.");
                    FPLabel4.Text = (" A SMS with a 6 digit verification code is sent to your registered phone number.");

                    entercode.Attributes.Add("style", "visibility:Visible;  padding-left: 3%; border: double; width:500px");

                }
            }

            else
            {
                FPLabel3.ForeColor = System.Drawing.Color.Red;
                FPLabel3.Text = ("We Couldn't find any LinkedU account associated with " + TextBox1.Text);
            }


        }
        private void SendPasswordResetEmail(string Fname, string Lname)
        {

            //Label3.Text = "Email Sent";

            string receiverEmail = TextBox1.Text.ToLower();
            string receiverName = Fname + Lname;



            SmtpClient MyServer = new SmtpClient();

            MailAddress from = new MailAddress("kpborol@ilstu.edu", "LinkedU");

            MailAddress receiver = new MailAddress(receiverEmail, receiverName);

            MailMessage Mymessage = new MailMessage(from, receiver);
            Mymessage.Subject = "" + Fname + ", here's the link to reset your password";
            Mymessage.AlternateViews.Add(Mail_Body(Fname));
            Mymessage.IsBodyHtml = true;


            Mymessage.Priority = MailPriority.High;
            MyServer.Send(Mymessage);

        }

        //    }

        //    else { Label3.Text = "We Couldn't find any LinkedU account associated with " + TextBox1.Text; }
        //}
        //catch (SqlException exception)
        //{
        //    Response.Write("" + exception);
        //}


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
                          " + " Hi " + Fname + ",<br/> Reset your password, and we'll get you on your way.To change your LinkedU password,  paste the following link into your browser:http://iis2.it.ilstu.edu/17f485/it485f701/app9/ChangePassword.aspx?uid=" + UniqueId + " .Thank you for using LinkedU!The LinkedU Team  <br /> <br /> ";



            AlternateView AV =
                 AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
            AV.LinkedResources.Add(Img);
            return AV;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == r)
            {
                Response.Redirect("http://iis2.it.ilstu.edu/17f485/it485f701/app9/ChangePassword.aspx?uid=" + UniqueId);


            }
            else
            {
                Label6.ForeColor = System.Drawing.Color.Red;
                Label6.Text = "Invalid Verification Code*";
            }
        }
    }
}
