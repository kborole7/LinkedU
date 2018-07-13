<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProfileUpdate.aspx.cs" Inherits="KLinkedU.ProfileUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="column middle" style="padding-left: 3%; padding-top: 3%;">
            <div style="border: double; padding-left: 3%; padding-top: 3%; width: 500px; height: auto">
                <asp:Label ID="Label14" runat="server" Text="Update Your Profile:" Font-Size="XX-Large" ForeColor="darkblue"></asp:Label>

                <br />
                <asp:Label ID="Label1" runat="server" Text="Country"></asp:Label>
                &nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
                <br />

                <asp:Label ID="Label2" runat="server" Text="Zipcode"></asp:Label>
                &nbsp; 
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a Valid 5 digit ZipCode*" ForeColor="Red" ControlToValidate="TextBox2" ValidationExpression="^\d{5}$"></asp:RegularExpressionValidator><br />
                <br />


                <asp:Label ID="Label3" runat="server" Text="About Me"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="TextBox3" runat="server" Height="170px" Width="352px" TextMode="MultiLine"></asp:TextBox><br />
                <br />

                <asp:Label ID="Label4" runat="server" Text="Skills"></asp:Label>
                &nbsp;<br />
                <asp:TextBox ID="TextBox4" runat="server" Height="61px" Width="297px" TextMode="MultiLine"></asp:TextBox><br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="ACT Score"></asp:Label>
                &nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>&nbsp;/ 36<br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="SAT Score"></asp:Label>
                &nbsp;
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>&nbsp;/ 1600<br />
                <br />
                &nbsp;
                        <asp:Label ID="Label8" runat="server" Text="Last Degree Earned"></asp:Label>
                &nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Associate's Degree</asp:ListItem>
                <asp:ListItem>Bachelor's Degree</asp:ListItem>
                <asp:ListItem>Master's Degree</asp:ListItem>
                <asp:ListItem>Doctoral Degree</asp:ListItem>

            </asp:DropDownList>
                <br />
                <br />

                <asp:Label ID="Label9" runat="server" Text="Major"></asp:Label>
                &nbsp;
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox><br />
                <br />
                <asp:Label ID="Label10" runat="server" Text="Minor"></asp:Label>
                &nbsp;
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox><br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="High School Name"></asp:Label>
                &nbsp;
            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox><br />
                <br />
                <br />
                <br />


                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" Height="50px" Width="100px" /><br />
                <br />
            </div>
            <br />
            <br />
        </div>
        <br /><br />
    <//div>
     <br /><br />
    
</asp:Content>

