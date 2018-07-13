<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KLinkedU.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Signinstyle.css" rel="stylesheet" type="text/css" />
    <link href="./css/toolkit.css" rel="stylesheet" />

    <title></title>
    <script type="text/javascript">
        function RefreshUpdatePanel() {
            __doPostBack('UpdatePanel1', '');
        };
    </script>
    <style type="text/css">
        .auto-style2 {
            font-size: larger;
        }

        .auto-style3 {
            background-color: #33CCFF;
        }

        .auto-style4 {
            background-color: #66CCFF;
        }

        .auto-style5 {
            background-color: #000000;
        }

        .auto-style6 {
            background-color: #99CCFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" method="get">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div class="header" align="center" style="font-size: xx-large; align-items: center; font-family: 'Imprint MT Shadow'; color: white">
                    <span class="auto-style2">Linked<strong><span class="auto-style3">U</span></strong></span>
                </div>


                <div class="main">


                    <asp:Image ID="Image1" CssClass="imgclass" align="left" src="Collage.jpg" alt="kpborol" Height="100%" runat="server" Width="100%" />
                    <div class="block">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Style="font-size: 40px" Text="Be great at what you do "></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Style="font-size: 20px" Text="Get started - it's free. "></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="S">Student</asp:ListItem>
                            <asp:ListItem Value="R">Recruiter</asp:ListItem>
                            <asp:ListItem Value="A">Admin</asp:ListItem>

                        </asp:DropDownList>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="user" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;
                <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Sign in" OnClick="Button1_Click" />
                        &nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Forgot Password?</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Don't have an account?"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
                
                
                <asp:Button ID="Button2" runat="server" Text="Sign up" OnClick="Button2_Click" />
                    </div>
                </div>
                <div class="lower">
                    <br />
                    <br />
                    &nbsp; Linked<span class="auto-style4">U</span><span class="auto-style5"> </span>© 2017&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; User Agreement&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Privacy Policy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Community Guidelines&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cookie Policy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Copyright Policy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Language: English (US)

                </div>




            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="header" align="center" style="font-size: xx-large; align-items: center; font-family: 'Imprint MT Shadow'; color: white">
                    <span class="auto-style2">Linked<strong><span class="auto-style3">U</span></strong></span>
                </div>
                <script type="text/javascript">
                    var width = 0;
                    function frame() {

                        var elem = document.getElementById("prog");

                        if (width >= 88.88) {
                            width = 100;
                            elem.style.width = 100 + '%';
                            document.getElementById('Label7').innerHTML = 100 + "% Complete";

                            clearInterval(id);

                        }
                        else {
                            width += 11.11;
                            elem.style.width = width + '%';
                            document.getElementById('Label7').innerHTML = width + "% Complete";
                        }

                    }

                </script>

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <br />
                <br />
                <div class="signupform">
                    <h2>&nbsp;</h2>
                    <h2>Fill the form to Create an account in Linked<span class="auto-style6">U</span></h2>
                    <br />

                    <div style="padding-right: 3%; width: 95%">
                        <div id="prog" class="progress-bar-info progress-bar-striped" style="width: 0%; max-width: 100%; text-align: center; height: 20px; border: double; height: 10%">
                            <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. First Name:&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" onchange="Javascript: frame();"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. Last Name:&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" onchange="Javascript: frame();"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. UserID:&nbsp;
                    <asp:TextBox ID="UserIDTBox" runat="server" onkeyup="RefreshUpdatePanel();" OnTextChanged="processTextChanged" onchange="Javascript: frame();"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="UserIDTBox"></asp:RequiredFieldValidator>
                    &nbsp;
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
                <ContentTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="existOrNotLbl" runat="server" Text=""></asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="UserIDTBox" />
                </Triggers>
            </asp:UpdatePanel>

                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4. Password:&nbsp;&nbsp;

                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" onchange="Javascript: frame();"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" EnableClientScript="false" ErrorMessage="Password should be 8 characters long. With one Upper, one Lower and one Digit character"
                        ControlToValidate="TextBox4" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5. Confirm Password:&nbsp;
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" onchange="Javascript: frame();"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="Passwords Dont Match**"></asp:CompareValidator>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="This field cannot be Blank**"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6. Email:&nbsp;
                    <asp:TextBox ID="TextBox6" runat="server" onchange="Javascript: frame();"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" EnableClientScript="false" ControlToValidate="TextBox6" ErrorMessage="Incorrect format**" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7. Phone Number:
                    <asp:TextBox ID="number" runat="server" onchange="Javascript: frame();"></asp:TextBox>
                    &nbsp;eg. 13092054546<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="number" ErrorMessage="Please Enter a Phone Number"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8. Security Question:&nbsp;
                   <asp:TextBox ID="TextBox7" runat="server" onchange="Javascript: frame();"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="This field cannot be Blank**"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9.Security Answer:&nbsp;
                    <asp:TextBox ID="TextBox8" runat="server" onchange="Javascript: frame();"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="TextBox8"></asp:RequiredFieldValidator>
                    <br />


                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Next" OnClick="Button3_Click" Style="height: 40px; width: 120px" /><br />
                    <br />
                    <br />
                </div>
            </asp:View>

        </asp:MultiView>

    </form>
</body>
</html>
