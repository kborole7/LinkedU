<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_University.aspx.cs" Inherits="KLinkedU.Add_University" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add University</title>
    <%--<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'/>--%>
    <link href="./css/toolkit.css" rel="stylesheet" />
    <link href="Signinstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        var width = 0;
        function frame() {

            var elem = document.getElementById("prog");

            if (width >= 100) {
                clearInterval(id);
            } else {
                width += 10;
                elem.style.width = width + '%';
                document.getElementById('Label1').innerHTML = width + "% Complete";
            }

        }

        
    </script>

    <script type="text/javascript">
        function RefreshUpdatePanel() {
            __doPostBack('UpdatePanel1', '');
        };
    </script>

</head>

<body>
    <div class="header" align="center" style="font-size: xx-large; align-items: center; font-family: 'Imprint MT Shadow'; color: white">
        <span class="auto-style2">Linked<strong><span class="auto-style3">U</span></strong></span>
    </div>


    <form id="form1" runat="server" method="post">
        <div class="signupform">
            <h2 style="color:darkblue">Add University</h2>

            <div style="padding-right: 3%; width: 95%">
                <div id="prog" class="progress-bar-info progress-bar-striped" style="width: 0%; max-width: 100%; text-align: center; height: 20px; border: double; height: 10%">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <br />
            <br />
            First Name :
            <asp:TextBox ID="fname" runat="server" Width="160px" onchange="Javascript: frame();"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="false" Text="*" ControlToValidate="fname" ErrorMessage="Please enter the First Name"></asp:RequiredFieldValidator>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name :
            <asp:TextBox ID="lname" runat="server" Width="160px" onchange="Javascript: frame();"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" EnableClientScript="false" Text="*" ControlToValidate="lname" ErrorMessage="Please enter the Last Name"></asp:RequiredFieldValidator>
            <br />
            <br />


            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            UserID :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="uid" runat="server" Width="160px" onchange="Javascript:frame();" onkeyup="Javascript:RefreshUpdatePanel();" OnTextChanged="processTextChanged" ></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" EnableClientScript="false" Text="*" ControlToValidate="uid" ErrorMessage="Please enter the User ID"></asp:RequiredFieldValidator>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Email :&nbsp;
            <asp:TextBox ID="email" runat="server" Width="180px" onchange="Javascript: frame();"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" EnableClientScript="false" Text="*" ControlToValidate="email" ErrorMessage="Please enter the Email ID"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" EnableClientScript="false" Text="*" ErrorMessage="Please Enter a Valid Email address"
                ControlToValidate="email" ValidationExpression="^[a-z0-9A-Z]*[^@]+]*[@]{1}[a-z0-9A-Z]*[^@]+$"></asp:RegularExpressionValidator>

            <br />

            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
                <ContentTemplate>
                    <asp:Label ID="existOrNotLbl" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="uid" />
                </Triggers>
            </asp:UpdatePanel>




            Password :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="pass" TextMode="Password" Width="160px" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" EnableClientScript="false" Text="*" ControlToValidate="pass" ErrorMessage="Please enter a password"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;
             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" EnableClientScript="false" Text="*" ErrorMessage="Password should be 8 characters long. With one Upper, one Lower and one Digit character"
                 ControlToValidate="pass" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"></asp:RegularExpressionValidator>

            Confirm Password :&nbsp;<asp:TextBox ID="conf" TextMode="Password" Width="160px" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" EnableClientScript="false" Text="*" ControlToValidate="conf" ControlToCompare="pass"></asp:CompareValidator>
            <br />
            <br />

            University Name :&nbsp;
            <asp:TextBox ID="uname" runat="server" Width="180px" onchange="Javascript: frame();"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" EnableClientScript="false" Text="*" ControlToValidate="uname" ErrorMessage="Please enter the University Name"></asp:RequiredFieldValidator>

            <br />
            <br />
            State :&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="state" runat="server" Width="160px" onchange="Javascript: frame();"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" EnableClientScript="false" Text="*" ControlToValidate="state" ErrorMessage="Please enter the State"></asp:RequiredFieldValidator>
            <br />


            &nbsp;<br />
            Country : 
                <asp:TextBox ID="country" runat="server" Width="160px" Text="USA"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="country" Text="*" EnableClientScript="false" ErrorMessage="Please Enter the Country"></asp:RequiredFieldValidator>
            <br />
            <br />

            Zipcode :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="zip" runat="server" Width="160px" onchange="Javascript: frame();"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Text="*" ControlToValidate="zip" EnableClientScript="false" ErrorMessage="Please enter the zip code"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" EnableClientScript="false" Text="*" ErrorMessage="Please Enter a Valid zipcode"
                ControlToValidate="zip" ValidationExpression="^[\d]{5}([-][\d]{4})?$"></asp:RegularExpressionValidator>
            <br />
            <br />

            Minimum ACT Score :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="act" runat="server" Width="160px" onchange="Javascript: frame();"></asp:TextBox>
            &nbsp;/ 36
            
            <%--<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="act" EnableClientScript="false" Text="*" MinimumValue="0" MaximumValue="36" ErrorMessage="Please Enter the score in valid range (0-36) "></asp:RangeValidator>--%>
            <br />
            <br />

            Minimum SAT Score :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="sat" runat="server" Width="160px" onchange="Javascript: frame();"></asp:TextBox>
            &nbsp;/ 1600
<%--            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="sat" Text="*" MinimumValue="0" MaximumValue="1600" EnableClientScript="false" ErrorMessage="Please Enter the score in valid range (0-1600) "></asp:RangeValidator>--%>
            <br />
            <br />

            University Website URL :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="web_url" runat="server" Width="180px" onchange="Javascript: frame();"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Text="*" ControlToValidate="web_url" EnableClientScript="false" ErrorMessage="Please enter a the website URL"></asp:RequiredFieldValidator>
            <br />
            <br />

            Image :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;&nbsp;
            <asp:Label ID="upld_status" runat="server" Text=""></asp:Label>
            <br />
            <br />

            Short Description 
            <textarea id="descr" name="descr" cols="20" rows="2" runat="server"></textarea><br />
            (Optional):
            <br />
            <br />

            <asp:Button ID="Submit" runat="server" CssClass="btn-info" Text="Submit" OnClick="Submit_Click" />

            <br />
            <br />
            <asp:Label ID="sqlerr" runat="server" Text=""></asp:Label>

            <asp:ValidationSummary ID="error" ForeColor="Red" runat="server" />
        </div>
    </form>
</body>
</html>







