<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Update_University.aspx.cs" Inherits="KLinkedU.Update_University" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">

            <div style="border: double; padding-left: 3%; padding-top: 3%; width: auto; height: auto">
                <h3 style="font-weight: bold; font-size: large; color: darkblue; text-align: center">Update Profile</h3>
                First Name :
            <asp:TextBox ID="fname" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="false" Text="*" ControlToValidate="fname" ErrorMessage="Please enter the First Name"></asp:RequiredFieldValidator>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            Last Name :
            <asp:TextBox ID="lname" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" EnableClientScript="false" Text="*" ControlToValidate="lname" ErrorMessage="Please enter the Last Name"></asp:RequiredFieldValidator>
                <br />
                <br />


                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                UserID :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="uid" runat="server" ReadOnly="true"></asp:TextBox>


                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" EnableClientScript="false" Text="*" ControlToValidate="email" ErrorMessage="Please enter the Email ID"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" EnableClientScript="false" Text="*" ErrorMessage="Please Enter a Valid Email address"
                    ControlToValidate="email" ValidationExpression="^[a-z0-9A-Z]*[^@]+]*[@]{1}[a-z0-9A-Z]*[^@]+$"></asp:RegularExpressionValidator>

                <br />
                <br />

                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
                    <ContentTemplate>
                        <asp:Label ID="existOrNotLbl" runat="server" Text=""></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="uid" />
                    </Triggers>
                </asp:UpdatePanel>





                Password :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="pass" TextMode="Password" runat="server" Width="160px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" EnableClientScript="false" Text="*" ControlToValidate="pass" ErrorMessage="Please enter a password"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" EnableClientScript="false" Text="*" ErrorMessage="Password should be 8 characters long. With one Upper, one Lower and one Digit character"
                    ControlToValidate="pass" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"></asp:RegularExpressionValidator>



                Confirm Password :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="conf" TextMode="Password" runat="server" Width="160px"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" EnableClientScript="false" Text="*" ControlToValidate="conf" ControlToCompare="pass"></asp:CompareValidator>
                <br />
                <br />

                University Name :&nbsp;
            <asp:TextBox ID="uname" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" EnableClientScript="false" Text="*" ControlToValidate="uname" ErrorMessage="Please enter the University Name"></asp:RequiredFieldValidator>

                <br />
                <br />
                State :&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="state" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" EnableClientScript="false" Text="*" ControlToValidate="state" ErrorMessage="Please enter the State"></asp:RequiredFieldValidator>
                <br />


                &nbsp;<br />
                Country : 
                <asp:TextBox ID="country" runat="server" Text="USA" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="country" Text="*" EnableClientScript="false" ErrorMessage="Please Enter the Country"></asp:RequiredFieldValidator>
                <br />
                <br />

                Zipcode :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="zip" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Text="*" ControlToValidate="zip" EnableClientScript="false" ErrorMessage="Please enter the zip code"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" EnableClientScript="false" Text="*" ErrorMessage="Please Enter a Valid zipcode"
                    ControlToValidate="zip" ValidationExpression="^[\d]{5}([-][\d]{4})?$"></asp:RegularExpressionValidator>
                <br />
                <br />

                Minimum ACT Score :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="act" runat="server" Width="160px"></asp:TextBox>
                / 36
<%--            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="act" EnableClientScript="false" MinimumValue="0" MaximumValue="36" ErrorMessage="Please Enter the score in valid range (0-36) "></asp:RangeValidator>--%>
                <br />
                <br />

                Minimum SAT Score :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="sat" runat="server" Width="160px"></asp:TextBox>
                / 1600
<%--            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="sat" EnableClientScript="false" MinimumValue="0" MaximumValue="1600" ErrorMessage="Please Enter the score in valid range (0-1600) "></asp:RangeValidator>--%>
                <br />
                <br />

                University Website URL :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="web_url" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="web_url" EnableClientScript="false" ErrorMessage="Please enter a the website URL"></asp:RequiredFieldValidator>
                <br />
                <br />



                Short Description
                
            <asp:TextBox ID="descrp" runat="server" TextMode="MultiLine"></asp:TextBox>
                <br />
                (Optional):
            <br />
                <br />

                <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />

                <asp:ValidationSummary ID="error" ForeColor="Red" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
