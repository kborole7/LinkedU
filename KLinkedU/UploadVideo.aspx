<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadVideo.aspx.cs" Inherits="KLinkedU.UploadVideo" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Signinstyle.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body style="background-color:aliceblue">
    <form id="form1" runat="server">
        <div> 
            Mention genre/s of your video here:<br />
                    <asp:TextBox ID="Genre" runat="server" Width="211px"></asp:TextBox>*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter genre/s of video" ControlToValidate="Genre" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    Upload your videos/ images here:
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" /><br />
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
                    <br />
            
      
        </div>
    </form>
</body>
</html>
