using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KLinkedU
{
    public partial class Apply_University : System.Web.UI.Page
    {
        public static string filename1;
        public static string filename2;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // If the user has selected a file
            if (FileUpload1.HasFile)
            {
                // Get the file extension
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileExtension.ToLower() != ".pdf")
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Only files with .pdf extension are allowed";
                }
                else
                {
                    // Get the file size
                    int fileSize = FileUpload1.PostedFile.ContentLength;
                    // If file size is greater than 2 MB
                    if (fileSize > 2097152)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "File size cannot be greater than 2 MB";
                    }
                    else
                    {

                        //// Upload the file
                        FileUpload1.SaveAs(Server.MapPath("./SOP/" + FileUpload1.FileName));
                        filename1 = FileUpload1.FileName;
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "File uploaded successfully";

                    }
                }
            }

            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please select a file";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            string pdfPath = Server.MapPath("./SOP/" + filename1);
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(pdfPath);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", buffer.Length.ToString());
            Response.BinaryWrite(buffer);

        }
        // division between RESUME and TRANSCRIPT //
        protected void btnUpload2_Click(object sender, EventArgs e)
        {
            // If the user has selected a file
            if (FileUpload2.HasFile)
            {
                // Get the file extension
                string fileExtension = System.IO.Path.GetExtension(FileUpload2.FileName);
                if (fileExtension.ToLower() != ".pdf")
                {
                    lblMessage0.ForeColor = System.Drawing.Color.Red;
                    lblMessage0.Text = "Only files with .pdf extension are allowed";
                }
                else
                {
                    // Get the file size
                    int fileSize = FileUpload2.PostedFile.ContentLength;
                    // If file size is greater than 2 MB
                    if (fileSize > 2097152)
                    {
                        lblMessage0.ForeColor = System.Drawing.Color.Red;
                        lblMessage0.Text = "File size cannot be greater than 2 MB";
                    }
                    else
                    {

                        //// Upload the file
                        FileUpload2.SaveAs(Server.MapPath("./TRANSCRIPT/" + FileUpload2.FileName));
                        filename2 = FileUpload2.FileName;
                        lblMessage0.ForeColor = System.Drawing.Color.Green;
                        lblMessage0.Text = "File uploaded successfully";

                    }
                }
            }

            else
            {
                lblMessage0.ForeColor = System.Drawing.Color.Red;
                lblMessage0.Text = "Please select a file";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            

            string pdfPath = Server.MapPath("./TRANSCRIPT/" + filename2);
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(pdfPath);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", buffer.Length.ToString());
            Response.BinaryWrite(buffer);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}
