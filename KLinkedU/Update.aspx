<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="KLinkedU.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">   
        <div class="column middle" style="padding-left:3%; padding-top:3% ;">

            <div  style="border:double; padding-left:3%; padding-top:3% ; width:450px; height:auto"  >
            <h3 style="font-weight:bold; font-size:large; color:darkblue; text-align:center" >Update Profile</h3>

              <p style="margin-left: 40px">
                  1. First Name:&nbsp;
                    <asp:TextBox ID="UTextBox1" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="UTextBox1"></asp:RequiredFieldValidator>
                </p>
                <p style="margin-left: 40px">
                    2. Last Name:&nbsp;
                    <asp:TextBox ID="UTextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="UTextBox2"></asp:RequiredFieldValidator>
                </p>
                <p style="margin-left: 40px">
                    3. UserID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="UTextBox3" runat="server"  ReadOnly="true"></asp:TextBox>                 &nbsp;&nbsp;&nbsp;     
                  

                <p style="margin-left: 40px">
                    4. Password:&nbsp;&nbsp;

                    <asp:TextBox ID="UTextBox4" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="UTextBox4"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" EnableClientScript="false"  ErrorMessage="Password should be 8 characters long. With one Upper, one Lower and one Digit character"
                    ControlToValidate="UTextBox4" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"></asp:RegularExpressionValidator>
                </p>
                <p style="margin-left: 40px">
                    5. Confirm Password:&nbsp;
                    <asp:TextBox ID="UTextBox5" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="UTextBox4" ControlToValidate="UTextBox5" ErrorMessage="Passwords Dont Match**"></asp:CompareValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                </p>
                <p style="margin-left: 40px">
                    6. Email:&nbsp;
                    <asp:TextBox ID="UTextBox6" runat="server" Width="159px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UTextBox6" ErrorMessage="Incorrect format**" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                </p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="UTextBox6"></asp:RequiredFieldValidator>
                <p style="margin-left: 40px">


                    7. Security Question:&nbsp;
                    <asp:TextBox ID="UTextBox7" runat="server" Width="203px"></asp:TextBox>
                </p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="UTextBox7"></asp:RequiredFieldValidator>
                <p style="margin-left: 40px">
                    8.Security Answer:&nbsp;
                    <asp:TextBox ID="UTextBox8" runat="server" Width="128px"></asp:TextBox>
                </p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field cannot be Blank**" ControlToValidate="UTextBox8"></asp:RequiredFieldValidator>
              <br />
            <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="UpdateBtn" runat="server" Text="Next" OnClick="Button3_Click" Height="40px" Width="150px" /><br /><br />
                               </div>
        </div>
        </div>
    <br /><br />
     </asp:Content>