<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="KLinkedU.ChangePassword" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">--%>
           
<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    </head>

<body>
    <form id="form1" runat="server">
<div style="border: double; padding-left: 3%; padding-top: 3%; width: 500px; height: auto">
                <h3 style="font-weight: bold; font-size: large; color: darkblue; text-align: center">Reset Your Pasword Here:</h3>
                <br />
                <asp:Label ID="Label1" runat="server" Text="New Password:"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox><br />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Confirm Password"></asp:Label><br />
                <br />
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>

                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match**" ForeColor="Red" ControlToCompare="TextBox1" ControlToValidate="TextBox2"></asp:CompareValidator>
                <br />
                <br />


                <asp:Button ID="Button1" runat="server" Text="Reset Password" OnClick="Button1_Click" /><br />
                <br />

                <asp:Label ID="Label3" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" />
                <br />

            </div>



        <br />
        </form>


</body>


    </html>

    <%--    </div>
    </div>
    
      </asp:Content>--%>