using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KLinkedU
{
    public partial class Subscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = "Please subscribe to premium account for contact information of student";
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
    }
}