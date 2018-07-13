<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Changedp.aspx.cs" Inherits="KLinkedU.Changedp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Signinstyle.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body style="background-color:aliceblue">
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" /><br />
            <br />
            <asp:Button ID="Button1" runat="server"  Text="Upload" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Button ID="Remove" runat="server" Text="Remove Profile Picture" OnClick="Remove_Click" />
        </div>
    </form>
</body>
</html>
