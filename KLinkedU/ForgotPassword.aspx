<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="KLinkedU.ForgotPassword" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
       * {
    box-sizing: border-box;
}

body {
  margin: 0;
  background-color:aliceblue;
}
        .header {
           
    background-color: #F1F1F1;
    text-align: center;
    padding: 20px;
}
      /* Style the top navigation bar */
.topnav {
    overflow: hidden;
    background-color: black;
}

/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}
.row{
    min-height:100vh;
}
.column {
    float: left;
}

/* Left and right column */
.column.side {
    width: 20%;
   
}

/* Middle column */
.column.middle {
    width: 50%;
}
.row:after {
    content: "";
    display: table;
    clear: both;
}

.footer {
    background-color: black;
    text-align: center;
    padding: 10px;
   color:white;
}
    </style>
</head>

<body>
    <form id="form1" runat="server">
        
        <div class="header"> LinkedU</div>
        <div class="row">
            <div class="column middle" style="padding-left: 3%; padding-top: 3%;">

                <asp:Label ID="FPLabel3" runat="server"></asp:Label><br />
                <asp:Label ID="FPLabel4" runat="server"></asp:Label><br />
                <br />
                <div style="border: double; padding-left: 3%; padding-top: 3%; width: 500px; height: auto">

                    <h3 style="font-weight: bold; font-size: large; color: darkblue; text-align: center">Reset Your Pasword Here:</h3>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Let's find your account" Font-Bold="true" Font-Size="Large"></asp:Label><br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Please enter your email" Font-Size="Large"></asp:Label><br />
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Width="377px" Height="26px" Style="margin-top: 0px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter a email*" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Incorrect Email format*" ForeColor="Red" ControlToValidate="TextBox1" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Send SMS" Font-Size="Large" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CausesValidation="False" BackColor="darkblue" Style="color: #FFFFFF; font-size: large; text-align: center;" />
                    <br />
                    <br />
                </div>
                <br />
                <br />
                <div id="entercode" style="visibility: hidden; height: auto; width: 500px; border: double;" runat="server">
                    <asp:Label ID="Label5" runat="server" Text="Enter the Verification Code here:"></asp:Label><br />
                    <br />
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a Validation Code*" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><br />
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Verify" OnClick="Button2_Click" /><br />
                    <br />
                    <asp:Label ID="Label6" runat="server"></asp:Label>

                </div>
            </div>
        </div>
        <br />
        </form>


</body>


    </html>
